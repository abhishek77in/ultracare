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

today = DateTime.now

10.times do
  rand(5..20).times do
    patient = Patient.new(name: Faker::Name.name, age: Faker::Number.number(2), sex: 'F' )
    referrer = Referrer.first(rand(Referrer.count) + 1).last
    report = Report.new(patient: patient,
                        referrer: referrer,
                        updated_at: today,
                        created_at: today,
                        content: Faker::Lorem.paragraphs(8).join('<br/>'),
                        title: Faker::Lorem.sentence,
                        amount_collected: random_amount_collected)
    if report.save
      puts "Report created for patient - #{report.patient.name}, referrer - #{report.referrer.name}, Date - #{today}"
    else
      puts "Failed to save report - #{report.errors.messages}"
    end
  end
  today = today.prev_day
end
