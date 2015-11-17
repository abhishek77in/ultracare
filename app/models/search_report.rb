class SearchReport
  include ActiveModel::Model
  include DateConverter

  attr_accessor :patient_id,
                :patient_name,
                :date_range,
                :referrer_id,
                :keyword

  def converted_date_range
    return if date_range.blank?
    to_range(date_range)
  end

end
