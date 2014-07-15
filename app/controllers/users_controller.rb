class UsersController < ApplicationController
  def new
  end

  def show
  	@user = User.find(params[:id])
  end

  def index
  	@users = User.all
  end

  def storyindex
  	@user = User.find_by(params[:id])
  end

end
