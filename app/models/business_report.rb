class BusinessReport
  include ActiveModel::Model

  attr_accessor :doctor_id, :date_range

  validates :date_range, presence: true

end
