class Patient < ActiveRecord::Base
  has_paper_trail

  has_many :reports
  validates_presence_of :name, :age
  validates :age, numericality: { greater_than: 0, less_than: 100 }
end
