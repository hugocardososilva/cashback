# frozen_string_literal: true

class Offer < ApplicationRecord
  include OfferAdmin
  validates :advertiser_name, :url, :description, :starts_at, presence: true
  validates :url, url: true
  validates :description, length: { maximum: 500 }
  validates :advertiser_name, uniqueness: true
  validate :starts_at_before_ends_at

  default_scope { order(premium: :desc) }
  scope :enabled,  lambda { select { |resource| resource.decorate.status == 'enabled' } }
  scope :disabled, lambda { select { |resource| resource.decorate.status == 'disabled' } }

  def disable!
    self.ends_at = DateTime.now
    save!
  end

  def enable!
    self.starts_at = DateTime.now
    self.ends_at = nil
    save!
  end

  private

  def starts_at_before_ends_at
    errors.add(:ends_at, 'must be after starts_at') if ends_at && starts_at&.after?(ends_at)
  end


end
