class Report < ActiveRecord::Base
  validates :description, presence: true
  belongs_to :place
  belongs_to :user
  after_create :send_report_email

  def send_report_email
    ReportMailer.admin_report(self).deliver
    ReportMailer.user_report(self).deliver
  end
end
