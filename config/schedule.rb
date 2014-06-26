# Use this file to easily define all of your cron jobs.
#
# It's helpful, but not entirely necessary to understand cron before proceeding.
# http://en.wikipedia.org/wiki/Cron

every 1.day, :at => '11:30 am' do
  rake "db:backup"
end

every 1.day, :at => '11:40 am' do
  rake "db:rotate"
end

# Learn more: http://github.com/javan/whenever
