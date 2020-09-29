require 'rails_helper'

RSpec.describe OfferDecorator do
  context "Decorator" do
    it 'status is enabled with time to disabled' do
      decorator = create(:offer).decorate
      expect(decorator.status).to eq('enabled')
    end
    it 'status is enabled with no time to disabled' do
      decorator = create(:offer, ends_at: nil).decorate
      expect(decorator.status).to eq('enabled')
    end
    it 'status is disabled ' do
      decorator = create(:offer, starts_at: Date.tomorrow).decorate
      expect(decorator.status).to eq('disabled')
    end
    it 'status is enabled? ' do
      decorator = create(:offer).decorate
      expect(decorator.enabled?).to eq(true)
    end
  end
end
