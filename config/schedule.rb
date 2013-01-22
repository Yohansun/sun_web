# Use this file to easily define all of your cron jobs.
#
# It's helpful, but not entirely necessary to understand cron before proceeding.
# http://en.wikipedia.org/wiki/Cron

# Example:
#
# set :output, "/path/to/my/cron_log.log"
#
# every 2.hours do
#   command "/usr/bin/some_great_command"
#   runner "MyModel.some_method"
#   rake "some:great:rake:task"
# end
#
# every 4.days do
#   runner "AnotherModel.prune_old_records"
# end

# Learn more: http://github.com/javan/whenever

every 1.day, :at => '2:30 am' do
  date = (Time.now - 1.day).strftime("%Y%m%d")
  job_type :grep, "cd /home/www/rails/icolor/current/log && grep :task production.log.#{date} > /home/www/rails/icolor/current/public/system/landing_log/landing.log.#{date}"
 
  grep '"Started GET \"/landing"'
end

every 1.day, :at => '3:00 am' do
  rake "import_click_data"
end