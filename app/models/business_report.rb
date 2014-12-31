class BusinessReport
  include ActiveModel::Model
  include DateConverter

  attr_accessor :doctor_ids, :date_range

  validates :date_range, presence: true
  validate :date_range_limit

  def date_range=(value)
    return if value.blank?
    value = to_range(value)
    @date_range = value
  end

  def doctor_ids=(value)
    @doctor_ids = value.reject(&:blank?)
  end

  def date_range_limit
    # errors.add(:business_report_date_range, "Please enter date range within 90 days period.")
  end

  def file_name
    "Business Report - #{Time.now.strftime("%d %b %y")}"
  end
end
