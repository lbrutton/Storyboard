FactoryGirl.define do
  factory :user do #tells FactoryGirl that the definition is for a user model object
    name     "Tom Amdbbdehhjih Occhinosky"
    email    "tom_umoyaik_occhinosky@tfbnw.net"
    provider 'facebook'
    uid '100004224588098'
  end
end