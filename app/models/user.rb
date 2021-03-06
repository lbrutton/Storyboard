class User < ActiveRecord::Base
	before_save { self.email = email.downcase }
	validates :name, presence:true, length: {maximum: 50}
	VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
	validates :email, presence:true, format: {with: VALID_EMAIL_REGEX}, uniqueness: {case_sensitive: false}
	has_many :story
	has_many :sentences
	def self.create_with_omniauth(auth)
		create! do |user|
			user.provider = auth.provider
			user.uid = auth.uid
			user.name = auth.info.name
			user.email = auth.info.email
			user.image = auth.info.image
		end
	end
end
