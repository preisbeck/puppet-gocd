require 'beaker-rspec'
require 'beaker/puppet_install_helper'
require 'beaker/module_install_helper'

logger.error("LOADED Spec Acceptance Helper")

run_puppet_install_helper
install_module_on(hosts)
install_module_dependencies_on(hosts)
install_puppet_agent_on(hosts, options)

RSpec.configure do |c|
  module_root = File.expand_path(File.join(File.dirname(__FILE__), '..'))

  c.formatter = :documentation

  c.before :suite do
    # Install module to all hosts
    hosts.each do |host|
      install_dev_puppet_module_on(host, :source => module_root, :module_name => 'gocd',
          :target_module_path => '/etc/puppet/modules')
          # Install dependencies
          on(host, puppet('module', 'install', 'puppetlabs-apt'))
      # Add more setup code as needed
    end
  end
end
