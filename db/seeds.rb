# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

User.create(email: 'test@example.com', password: 'abcd1234')
User.create(email: 'user@example.com', password: 'abcd1234')
User.create(email: 'admin@example.com', password: 'abcd1234', role: 'admin')

def random_amount_collected
  [500, 600, 700, 800, 900, 1000].sample
end

10.times do
  Doctor.create(name: Faker::Name.name, degree: 'MBBS')
end

setting = Setting.first || Setting.new
setting.print_settings = { 'header' => Setting::DEFAULT_HEADER,
                           'signature' => Setting::DEFAULT_SIGNATURE,
                           'footer' => Setting::DEFAULT_FOOTER,
                           'header_margin' => Setting::DEFAULT_HEADER_MARGIN,
                           'footer_margin' => Setting::DEFAULT_FOOTER_MARGIN }
setting.save

(1..50).each_with_index do |number|
  Template.create(report_title: "##{number} Template name", content: "Test report content of tempalte ##{number}")
end

today = DateTime.now

10.times do
  rand(5..20).times do
    patient = Patient.new(name: Faker::Name.name, age: Faker::Number.number(2), sex: 'F' )
    doctor = Doctor.first(rand(Doctor.count) + 1).last
    report = Report.new(patient: patient,
                        doctor: doctor,
                        updated_at: today,
                        created_at: today,
                        content: 'test report details',
                        title: 'report title',
                        amount_collected: random_amount_collected)
    if report.save
      puts "Report created for patient - #{report.patient.name}, doctor - #{report.doctor.name}, Date - #{today}"
    else
      puts "Failed to save report - #{report.errors.messages}"
    end
  end
  today = today.prev_day
end
