class CreateCrawls < ActiveRecord::Migration
  def change
    create_table :crawls do |t|
      t.string :name
      t.text :description
      t.integer :user_id
      t.boolean :public

      t.timestamps
    end
  end
end
