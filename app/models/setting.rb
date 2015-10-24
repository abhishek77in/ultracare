class Setting < ActiveRecord::Base
  store :print_settings, accessors: [:heading, :sub_heading, :address, :phone_number, :consultant_1, :consultant_2], coder: JSON

  validates :show_max_reports, numericality: { greater_than: 0, allow_nil: true  }
  validates :show_reports_from_last_days, numericality: { greater_than: 0, allow_nil: true  }
end
