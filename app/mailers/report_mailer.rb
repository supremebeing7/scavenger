class ReportMailer < ActionMailer::Base
  default from: "us@scavenger.com"

  def admin_report(report)
    @report = report
    mail to: "markopolo@gmail.com", subject: "Content Report Submitted"
  end
  def user_report(report)
    @report = report
    if @report.user
      mail to: @report.user.email, subject: "Content Report Submitted"
    end
  end
end
