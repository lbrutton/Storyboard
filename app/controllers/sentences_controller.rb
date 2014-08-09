class SentencesController < ApplicationController
  def create
  	@sentence = current_user.sentences.build(sentence_params)
  	@sentence.story_id = current_story.id
  	@sentence.save
  	redirect_to current_story
  end

	private

	def sentence_params
		params.require(:sentence).permit(:content)
	end

end
