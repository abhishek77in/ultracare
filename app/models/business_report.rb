class BusinessReport
  include ActiveModel::Model
  include DateConverter

  attr_accessor :doctor_ids, :date_range

  validates :date_range, presence: true

  def date_range=(value)
    return if value.blank?
    @date_range = to_range(value)
  end

  def doctor_ids=(value)
    @doctor_ids = value.reject(&:blank?)
  end

  def file_name
    "Business Report - #{Time.now.strftime("%d %b %y")}"
  end
end
