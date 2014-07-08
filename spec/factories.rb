FactoryGirl.define do
  factory :user do #tells FactoryGirl that the definition is for a user model object
    name     "Michael Hartl"
    email    "michael@example.com"
    password "foobar"
    password_confirmation "foobar"
  end
end