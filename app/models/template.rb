class Template < ActiveRecord::Base
  validates_presence_of :report_title, :content
end
