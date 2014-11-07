require 'spec_helper'

describe Feedback do
  before do
    Feedback.create(email: "satisfied@user.com", message: "Site looks swell!")
  end

  it "sends an email to admin when someone submits feedback" do
    ActionMailer::Base.deliveries.last.subject.should eq 'New Feedback!'
  end
  it "has a reply-to address for the person submitting feedback" do
    ActionMailer::Base.deliveries.last.reply_to.should eq ['satisfied@user.com']
  end
end
