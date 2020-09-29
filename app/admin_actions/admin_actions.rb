module AdminActions
  module OfferActions
    class DisableOffer < RailsAdmin::Config::Actions::Base
      register_instance_option(:member) {true}
      register_instance_option(:link_icon) { 'icon-lock' }

      register_instance_option :controller do
        Proc.new do
          @object.disable!
          flash[:notice] = 'Offer was successfully disabled.'
          redirect_to index_path
        end
      end
    end
    class EnableOffer < RailsAdmin::Config::Actions::Base
      register_instance_option(:member) { true }
      register_instance_option(:link_icon) { 'icon-check' }

      register_instance_option :controller do
        Proc.new do
          @object.enable!
          flash[:notice] = 'Offer was successfully y enabled.'
          redirect_to index_path
        end
      end
    end
  end
end