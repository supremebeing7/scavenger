require 'spec_helper'

describe Crawl do
  it { should belong_to :user }
  it { should have_many :crawl_places }
  it { should have_many :places }
  it { should have_many :reports }
  it { should have_many :completed_crawls }
  it { should validate_presence_of :name }
  it { should validate_presence_of :user_id }
  it { should validate_presence_of :description }

  let(:user) { create :user }

  before :each do
    @crawl = create(:crawl, user_id: user.id)
  end

  context '#short_description' do
    it 'shortens description to 100 characters or fewer' do
      @crawl.short_description.length.should eq 59
    end
    it 'shortens description to the last period, ? or ! before 100 char limit' do
      @crawl.short_description.should eq "It's time to put on makeup. It's time to dress up right!..."
    end
    it 'shortens description to the last comma, semicolon, or colon before 100 char limit' do
      @crawl2 = Crawl.create(name: "Commas", user_id: user.id,
                            description: "Knowing that millions of people around the world, would be watching in person; and on television and expecting great things from him.")
      @crawl2.short_description.length.should eq 81
      @crawl2.short_description.should eq "Knowing that millions of people around the world, would be watching in person;..."
    end
    it 'if no ending punctuation, shortens description to 97 chars and adds ...' do
      @crawl3 = Crawl.create(name: "Wackness", user_id: user.id,
                            description: "Knowing that millions of people around the world would be watching in person and on television and expecting great things from him.")
      @crawl3.short_description.length.should eq 100
      @crawl3.short_description.should eq "Knowing that millions of people around the world would be watching in person and on television an..."
    end
  end
end
