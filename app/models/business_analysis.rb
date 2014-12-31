class BusinessAnalysis
  include ActiveModel::Model
  include DateConverter

  attr_accessor :date_range

  validates :date_range, presence: true

  def date_range=(value)
    return if value.blank?
    @date_range = to_range(value)
  end
end

