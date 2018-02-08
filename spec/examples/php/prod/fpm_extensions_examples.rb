shared_examples 'php::prod::fpm::extensions' do

  describe php_fpm_extension('xdebug') do
    it { should_not be_loaded }
  end
end