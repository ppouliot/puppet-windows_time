require 'spec_helper'
describe 'windows_time' do

  context 'with defaults for all parameters' do
    it { should contain_class('windows_time') }
  end
end
