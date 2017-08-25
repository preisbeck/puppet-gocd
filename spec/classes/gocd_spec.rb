require 'spec_helper'

describe 'gocd' do
    on_supported_os.each do |os, facts|
        context 'gocd master with default parameters on #{os}' do
            let(:facts) do
                facts
            end
        end
    end
end
