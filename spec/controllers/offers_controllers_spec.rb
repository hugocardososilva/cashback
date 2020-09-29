require 'rails_helper'
require 'support/devise'

RSpec.describe OffersController, type: :controller do
  describe 'GET ' do
    context 'anonimous user' do
      it 'should and return 200' do
        get :index
        expect(response).to have_http_status(:success)
      end

    end

  end

end
