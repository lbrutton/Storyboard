require 'spec_helper'

describe "StaticPages" do
	before {visit root_path}
		it "should have the right content" do
			
			expect(page).to have_content('Welcome to Storyboard')
		end
end
