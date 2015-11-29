class Template < ActiveRecord::Base
  validates_presence_of :name, :report_title, :content
  scope :ordered, -> { order(:position) }

  COLUMNS_FOR_IMPORT_EXPORT = [:name, :report_title, :content]

  def self.to_csv(options = {})
    CSV.generate(options) do |csv|
      csv << COLUMNS_FOR_IMPORT_EXPORT
      all.each do |template|
        csv << template.attributes.values_at(*COLUMNS_FOR_IMPORT_EXPORT.map(&:to_s))
      end
    end
  end
end
