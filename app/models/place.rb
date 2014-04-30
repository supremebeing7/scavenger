class Place < ActiveRecord::Base
  has_many :crawl_places
  has_many :reports
  has_many :crawls, through: :crawl_places
  validates_presence_of :name
  validates_presence_of :address
end
