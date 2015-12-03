class ReportDecorator < ApplicationDecorator
  delegate_all
  decorates_association :patient

  def status
    object.status.humanize
  end

  def created_at
    object.created_at.strftime('%d / %m / %Y')
  end

  def as_json(options = {})
    {
      id: object.id,
      patient_id: object.patient_id,
      status: object.status,
      save_status: object.save_status
    }
  end
end
