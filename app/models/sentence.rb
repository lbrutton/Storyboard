class Sentence < ActiveRecord::Base
	belongs_to :user
	belongs_to :story
	validates :validated, default: false
end
