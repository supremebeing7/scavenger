require 'spec_helper'

describe Crawl do
  it { should belong_to :user }
  it { should validate_presence_of :name }
  it { should validate_presence_of :user_id }
  it { should validate_presence_of :description }
end
