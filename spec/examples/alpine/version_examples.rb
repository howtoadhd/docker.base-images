shared_examples 'alpine::version' do
  describe file('/etc/alpine-release') do
    it { should exist }
    it { should be_file }
    it { should contain '3.7.' }
  end
end