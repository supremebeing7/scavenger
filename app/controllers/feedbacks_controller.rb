class FeedbacksController < ApplicationController

  def new
    @feedback = Feedback.new
  end

  def create
    @feedback = Feedback.create(email: params[:email], message: params[:message])
    respond_to do |format|
      format.html { redirect_to :back, notice: "Thanks for the feedback!" }
      format.js
    end
  end
end
