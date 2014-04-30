class CreateCrawlPlaces < ActiveRecord::Migration
  def change
    create_table :crawl_places do |t|
      t.integer :place_id
      t.integer :crawl_id

      t.timestamps
    end
  end
end
