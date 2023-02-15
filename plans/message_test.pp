plan oratune::message_test (
  TargetSpec $targets,
) {
  $outside_apply = File::read(‘/etc/hostname’)
  #$outside_apply = lookup('oramessage')
  run_task('oratune::dynamicmessage', $targets, 'example_nul' => $outside_apply)
}
