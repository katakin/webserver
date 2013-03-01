# Use this file to easily define all of your cron jobs.
#
# It's helpful, but not entirely necessary to understand cron before proceeding.
# http://en.wikipedia.org/wiki/Cron
# set :environment, "development"
# env :PATH, ENV['PATH']
# Example:
#
set :output, "log/cron.log"
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

# every :hour do
every 6.hours do
  runner "Forecast.update_from"
  command 'echo "forecasts updated"'
end

every 30.minutes do
	runner "YktNew.update_from"
	command 'echo "yktnews updated"'
end

every 1.day, :at => '4:30' do
  runner "Event.update_from"
  command 'echo "events updated"'
end