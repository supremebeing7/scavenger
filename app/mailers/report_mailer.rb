class ReportMailer < ActionMailer::Base
  default from: "us@scavenger.com"

  def admin_report(report)
    @report = report
    mail to: "admin@scavenger.com", subject: "Content Report Submitted"
  end
  def user_report(report)
    @report = report
    mail to: @report.user.email, subject: "Content Report Submitted"
  end
end
