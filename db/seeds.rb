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
  Referrer.create(name: "Dr. #{Faker::Name.first_name} #{Faker::Name.last_name} (MBBS)")
end

5.times do
  Doctor.create(name: "Dr. #{Faker::Name.first_name} #{Faker::Name.last_name} (MBBS)")
end

setting = Setting.first || Setting.new
setting.print_settings = { 'header' => Setting::DEFAULT_HEADER,
                           'signature' => Setting::DEFAULT_SIGNATURE,
                           'footer' => Setting::DEFAULT_FOOTER,
                           'header_margin' => Setting::DEFAULT_HEADER_MARGIN,
                           'footer_margin' => Setting::DEFAULT_FOOTER_MARGIN }
setting.save

(1..25).each_with_index do |number|
  title = Faker::Lorem.sentence
  Template.create(name: title,
                  report_title: title,
                  content: Faker::Lorem.paragraphs(8).join('<br/>'))
end

TOTAL_NUMBER_OF_DAYS = 10
time_now = Time.now - TOTAL_NUMBER_OF_DAYS.days

TOTAL_NUMBER_OF_DAYS.times do
  rand(5..20).times do
    patient = Patient.new(name: Faker::Name.name,
                          patient_id: Faker::Number.number(5),
                          age: Faker::Number.number(2),
                          sex: ['F', 'M'].sample)
    referrer = Referrer.first(rand(Referrer.count) + 1).last
    doctor = Doctor.first(rand(Doctor.count) + 1).last
    report = Report.new(patient: patient,
                        referrer: referrer,
                        doctor: doctor,
                        updated_at: time_now,
                        created_at: time_now,
                        content: Faker::Lorem.paragraphs(8).join('<br/>'),
                        title: Faker::Lorem.sentence,
                        amount_collected: random_amount_collected)
    if report.save
      puts "Report created for patient - #{report.patient.name}, referrer - #{report.referrer.name}, time - #{time_now}"
    else
      puts "Failed to save report - #{report.errors.messages}"
    end
    time_now = time_now + 1.hour
  end
  time_now = time_now + 1.day
  break if time_now > (Time.now - 1.day)
end
