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

  def to_csv(options = {})
    CSV.generate(options) do |csv|
      csv << COLUMNS_FOR_IMPORT_EXPORT
      csv << self.attributes.values_at(*COLUMNS_FOR_IMPORT_EXPORT.map(&:to_s))
    end
  end

  def self.import(file)
    CSV.foreach(file.path, :headers => true) do |row|
      Template.create(row.to_hash)
    end
  end
end
