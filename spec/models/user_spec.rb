require 'spec_helper'

describe User do

	before { @user = User.new(name: "Louis", email: "louisbrutton@gmail.com") }
	subject { @user }

	it { should respond_to(:name) }
	it { should respond_to(:email) }
	it { should respond_to(:provider)}
	it { should respond_to(:uid) }
	it { should respond_to(:image) }
	it { should respond_to(:sentence)}
	it { should be_valid }


	describe "when name is not present" do
		before { @user.name = "" }
		it { should_not be_valid }
	end

	describe "when email is not present" do
		before { @user.email = "" }
		it { should_not be_valid }
	end

	describe "when name is too long" do
		before { @user.name = "a" * 51 }
		it { should_not be_valid }
	end

	describe "when email format is invalid" do
		it "should not be valid " do
			addresses = %w[something@example,com bla@something fuckyou]
			addresses.each do |invalid_address|
				@user.email = invalid_address
				expect(@user).not_to be_valid
			end
		end
	end

	describe "when email format is valid" do
		it "should be valid " do
			addresses = %w[something@example.com bla_bla@something.com fuckyou@fuckyou.com]
			addresses.each do |invalid_address|
				@user.email = invalid_address
				expect(@user).to be_valid
			end
		end
	end

	describe "when email is already taken" do
		before do
			user_with_same_email = @user.dup
			user_with_same_email.email = @user.email.upcase
			user_with_same_email.save
		end

		it { should_not be_valid }
	end
end


