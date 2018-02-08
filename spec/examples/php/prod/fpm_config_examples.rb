shared_examples 'php::prod::fpm::config' do

  describe php_fpm_config('error_reporting') do
    its(:value) { should eq 22527 } # E_ALL & ~E_DEPRECATED & ~E_STRICT
  end

  describe php_fpm_config('display_errors') do
    its(:value) { should eq 'Off' }
  end

  describe php_fpm_config('opcache.validate_timestamps') do
    its(:value) { should eq 'Off' }
  end

  describe php_fpm_config('max_execution_time') do
    its(:value) { should eq 30 }
  end

  describe php_fpm_config('xdebug.remote_enable') do
    its(:value) { should eq nil }
  end

  describe php_fpm_config('xdebug.remote_autostart') do
    its(:value) { should eq nil }
  end

  describe php_fpm_config('xdebug.remote_connect_back') do
    its(:value) { should eq nil }
  end

  describe php_fpm_config('xdebug.remote_handler') do
    its(:value) { should eq nil }
  end

  describe php_fpm_config('xdebug.profiler_enable') do
    its(:value) { should eq nil }
  end

  describe php_fpm_config('xdebug.profiler_output_dir') do
    its(:value) { should eq nil }
  end

  describe php_fpm_config('xdebug.remote_port') do
    its(:value) { should eq nil }
  end
end
