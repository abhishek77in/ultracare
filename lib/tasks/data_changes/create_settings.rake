namespace :data_changes do
  desc 'Create settings for the app'
  task :create_settings => :environment do

    if Setting.count > 0
      puts "Settings already exists."
    else
      setting = Setting.new
      setting.print_settings = { 'heading' => 'YOUR DIAGNOSTIC CENTRE',
                                 'sub_heading' => 'DIAGNOSTIC ULTRASOUND UNIT',
                                 'address' => 'Opposite - Your Hospital, City Name',
                                 'phone_number' => '23xx36',
                                 'header_margin' => 65,
                                 'footer_margin' => 20 }
      setting.save

      puts "Settings created."
    end
  end
end
