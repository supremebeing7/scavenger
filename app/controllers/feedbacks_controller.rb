class FeedbacksController < ApplicationController

  def new
    @feedback = Feedback.new
  end

  def create
    @feedback = Feedback.create(email: params[:email], message: params[:message])
    redirect_to :back, notice: "Thanks for the feedback!"
  end

  private

  def feedback_params
    params.require(:feedback).permit(:email, :message)
  end
end
