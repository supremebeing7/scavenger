require 'spec_helper'

describe Report do
  it { should validate_presence_of :description }
  it { should belong_to :place }
  it { should belong_to :user }

  it "sends an email to admin and user when the user reports content" do
    user = FactoryGirl.create :user
    place = FactoryGirl.create :place
    report = FactoryGirl.build :report
    report.update(user_id: user.id, place_id: place.id)
    report.save
    ActionMailer::Base.deliveries[-2].to.should eq ["admin@hoursofhappiness.com"]
    ActionMailer::Base.deliveries.last.to.should eq [report.user.email]
  end
end
