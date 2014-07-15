class StoriesController < ApplicationController
	def new
		@story = Story.new
	end

	def create
		@story = current_user.story.build(story_params)
		if 
			@story.save
			flash[:success] = "Story successfully created!"
			redirect_to root_url
		else
			flash[:error] = "Title can't be blank"
			redirect_to root_url
		end
	end

	def show
		@story = Story.find_by(id: params[:id])
	end

	# def index
	# 	@user = User.find_by(params[:id])
	# 	@stories = @user.story.all
	# end

	private

	def story_params
		params.require(:story).permit(:title)
	end

end
