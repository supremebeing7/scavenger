class Crawl < ActiveRecord::Base
  belongs_to :user
  validates :name, :description, :user_id, presence: true
end
