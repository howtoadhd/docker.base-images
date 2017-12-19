shared_examples 'user::www-data' do
  describe user('www-data') do
    it { should exist }
    it { should have_uid 82 }
    it { should belong_to_primary_group 'app' }
    it { should have_home_directory '/app/www' }
    it { should have_login_shell '/sbin/nologin' }
  end
end