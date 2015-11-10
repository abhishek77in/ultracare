class Template < ActiveRecord::Base
  validates_presence_of :name, :report_title, :content
  scope :ordered, -> { order(:position) }
end
