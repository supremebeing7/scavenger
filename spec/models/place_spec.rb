require 'spec_helper'

describe Place do
  it { should have_many :crawl_places }
  it { should have_many :crawls }
  it { should validate_presence_of :name }
  it { should validate_presence_of :address }
end
