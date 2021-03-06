class Place < ActiveRecord::Base
  has_many :crawl_places, dependent: :destroy
  has_many :reports
  has_many :crawls, through: :crawl_places
  validates_presence_of :name
  validates_presence_of :address

  geocoded_by :address
  after_validation :geocode
end
