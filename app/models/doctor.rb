class Doctor < ActiveRecord::Base
  has_paper_trail on: [:update], only: [:name]

  validates_presence_of :name
  validates_uniqueness_of :name, :case_sensitive => false
  has_many :reports
  scope :recent, -> { order('created_at DESC') }
  scope :order_by_name, -> { order('name') }

  def doctor_name
    if degree.present?
      "#{name} (#{degree}), # #{id}"
    else
      "#{name}, # #{id}"
    end
  end
end
