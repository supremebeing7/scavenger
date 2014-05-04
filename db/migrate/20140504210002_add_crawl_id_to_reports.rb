class AddCrawlIdToReports < ActiveRecord::Migration
  def change
    add_column :reports, :crawl_id, :integer
  end
end
