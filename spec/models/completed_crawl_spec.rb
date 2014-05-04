require 'spec_helper'

describe CompletedCrawl do
  it { should belong_to :user }
  it { should belong_to :crawl }
end
