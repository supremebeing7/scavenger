require 'spec_helper'

describe Report do
  it { should validate_presence_of :description }
  it { should belong_to :place }
  it { should belong_to :user }
  it { should belong_to :crawl }

  it "sends an email to admin and user when the user reports content for place" do
    user = FactoryGirl.create :user
    place = FactoryGirl.create :place
    report = FactoryGirl.build :report
    report.update(user_id: user.id, place_id: place.id)
    report.save
    ActionMailer::Base.deliveries[-2].to.should eq ["markopolo@gmail.com"]
    ActionMailer::Base.deliveries.last.to.should eq [report.user.email]
  end
  it "sends an email to admin and user when the user reports content for crawl" do
    user = FactoryGirl.create :user
    crawl = FactoryGirl.build :crawl
    crawl.update(user_id: user.id)
    crawl.save
    report = FactoryGirl.build :report
    report.update(user_id: user.id, crawl_id: crawl.id)
    report.save
    ActionMailer::Base.deliveries[-2].to.should eq ["markopolo@gmail.com"]
    ActionMailer::Base.deliveries.last.to.should eq [report.user.email]
  end
end
