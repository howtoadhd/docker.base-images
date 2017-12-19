shared_examples 'user::app' do
  describe user('app') do
    it { should exist }
    it { should have_uid 83 }
    it { should belong_to_primary_group 'app' }
    it { should have_home_directory '/app' }
    it { should have_login_shell '/sbin/nologin' }
  end
end