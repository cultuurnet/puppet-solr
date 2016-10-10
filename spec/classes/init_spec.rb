require 'spec_helper'

describe 'solr' do
  context 'on supported operatingsystem' do
    context 'with default values for all parameters' do
      let(:facts) { {
        :operatingsystem => 'Ubuntu',
        :operatingsystemrelease => '14.04'
      } }

      it { should contain_class('solr') }
    end
  end
end
