class Patient < ActiveRecord::Base
  has_many :reports
  validates_presence_of :name
  validates :age, numericality: { greater_than: 0, less_than: 100, blank: false }
end
