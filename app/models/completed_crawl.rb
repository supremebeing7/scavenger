class CompletedCrawl < ActiveRecord::Base
  belongs_to :user
  belongs_to :crawl
end
