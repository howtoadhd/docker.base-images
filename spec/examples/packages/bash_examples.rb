shared_examples 'packages::bash' do
  describe package('bash') do
    it { should be_installed }
  end
end