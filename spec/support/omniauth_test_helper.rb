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

def create_users
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
          @user1 = User.create(name: mock_auth.info.name, email: mock_auth.info.email)

    OmniAuth.config.mock_auth[:facebook] = OmniAuth::AuthHash.new({
          provider: 'facebook',
          uid: '123546',
          info: {
            name: "Mother Fucker2",
            email:      "test2@example.com"
          },
          credentials: {
            token: "123457",
            expires_at: Time.now + 1.week
          }
          })
          mock_auth = OmniAuth.config.mock_auth[:facebook]
          @user2 = User.create(name: mock_auth.info.name, email: mock_auth.info.email)

    OmniAuth.config.mock_auth[:facebook] = OmniAuth::AuthHash.new({
          provider: 'facebook',
          uid: '123547',
          info: {
            name: "Mother Fucker3",
            email:      "test3@example.com"
          },
          credentials: {
            token: "123458",
            expires_at: Time.now + 1.week
          }
          })
          mock_auth = OmniAuth.config.mock_auth[:facebook]
          @user3 = User.create(name: mock_auth.info.name, email: mock_auth.info.email)
          @users = [@user1, @user2, @user3]
          @users
  end

    def create_stories(user)
      i = 0
      4.times do 
      user.story.build(title:"#{i} is a motherfucker baby, you don't know what he be blabbing about!").save
      i = i+1
    end


end

