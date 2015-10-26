class Setting < ActiveRecord::Base
  store :print_settings, accessors: [:header, :signature, :footer], coder: JSON

  validates :show_max_reports, numericality: { greater_than: 0, allow_nil: true  }
  validates :show_reports_from_last_days, numericality: { greater_than: 0, allow_nil: true  }

  def default_header
    %Q[
      <h1 style="text-align: center;">YOUR DIAGNOSTIC CENTRE</h1>
      <h2 style="text-align: center;">DIAGNOSTIC ULTRASOUND UNIT</h2>
      <h3 style="text-align: center;">Opposite - Memorial Hospital, City Name&nbsp;232436</h3>
    ]
  end

  def default_signature
    %Q[
      <div style="width: 70%; float: left;">
        <p>PLEASE CO-RELATE CLINICALLY</p>
      </div>
      <div style="width: 30%; float: right;">
        <p>SIGNATURE<br />
          Dr. Jai Ram Sinha</p>
      </div>
    ]
  end

  def default_footer
    %Q[
      NOT VALID FOR MEDICOLEGAL PURPOSE <br/>
      Kindly inform any typing mistake immediately for the correction
    ]
  end
end
