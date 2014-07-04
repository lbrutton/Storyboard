require 'spec_helper'

describe "UserPages" do
	subject { page }
	describe "sign up page" do
		before {visit signup_path}

		it {should have_content('Sign up')}
		it {should have_title('Storyboard | Sign up')}
	end
  
end
