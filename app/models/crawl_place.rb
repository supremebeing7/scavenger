class CrawlPlace < ActiveRecord::Base
  belongs_to :crawl
  belongs_to :place
end
