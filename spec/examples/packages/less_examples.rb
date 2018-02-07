shared_examples 'packages::less' do
  describe package('less') do
    it { should be_installed }
  end
end