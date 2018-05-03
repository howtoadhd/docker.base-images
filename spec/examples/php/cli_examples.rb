shared_examples 'php::cli' do

  describe package('php7') do
    it { should be_installed }
  end

  describe file('/usr/bin/php') do
    it { should exist }
    it { should be_file }
    it { should be_symlink }
    it { should be_executable }
  end

  describe package('php7-phar') do
    it { should be_installed }
  end

  describe php_fpm_extension('cgi-fcgi') do
    it { should_not be_loaded }
  end

  describe php_cli_extension('Core') do
    it { should be_loaded }
  end

  describe php_cli_extension('date') do
    it { should be_loaded }
  end

  describe php_cli_extension('filter') do
    it { should be_loaded }
  end

  describe php_cli_extension('hash') do
    it { should be_loaded }
  end

  describe php_cli_extension('libxml') do
    it { should be_loaded }
  end

  describe php_cli_extension('pcntl') do
    it { should be_loaded }
  end

  describe php_cli_extension('pcre') do
    it { should be_loaded }
  end

  describe php_cli_extension('Phar') do
    it { should be_loaded }
  end

  describe php_cli_extension('readline') do
    it { should be_loaded }
  end

  describe php_cli_extension('Reflection') do
    it { should be_loaded }
  end

  describe php_cli_extension('SPL') do
    it { should be_loaded }
  end

  describe php_cli_extension('standard') do
    it { should be_loaded }
  end

  describe php_cli_extension('zlib') do
    it { should be_loaded }
  end
end
