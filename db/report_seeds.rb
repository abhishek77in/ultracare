
def create_report(time_now)
  patient = Patient.new(name: Faker::Name.name,
                        patient_id: Faker::Number.number(5),
                        age: Faker::Number.number(2),
                        sex: [Patient::Sex::MALE, Patient::Sex::FEMALE].sample)
  referrer = Referrer.first(rand(Referrer.count) + 1).last
  doctor = Doctor.first(rand(Doctor.count) + 1).last
  template = Template.first(rand(Template.count) + 1).last
  report = Report.new(patient: patient,
                      referrer_name: referrer.name,
                      doctor: doctor,
                      status: Report::Status::SIGNED_OFF,
                      updated_at: time_now,
                      created_at: time_now,
                      content: template.content,
                      title: template.report_title,
                      amount_collected: random_amount_collected)
  if report.save
    puts "Report created for patient - #{report.patient.name}, referrer - #{report.referrer.name}, time - #{time_now}"
  else
    puts "Failed to save report - #{report.errors.messages}"
  end
end