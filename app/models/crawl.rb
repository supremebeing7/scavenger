class Crawl < ActiveRecord::Base
  belongs_to :user
  has_many :crawl_places
  has_many :places, through: :crawl_places
  has_many :reports
  has_many :completed_crawls
  validates :name, :description, :user_id, presence: true
end
