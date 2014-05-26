class FeedbackMailer < ActionMailer::Base
  default from: "feedback@scavenger.com"

  def new_feedback(submission)
    @submission = submission
    mail to: ENV['ADMIN_EMAIL_ADDRESS'], reply_to: @submission.email, subject: "New Feedback!"
  end
end
