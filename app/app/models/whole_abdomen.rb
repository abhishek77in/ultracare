class WholeAbdomen < ActiveRecord::Base
  has_one :report_type, as: :reportable
end
