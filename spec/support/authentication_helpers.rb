module AuthenticationHelpers

  def sign_in(user)
    cookies[:user_id] = user.id
  end
  
  RSpec.configure do |c|
    c.include AuthenticationHelpers, type: :controller
  end
end
