class Patient < ActiveRecord::Base
  has_many :reports
  validates_presence_of :name
  validates :age, numericality: { only_integer: true, greater_than_or_equal_to: 0, less_than: 120 }
end
