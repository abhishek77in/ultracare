class ReportDecorator < ApplicationDecorator
  delegate_all
  decorates_association :patient

  def status
    object.status.humanize
  end
end
