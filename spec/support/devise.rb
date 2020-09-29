require_relative './controller_methods'

RSpec.configure do |config|
  config.include Devise::Test::ControllerHelpers, type: :controller

  config.extend ControllerMethods, type: :controller
end