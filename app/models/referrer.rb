class Referrer < ActiveRecord::Base
  validates_presence_of :name
  validates_uniqueness_of :name, :case_sensitive => false
  has_many :reports
  scope :recent, -> { order('created_at DESC') }
  scope :order_by_name, -> { order('name') }

  COLUMNS_FOR_IMPORT_EXPORT = [:name]

  def self.referrer_names
    self.uniq.pluck(:name)
  end

  def self.to_csv(options = {})
    CSV.generate(options) do |csv|
      csv << COLUMNS_FOR_IMPORT_EXPORT
      all.each do |referrer|
        csv << referrer.attributes.values_at(*COLUMNS_FOR_IMPORT_EXPORT.map(&:to_s))
      end
    end
  end

  def self.import(file)
    CSV.foreach(file.path, :headers => true) do |row|
      Referrer.create(row.to_hash)
    end
  end
end
