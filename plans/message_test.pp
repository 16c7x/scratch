plan oratune::message_test (
  TargetSpec $targets,
  Optional[String[1]] $example_nul = undef,
) {
  return run_task('orademo::dynamicmessage', $targets, 'example_nul' => $example_nul)
}
