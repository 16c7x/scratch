# @summary A short summary of the purpose of this class
#
# A description of what this class does
#
# @example
#   include oratune::timestamps
class scratch::timestamps {
  $new_current_time  = generate('/bin/date', '+%Y-%m-%d %H:%M:%S')

  notify { 'timestamp message':
    message => $new_current_time,
  }
}
