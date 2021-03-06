require 'spec_helper'

describe 'gocd' do
    on_supported_os.each do |os, facts|
        context 'gocd master with default parameters on #{os}' do
            let(:facts) do
                facts
            end
            it { is_expected.to compile }
            it { is_expected.to contain_class('gocd::server') }
            #it { is_expected.to contain_service('go-server').with(ensure: 'running') }
        end
    end
end
