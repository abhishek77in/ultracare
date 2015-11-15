module ReportsHelper

  def referrer_name(report)
    if report.referrer_name.present?
      report.referrer_name
    elsif report.referrer.present?
      report.referrer.name
    end
  end
end
