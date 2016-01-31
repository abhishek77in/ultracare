require_relative '../../../db/report_seeds'

namespace :data_changes do
  desc 'Task to be run daily to create sample reports'
  task :create_daily_sample_reports => :environment do
    time_now = Time.now
    rand(15..20).times do
      create_report(time_now)
      time_now = time_now + 20.minutes
    end
  end
end
