# frozen_string_literal: true

class Offer < ApplicationRecord
  validates :advertiser_name, :url, :description, :starts_at, presence: true
  validates :url, url: true
  validates :description, length: { maximum: 500 }
  validates :advertiser_name, uniqueness: true
  validate :starts_at_before_ends_at

  scope :enabled, lambda {
    select { |resource| resource.status == 'enabled' }
  }
  scope :disabled, lambda {
    select { |resource| resource.status == 'disabled' }
  }

  def status
    if ends_at && DateTime.now.between?(starts_at, ends_at)
      'enabled'
    elsif DateTime.now.after?(starts_at) && ends_at.nil?
      'enabled'
    else
      'disabled'
    end
  end

  def enabled?
    true if status == 'enabled'
  end

  private

  def starts_at_before_ends_at
    errors.add(:ends_at, 'must be after starts_at') if ends_at && starts_at&.after?(ends_at)
  end

end
