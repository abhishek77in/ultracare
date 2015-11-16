class SearchReport
  include ActiveModel::Model
  include DateConverter

  attr_accessor :patient_name, :date_range, :referrer_id

end
