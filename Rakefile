require 'puppetlabs_spec_helper/rake_tasks'
require 'puppet-lint/tasks/puppet-lint'
require 'metadata-json-lint/rake_task'

if RUBY_VERSION >= '1.9'
  require 'rubocop/rake_task'
  RuboCop::RakeTask.new
end

PuppetLint.configuration.send('disable_80chars')
PuppetLint.configuration.send('disable_puppet_url_without_modules')
PuppetLint.configuration.send('disable_arrow_on_right_operand_line')
PuppetLint.configuration.send('disable_parameter_order')
PuppetLint.configuration.chars_per_indent = 4
PuppetLint.configuration.relative = true
PuppetLint.configuration.ignore_paths = ['spec/**/*.pp', 'pkg/**/*.pp']

desc 'Run lint, validate, and spec tests.'
task :test do
  [:lint, :validate, :spec].each do |test|
      Rake::Task[test].invoke
  end
end
