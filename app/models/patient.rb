class Patient < ActiveRecord::Base
  has_many :reports
  validates_presence_of :name
  validates_numericality_of :age, allow_nil: true
end
