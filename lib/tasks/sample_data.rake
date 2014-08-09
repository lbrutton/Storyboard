namespace :db do
  desc "Fill database with sample data"
  task populate: :environment do
    
    users = User.all
    users.each do |user|
      content = Faker::Lorem.sentence(1)
      user.story.create(title: content)
    end
  end

end