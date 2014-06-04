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
    it 'shows only first 100 characters of description, adds ... if characters removed' do
      # @crawl.short_description.should eq "test"
      @crawl.short_description.length.should eq 103
    end
  end
end
