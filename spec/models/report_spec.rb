require 'spec_helper'

describe Report do

  let(:user) { create :user }
  let(:place) { create :place }
  let(:crawl) { create(:crawl, user_id: user.id) }

  it { should belong_to :place }
  it { should belong_to :user }
  it { should belong_to :crawl }

  it "sends an email to admin and user when the user reports content for place" do
    report = FactoryGirl.create(:report, user_id: user.id, place_id: place.id)
    ActionMailer::Base.deliveries[-2].to.should eq ["markopolo@gmail.com"]
    ActionMailer::Base.deliveries.last.to.should eq [report.user.email]
  end
  it "sends an email to admin and user when the user reports content for crawl" do
    report = FactoryGirl.create(:report, user_id: user.id, crawl_id: crawl.id)
    ActionMailer::Base.deliveries[-2].to.should eq ["markopolo@gmail.com"]
    ActionMailer::Base.deliveries.last.to.should eq [report.user.email]
  end
end
