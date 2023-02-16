# @summary Return status information from one or more PE clusters in a table format
#
# @param targets These are a list of the primary puppetservers from one or multiple puppet stacks
# @param format The output format to dump to stdout (json or table)
# @param summarize Controls the type of json output to render, defaults to true
# @param verbose Toggles the output to show all the operationally services, can be loads more data
# @param colors Toggles the usage of colors, you may want to disable if the format is json
# @example
#   peadm::status($targets, 'table', true, true)
plan oratune::status(
  TargetSpec $targets,
) {
  #$message = "my message" #File::read(‘/etc/hostname’)
  $message = system::env()
  run_task('oratune::dynamicmessage', $targets, 'example_nul' => $message)
}
