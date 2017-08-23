require 'spec_helper'
describe 'gocd' do
  context 'with default values for all parameters' do
    it { should contain_class('gocd') }
  end
end
