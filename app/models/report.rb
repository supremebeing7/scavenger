class Report < ActiveRecord::Base
  validates :description, presence: true
  belongs_to :place
  belongs_to :crawl
  belongs_to :user
  after_create :send_report_email

  def send_report_email
    # Disable Sidekiq on production until ready to launch - costs money on Heroku.
    if Rails.env.development?
      ReportMailer.delay.admin_report(self)
      ReportMailer.delay.user_report(self)
    else
      ReportMailer.admin_report(self).deliver
      ReportMailer.user_report(self).deliver
    end
  end
end
