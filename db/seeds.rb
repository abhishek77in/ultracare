require_relative 'report_seeds'

Rake::Task['data_changes:create_settings'].invoke

User.create(email: 'test@example.com', password: 'abcd1234')
User.create(email: 'demo@example.com', password: 'abcd1234')
User.create(email: 'user@example.com', password: 'abcd1234')
User.create(email: 'admin@example.com', password: 'abcd1234', role: 'admin')

def random_amount_collected
  [500, 600, 700, 800, 900, 1000].sample
end

50.times do
  Referrer.create(name: "Dr. #{Faker::Name.first_name} #{Faker::Name.last_name} (MBBS)")
end

3.times do
  Doctor.create(name: "Dr. #{Faker::Name.first_name} #{Faker::Name.last_name} (MBBS)")
end

file = File.open("db/fixtures/#{ENV['APP_NAME'].downcase}_templates.csv")
Template.import(file)

TOTAL_NUMBER_OF_DAYS = 10
time_now = Time.now - TOTAL_NUMBER_OF_DAYS.days

TOTAL_NUMBER_OF_DAYS.times do
  rand(5..20).times do
    create_report(time_now)
    time_now = time_now + 1.hour
  end
  time_now = time_now + 1.day
  break if time_now > (Time.now - 1.day)
end
