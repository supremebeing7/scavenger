class Crawl < ActiveRecord::Base
  belongs_to :user
  has_many :crawl_places, dependent: :destroy
  has_many :places, through: :crawl_places
  has_many :reports
  has_many :completed_crawls
  validates :name, :description, :user_id, presence: true

  def short_description
    matches = self.description[0...97].match(/(.+[.!?])/)
    if matches
      matches[1] + "..."
    else
      self.description[0...97] + "..."
    end
  end
end
