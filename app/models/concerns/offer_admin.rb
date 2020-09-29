module OfferAdmin
  extend ActiveSupport::Concern

  included do
    rails_admin do
      list do
        field :advertiser_name
        field :url
        field :status do
          formatted_value do
            OfferDecorator.decorate(bindings[:object]).status
          end
        end
      end
    end
  end
end