require 'spec_helper_acceptance'

describe 'gocd class' do
  let(:manifest) {
      <<-EOS
        class { 'gocd': }
      EOS
    }

  it 'should run without errors' do
    result = apply_manifest(manifest, :catch_failures => true)
    expect(@result.exit_code).to eq 2
  end

  it 'should run a second time without changes' do
    result = apply_manifest(manifest, :catch_failures => true)
    expect(@result.exit_code).to eq 0
  end

  describe service('go-server') do
    it { should be_enabled }
    it { should be_running }
  end

  describe package('go-server') do
    it { should be_installed }
  end

end
