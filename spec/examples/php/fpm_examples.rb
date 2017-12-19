shared_examples 'php::fpm' do

  describe package('php7-fpm') do
    it { should be_installed }

  end

  describe file('/usr/sbin/php-fpm') do
    it { should exist }
    it { should be_file }
    it { should be_symlink }
    it { should be_executable.by_user('app') }
  end

  describe port(9000) do
    it { should be_listening.on('0.0.0.0').with('tcp') }
  end

  describe php_fpm_extension('cgi-fcgi') do
    it { should be_loaded }
  end

  describe php_fpm_extension('Core') do
    it { should be_loaded }
  end

  describe php_fpm_extension('date') do
    it { should be_loaded }
  end

  describe php_fpm_extension('filter') do
    it { should be_loaded }
  end

  describe php_fpm_extension('hash') do
    it { should be_loaded }
  end

  describe php_fpm_extension('libxml') do
    it { should be_loaded }
  end

  describe php_fpm_extension('pcre') do
    it { should be_loaded }
  end

  describe php_fpm_extension('Phar') do
    it { should_not be_loaded }
  end

  describe php_fpm_extension('readline') do
    it { should be_loaded }
  end

  describe php_fpm_extension('Reflection') do
    it { should be_loaded }
  end

  describe php_fpm_extension('SPL') do
    it { should be_loaded }
  end

  describe php_fpm_extension('standard') do
    it { should be_loaded }
  end
end
