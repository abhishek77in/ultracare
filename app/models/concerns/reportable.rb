module Reportable
  extend ActiveSupport::Concern

  included do
    has_one :report_type, as: :reportable
  end

  def print_template
    'shared/pdf/reportable'
  end

  module ClassMethods
    def params
      Setting.first.default_organ_findings.select { |key, value| column_names.include?(key) }
    end
  end
end
