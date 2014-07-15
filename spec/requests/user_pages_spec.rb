require 'spec_helper'
require 'pp'
require "rack_session_access/capybara"

describe "UserPages" do
	subject { page }

	describe "profile page" do

		before do
		  		facebook_login_setup
		      	sign_in(@user)
		end

		context "for the current user" do

			before {visit user_path(@user)}
			
		     it {should have_content(@user.name)}
		     it {should have_content(@user.image)}

		     it {should have_link("Start a new story") }
		     xit {should have_link("Continue story", href: continue_path) }
		     xit {should have_link("See other stories", href: users_path)}
		 end

		 context "for other users" do

		 	before do
		 		create_users
		 		visit user_path(@user2)
		 	end

		 	it {should have_content(@user2.name)}
		 end
	end  

	describe "users page" do
		before do
			create_users
			visit users_path
		end

		it "should show all users" do
			@users.each do |user|
				expect(page).to have_content(user.name)
			end
		end

		it "should have the right links for each user" do
			@users.each do |user|
				expect(page).to have_link('See stories')
			end
		end
	end
end
