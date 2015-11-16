class SearchReport
  include ActiveModel::Model
  include DateConverter

  attr_accessor :patient_name, :date_range, :referrer_id

  def converted_date_range
    return if date_range.blank?
    to_range(date_range)
  end

end
