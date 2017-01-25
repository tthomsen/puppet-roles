require 'spec_helper'

describe 'roles' do
  context 'supported operating systems' do
    on_supported_os.each do |os, facts|
      context "on #{os}" do
        let(:facts) do
          facts
        end

        context "roles class without any parameters" do
          it { is_expected.to compile.with_all_deps }

          it { is_expected.to contain_class('roles::params') }
          it { is_expected.to contain_class('roles::install').that_comes_before('roles::config') }
          it { is_expected.to contain_class('roles::config') }
          it { is_expected.to contain_class('roles::service').that_subscribes_to('roles::config') }

          it { is_expected.to contain_service('roles') }
          it { is_expected.to contain_package('roles').with_ensure('present') }
        end
      end
    end
  end

  context 'unsupported operating system' do
    describe 'roles class without any parameters on Solaris/Nexenta' do
      let(:facts) do
        {
          :osfamily        => 'Solaris',
          :operatingsystem => 'Nexenta',
        }
      end

      it { expect { is_expected.to contain_package('roles') }.to raise_error(Puppet::Error, /Nexenta not supported/) }
    end
  end
end
