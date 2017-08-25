require 'spec_helper'

describe 'gocd::server' do
    on_supported_os.each do |os, facts|
        context 'gocd master with default parameters on #{os}' do
            let(:facts) do
                facts
            end

            it do
                is_expected.to contain_apt__key('gocd')
                    .with('ensure' => 'present',
                          'key' => 'BF3D78F61622D1F2',
                          'key_source' => 'https://download.gocd.org/GOCD-GPG-KEY.asc')
            end

            it do
                is_expected.to contain_apt__source('gocd')
                    .with('location' => 'https://download.gocd.org/',
                          'comment' => 'GoCD Repository',
                          'release' => '/',
                          'repos' => '')
            end
        end
    end
end
