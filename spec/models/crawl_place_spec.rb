require 'spec_helper'

describe CrawlPlace do
  it { should belong_to :crawl }
  it { should belong_to :place }
end
