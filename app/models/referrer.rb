class Referrer < ActiveRecord::Base
  has_paper_trail

  validates_presence_of :name
  validates_uniqueness_of :name, :case_sensitive => false
  has_many :reports
  scope :recent, -> { order('created_at DESC') }
  scope :order_by_name, -> { order('name') }

  def referrer_name
    "#{name}, # #{id}"
  end
end
