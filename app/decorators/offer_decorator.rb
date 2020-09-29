class OfferDecorator < ApplicationDecorator
  delegate_all

  def status
    if ends_at && DateTime.now.between?(starts_at, ends_at)
      'enabled'
    elsif DateTime.now.after?(starts_at) && ends_at.nil?
      'enabled'
    else
      'disabled'
    end
  end

  def premium_offer
    'Premium' if premium
  end

  def enabled?
    true if status == 'enabled'
  end
end
