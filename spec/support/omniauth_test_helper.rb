require "rack_session_access/capybara"

def facebook_login_setup
  OmniAuth.config.test_mode = true
          OmniAuth.config.mock_auth[:facebook] = OmniAuth::AuthHash.new({
          provider: 'facebook',
          uid: '123545',
          info: {
            name: "Mother Fucker",
            email:      "test@example.com"
          },
          credentials: {
            token: "123456",
            expires_at: Time.now + 1.week
          }
          })
          mock_auth = OmniAuth.config.mock_auth[:facebook]
          @user = User.create(name: mock_auth.info.name, email: mock_auth.info.email)
          @user
end

def sign_in(user)
  page.set_rack_session(user_id: @user.id)
end

def sign_out
  page.set_rack_session(user_id: nil)
end
