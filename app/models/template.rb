class Template < ActiveRecord::Base
  validates_presence_of :name, :report_title, :content
  scope :ordered, -> { order(:position) }

  def self.to_csv(options = {})
    CSV.generate(options) do |csv|
      csv << column_names
      all.each do |template|
        csv << template.attributes.values_at(*column_names)
      end
    end
  end
end
