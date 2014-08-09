require 'spec_helper'
require 'pp'
require "rack_session_access/capybara"

describe "Story pages:" do 

	subject {page}

	describe "New story page" do
		before do
			facebook_login_setup
			sign_in(@user)
			visit 'stories/new'
		end

		it {should have_content('Title')}

		before do
			fill_in "story[title]", with: 'Pulp Fiction 2'
		end

		it "should create a story" do
			
			expect do
				click_button('Start my story')
			end.to change(Story, :count).by(1)
		end

		context "should have the right flash messages" do

			before do
				visit '/stories/new'
				click_button('Start my story')
			end

			#it {should have_content("Title can't be blank")} 

			before do
				visit '/stories/new'
				fill_in 'story[title]', with: 'Pulp Fiction 2'
				click_button('Start my story')
			end

			it {should have_content('Story successfully created!')}

		end

	end

	describe "other users' story pages" do
		before do
			facebook_login_setup
			sign_in(@user)
			create_users
			
			user = User.find(2)
			create_stories(user)
			@stories2 = user.story.load
			visit user_path(2)
		end

		it {should have_content('Stories')}
		it {should have_link('Contribute')}

		it "should list all the user's stories" do

			@stories2.each do |story|
				expect(page).to have_content(story.title)
			end
		end

		context " - the actual pages should have the right content:" do

			before do
				@story = @stories2.first
				visit story_path(@story)
				create_sentences(@story, @user)
			end

			it {should have_content(@story.title)}
			it {should have_content('Get creative here')}
			it {should have_content(@user.image)}
		end

	end

	describe "the page with all the users' stories" do

		before do
			facebook_login_setup
			sign_in(@user)
			create_users
			visit users_path
		end

		it {should_not have_content(@user.name)}

	end





end