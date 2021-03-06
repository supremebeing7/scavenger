class Report < ActiveRecord::Base
  belongs_to :place
  belongs_to :crawl
  belongs_to :user
  after_create :send_report_email

  def send_report_email
    ReportMailer.admin_report(self).deliver
    ReportMailer.user_report(self).deliver
  end
end
