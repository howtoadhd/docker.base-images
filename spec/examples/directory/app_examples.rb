shared_examples 'directory::app' do
  describe file('/app') do
    it { should exist }
    it { should be_directory }

    it { should be_mode 750 }
    it { should be_owned_by 'app' }
    it { should be_grouped_into 'app' }

    it { should be_readable }
    it { should be_writable }
    it { should be_executable }

    it { should be_readable.by('owner') }
    it { should be_writable.by('owner') }
    it { should be_executable.by('owner') }

    it { should be_readable.by('group') }
    it { should_not be_writable.by('group') }
    it { should be_executable.by('group') }

    it { should_not be_readable.by('others') }
    it { should_not be_writable.by('others') }
    it { should_not be_executable.by('others') }
  end
end