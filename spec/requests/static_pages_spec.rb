require 'spec_helper'

describe "The StaticPages" do

	describe "Home page" do

		before {visit root_path}

		it "should have the right content" do	
			expect(page).to have_content('Welcome to Storyboard')
		end

		it "should have the right title" do
			expect(page).to have_title('Storyboard | Home')
		end

		context "for signed in users" do
			before do
				facebook_login_setup
				sign_in @user
				visit root_path
			end

			it "should show the user's profile" do
				expect(page).to have_content(@user.name)
			end

			it "should have a link to sign out" do
				expect(page).to have_link("Sign out")
			end
		end

		context "for non signed-in users" do
			before do
				sign_out
			end

			it "should not have a link to sign out" do
				expect(page).not_to have_link("Sign out")
			end

			it "should not show the user's profile" do
				expect(page).not_to have_content("Mother Fucker")
			end
		end
	end

	describe "Help page" do

		before {visit help_path}

		it "should have the right content" do
			expect(page).to have_content('Help')
		end

		it "should have the right title" do
			expect(page).to have_title('Storyboard | Help')
		end
	end

	describe "About page" do

		before {visit about_path}

		it "should have the right content" do
			expect(page).to have_content('About')
		end

		it "should have the right title" do
			expect(page).to have_title('Storyboard | About')
		end
	end
end
