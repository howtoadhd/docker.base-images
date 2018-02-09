shared_examples 'binaries::wp' do
  describe file('/usr/bin/wp') do
    it { should exist }
    it { should be_file }

    it { should be_executable }
    it { should be_readable }
    it { should be_writable }
  end
end
