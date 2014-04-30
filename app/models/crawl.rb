class Crawl < ActiveRecord::Base
  belongs_to :user
  has_many :crawl_places
  has_many :places, through: :crawl_places
  validates :name, :description, :user_id, presence: true
end
