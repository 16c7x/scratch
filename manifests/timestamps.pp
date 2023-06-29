# @summary A short summary of the purpose of this class
#
# A description of what this class does
#
# @example
#   include oratune::timestamps
class scratch::timestamps {
  # Inputs
  $days          = 7
  $last_run_time = '2023-06-20 11:29:46'
  $current_time  = generate('/bin/date', '+%Y-%m-%d %H:%M:%S').chomp

  # Convert the time stamps into seconds since Epoch.
  $current_time_s = Integer(Timestamp($current_time).strftime('%s'))
  $lastrun_time_s = Integer(Timestamp($last_run_time).strftime('%s'))

  # Calculate the number of seconds in the time period we want.
  $interval_s = Integer(Timespan({ days => $days }).strftime('%S'))

  # Is the last run time less than the current time minus 7 days.
  if $lastrun_time_s > ($current_time_s - $interval_s) {
    notice("Last run was within the last ${days} days")
  } else {
    notice("It has been more than ${days} days since the last run")
  }
}
