namespace :data_changes do
  desc 'Create settings for the app'
  task :create_settings => :environment do

    if Setting.count > 0
      puts 'Settings already exists.'
    else
      setting = Setting.new
      setting.print_settings = { 'header' => Setting::DEFAULT_HEADER,
                                 'signature' => Setting::DEFAULT_SIGNATURE,
                                 'footer' => Setting::DEFAULT_FOOTER,
                                 'header_margin' => Setting::DEFAULT_HEADER_MARGIN,
                                 'footer_margin' => Setting::DEFAULT_FOOTER_MARGIN }
      setting.capture_patient_id = false
      setting.enable_accounting = true
      setting.save

      puts 'Settings created.'
    end
  end
end
