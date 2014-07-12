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
	     it "should have the right content" do
	     	visit user_path(@user)
	     	expect(page).to have_content(@user.name) 
	     	expect(page).to have_content(@user.image)
	     	pp @user
	     end
	end  
end
