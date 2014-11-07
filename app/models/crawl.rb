class Crawl < ActiveRecord::Base
  belongs_to :user
  has_many :crawl_places, dependent: :destroy
  has_many :places, through: :crawl_places
  has_many :reports
  has_many :completed_crawls
  validates :name, :description, :user_id, presence: true

  def short_description
    matches = description[0...97].match(/(.+[.!?,;:])/)
    if matches
      matches[1] + "..."
    else
      description[0...97] + "..."
    end
  end

  def self.recently_added(number)
    if Crawl.where(public: true).count > number
      Crawl.where(public: true).order(:created_at)[-number..-1]
    else
      Crawl.where(public: true)
    end
  end
end
