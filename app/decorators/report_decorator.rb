class ReportDecorator < Draper::Decorator
  delegate_all

  def status
    object.status.humanize
  end
end
