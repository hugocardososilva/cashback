require 'rails_helper'

RSpec.describe User, type: :model do
  before(:all) do
    @user = create(:user)
    @admin = create(:user, admin: true)
  end
  context "Validations" do
    it 'is avalid user create' do
      expect(@user).to be_valid
    end
    it 'is a valid admin create' do
      expect(@admin).to be_valid
    end
   it "has a unique email" do
     some_user = build(:user, email: @user.email)
      expect(user2).to_not be_valid
    end

    it "is not valid without a password" do
      some_user = build(:user, password: nil)
      expect(user2).to_not be_valid
    end

    it "is not valid without an email" do
      some_user = build(:user, email: nil)
      expect(user2).to_not be_valid
    end

  end

  end
