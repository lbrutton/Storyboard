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
            email:      "test@example.com",
            image: "https://fbcdn-profile-a.akamaihd.net/hprofile-ak-xfa1/t1.0-1/c8.0.50.50/p50x50/1912044_10203141837286751_969962963_n.jpg"
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
            name: "Mr Biggles",
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
            name: "Badman from the bronx",
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

    def create_sentences(story, user)
      i = 0
      4.times do
        Sentence.new(content:"#{i}something, something, dark siiiiide", user_id: user.id, story_id:story.id).save
        i = i + 1
      end
    end


end

