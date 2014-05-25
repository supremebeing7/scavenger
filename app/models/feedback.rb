class Feedback
  attr_reader(:message, :email)

  def initialize(attributes)
    @email = attributes[:email]
    @message = attributes[:message]
  end

  def self.create(attributes)
    submission = Feedback.new(attributes)
    FeedbackMailer.new_feedback(submission).deliver
  end
end
