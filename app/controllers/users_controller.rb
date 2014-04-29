class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @crawls = Crawl.where(user_id: @user.id)
  end
end
