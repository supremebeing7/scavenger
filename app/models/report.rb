class Report < ActiveRecord::Base
  validates :description, presence: true
  belongs_to :place
  belongs_to :crawl
  belongs_to :user
  after_create :send_report_email

  def send_report_email
    ReportMailer.delay.admin_report(self)
    ReportMailer.delay.user_report(self)
  end
end
