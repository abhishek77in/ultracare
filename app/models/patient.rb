class Patient < ActiveRecord::Base
  has_many :reports
  validates_presence_of :name
  validates_numericality_of :age, allow_nil: true

  module Sex
    MALE = :m
    FEMALE = :f
    OTHER = :o
  end
end
