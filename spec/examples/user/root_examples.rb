shared_examples 'user::root' do
  describe user('root') do
    it { should have_login_shell '/bin/bash' }
  end
end
