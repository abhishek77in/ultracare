class Template < ActiveRecord::Base
  validates_presence_of :ultrasound_type, :content
end
