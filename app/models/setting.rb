class Setting < ActiveRecord::Base
  store :print_settings, accessors: [ :heading, :sub_heading, :address, :phone_number, :consultant_1, :consultant_2], coder: JSON
end
