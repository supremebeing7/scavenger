class CreateCompletedCrawls < ActiveRecord::Migration
  def change
    create_table :completed_crawls do |t|
      t.integer :user_id
      t.integer :crawl_id

      t.timestamps
    end
  end
end
