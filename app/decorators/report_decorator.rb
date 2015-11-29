class ReportDecorator < ApplicationDecorator
  delegate_all
  decorates_association :patient

  def status
    object.status.humanize
  end

  def created_at
    object.created_at.strftime('%d / %m / %Y')
  end
end
