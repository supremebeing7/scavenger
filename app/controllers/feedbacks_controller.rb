class FeedbacksController < ApplicationController

  def new
    @feedback = Feedback.new
  end

  def create
    @feedback = Feedback.create(email: params[:email], message: params[:message])
    flash[:success] = "Thanks for the feedback!"
    redirect_to root_path
  end
end
