require 'spec_helper'
describe 'windows_service' do

  context 'with defaults for all parameters' do
    it { should contain_class('windows_service') }
  end
end
