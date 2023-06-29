# @summary A short summary of the purpose of this class
#
# A description of what this class does
#
# @example
#   include oratune::timestamps
class scratch::timestamps {
  # Inputs
  #$days          = 7
  #$current_time  = '2023-06-28'
  #$last_run_time = '2023-06-20 11:29:46'

  $new_current_time  = generate('/bin/date', '+%Y-%m-%d %H:%M:%S')

  $current_t = Integer(Timestamp($new_current_time).strftime('%s'))

  notify { 'timestamp message':
    message => $current_time,
  }

  # Convert the time stamps into seconds since Epoch.
  #$current_t = Integer(Timestamp($current_time).strftime('%s'))
  #$lastrun_t = Integer(Timestamp($last_run_time).strftime('%s'))

  # Calculate the number of seconds in the time period we want.
  #$interval = Integer(Timespan({ days => $days }).strftime('%S'))

  # Is the last run time less than the current time minus 7 days.
  #if $lastrun_t > ($current_t - $interval) {
  #  notice("Last run was within the last ${days} days")
  #} else {
  #  notice("It has been more than ${days} days since the last run")
  #}
}
