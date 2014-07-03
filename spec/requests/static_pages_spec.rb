require 'spec_helper'

describe "The StaticPages" do

	describe "Home page" do

		it "should have the right content" do	
			visit root_path		
			expect(page).to have_content('Welcome to Storyboard')
		end

		it "should have the right title" do
			visit root_path
			expect(page).to have_title('Storyboard | Home')
		end
	end

	describe "Help page" do

		it "should have the right content" do
			visit help_path
			expect(page).to have_content('Help')
		end

		it "should have the right title" do
			visit help_path
			expect(page).to have_title('Storyboard | Help')
		end
	end

	describe "About page" do

		it "should have the right content" do
			visit about_path
			expect(page).to have_content('About')
		end

		it "should have the right title" do
			visit about_path
			expect(page).to have_title('Storyboard | About')
		end
	end
end
