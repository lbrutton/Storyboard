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
				click_button('Start my story')
			end

			it {should have_content("Title can't be blank")} 

			before do
				visit '/stories/new'
				fill_in 'story[title]', with: 'Pulp Fiction 2'
				click_button('Start my story')
			end

			it {should have_content('Story successfully created!')}

		end

	end
end