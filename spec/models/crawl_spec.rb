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
end
