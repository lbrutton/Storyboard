namespace :db do
  desc "Fill database with sample data"
  task populate: :environment do
    
    users = User.all
    users.each do |user|
      content = Faker::Lorem.sentence(1)
      user.story.create(title: content)
    end
  end

  task add_sentences: :environment do

    users = User.where(id: 2..4)
    louis = User.first
    story = louis.story.first
    users.each do |user|
      content = Faker::Lorem.sentence(1)
      Sentence.create(user_id: user.id, story_id: story.id, content: content)
    end
  end

end