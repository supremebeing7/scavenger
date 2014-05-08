require 'spec_helper'

describe CompletedCrawl do
  it { should belong_to :user }
  it { should belong_to :crawl }

  describe "previously" do
    before :each do
      @user = create :user
      @crawl = build :crawl
      @crawl.user_id = @user.id
      @crawl.save
      @completed1 = CompletedCrawl.create(user_id: @user.id, crawl_id: @crawl.id)
    end
    it "is true if a the user has already completed the crawl" do
      @completed2 = CompletedCrawl.new(user_id: @user.id, crawl_id: @crawl.id)
      @completed2.previously.should eq true
    end
    it "is false if a the user has not already completed the crawl" do
      @completed2 = CompletedCrawl.new
      @completed2.previously.should eq false
    end
  end
end
