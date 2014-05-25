require 'spec_helper'

describe Feedback do
  it "sends an email to admin with reply-to address when someone submits feedback" do
    @submission = Feedback.create(email: "satisfied@user.com", message: "Site looks swell!")
    ActionMailer::Base.deliveries.last.subject.should eq 'New Feedback!'
  end
  # it "sends an email to admin and user when the user reports content for crawl" do
  #   user = FactoryGirl.create :user
  #   crawl = FactoryGirl.build :crawl
  #   crawl.update(user_id: user.id)
  #   crawl.save
  #   report = FactoryGirl.build :report
  #   report.update(user_id: user.id, crawl_id: crawl.id)
  #   report.save
  #   ActionMailer::Base.deliveries[-2].to.should eq ["markopolo@gmail.com"]
  #   ActionMailer::Base.deliveries.last.to.should eq [report.user.email]
  # end
end
