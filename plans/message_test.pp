plan oratune::message_test (
  TargetSpec $targets,
  Optional[String[1]] $example_nul = undef,
) {
  return run_task('oratune::dynamicmessage', $targets, 'example_nul' => $example_nul)
}
