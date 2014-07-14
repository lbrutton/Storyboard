require 'spec_helper'

describe Story do
  it {should respond_to(:title)}
  it {should respond_to(:user_id)}
  it {should respond_to(:user)}

  context "when title is not present" do
  	before do
  		story = Story.new
  	end

  	it {should_not be_valid}

  end
end
