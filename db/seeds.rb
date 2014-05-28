# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

today = DateTime.now

10.times do
  Doctor.create(name: Faker::Name.name, degree: 'MBBS')
end


30.times do
  rand(10..60).times do
    patient = Patient.new(name: Faker::Name.name, age: Faker::Number.number(2), sex: 'F' )
    doctor = Doctor.first(offset: rand(Doctor.count))
    reportable_model = [WholeAbdomenFemale,Obstetric,KubFemale,UpperAbdomen,ThyroidGland].sample
    reportable = reportable_model.new(reportable_model.params)
    report = Report.new(patient: patient, doctor: doctor, created_at: today)
    report.report_type = ReportType.new(reportable: reportable)
    if report.save && report.report_type.save
      puts "Report created for patient - #{report.patient.name}, doctor - #{report.doctor.name}, Date - #{today}"
    else
      puts "Failed to save report - #{report.errors.messages}"
    end
  end
  today = today.prev_day
end
