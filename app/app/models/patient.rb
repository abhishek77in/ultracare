class Patient < ActiveRecord::Base
  has_many :reports
end
