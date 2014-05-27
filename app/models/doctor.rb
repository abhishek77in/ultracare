class Doctor < ActiveRecord::Base
  validates_presence_of :name
  validates_uniqueness_of :name, :case_sensitive => false
  has_many :reports

  def doctor_name
    if degree.present?
      "#{name} (#{degree}), # #{id}"
    else
      "#{name}, # #{id}"
    end
  end
end
