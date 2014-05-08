class CompletedCrawl < ActiveRecord::Base
  belongs_to :user
  belongs_to :crawl

  def previously
    CompletedCrawl.where(user_id: self.user_id, crawl_id: self.crawl_id).exists?
  end
end
