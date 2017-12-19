shared_examples 'group::app' do
  describe group('app') do
    it { should exist }
    it { should have_gid 83 }
  end
end