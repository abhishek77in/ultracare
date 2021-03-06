class Setting < ActiveRecord::Base
  store :print_settings, accessors: [:header, :signature, :footer, :header_margin, :footer_margin], coder: JSON

  validates :show_max_reports, numericality: { greater_than: 0, allow_nil: true  }
  validates :show_reports_from_last_days, numericality: { greater_than: 0, allow_nil: true  }
  validates :header_margin, :footer_margin, numericality: { allow_nil: false }

  DEFAULT_HEADER_MARGIN = 45
  DEFAULT_FOOTER_MARGIN = 20

  DEFAULT_HEADER = %Q[
    <h1 style="text-align: center;">YOUR DIAGNOSTIC CENTRE</h1>
    <h2 style="text-align: center;">DIAGNOSTIC ULTRASOUND UNIT</h2>
    <h3 style="text-align: center;">Opposite - Memorial Hospital, City Name&nbsp;232436</h3>
  ]

  DEFAULT_SIGNATURE = %Q[
    <div>
      <p style="text-align: center;">------ End of report ------</p>

      <p style="text-align: right;">Signature<br />%{doctor_name}</p>
    </div>
  ]

  DEFAULT_FOOTER = %Q[
    <p style="text-align: center;">NOT VALID FOR MEDICOLEGAL PURPOSE<br />
    Kindly inform any typing mistake immediately for the correction</p>
  ]

  def self.settings
    last
  end

end
