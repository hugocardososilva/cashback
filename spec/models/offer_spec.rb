require 'rails_helper'

RSpec.describe Offer, type: :model do
  before(:all) do
    @offer = create(:offer)
  end
  context "Validations" do
    it 'is a valid offer create' do
      expect(@offer).to be_valid
    end
    it 'is not valid a offer with same advertiser_name' do
      some_offer = build(:offer, advertiser_name: @offer.advertiser_name)
      expect(some_offer).to_not be_valid
    end
    it 'is not valid because required advertiser_name' do
      some_offer = build(:offer, advertiser_name: nil)
      expect(some_offer).to_not be_valid
    end
    it 'is not valid because required url' do
      some_offer = build(:offer, url: nil)
      expect(some_offer).to_not be_valid
    end
    it 'is not valid because not url' do
      some_offer = build(:offer, url: 'noturlsample')
      expect(some_offer).to_not be_valid
    end
    it 'is not valid because required description' do
      some_offer = build(:offer, description: nil)
      expect(some_offer).to_not be_valid
    end
    it 'is not valid because required starts_at' do
      some_offer = build(:offer, starts_at: nil)
      expect(some_offer).to_not be_valid
    end
    it 'is not valid because description must be 500 maximum' do
      some_offer = build(:offer, description: Faker::Lorem.paragraphs(number:10))
      expect(some_offer).to_not be_valid
    end
    it 'is valid because starts_at is before ends_at' do
      some_offer = build(:offer, starts_at: Date.today, ends_at: Date.tomorrow)
      expect(some_offer).to be_valid
    end
    it 'is not valid because starts_at is after ends_at' do
      some_offer = build(:offer, starts_at: Date.tomorrow, ends_at: Date.today)
      expect(some_offer).to_not be_valid
    end
  end


end
