module ControllerMethods
  def login
    before(:each) do
      @request.env['devise.mappings'] = Devise.mappings[:user]
      user = FactoryBot.create(:user, admin: true)
      sign_in user
    end
  end
end