shared_examples 'binaries::composer' do
  describe file('/usr/bin/composer') do
    it { should exist }
    it { should be_file }

    it { should be_executable }
    it { should be_readable }
    it { should be_writable }
  end
end
