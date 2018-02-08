shared_examples 'php::dev::cli::config' do

  describe php_cli_config('error_reporting') do
    its(:value) { should eq 32767 } # E_ALL | E_STRICT
  end

  describe php_cli_config('display_errors') do
    its(:value) { should eq 'STDOUT' }
  end

  describe php_cli_config('opcache.validate_timestamps') do
    its(:value) { should eq 'On' }
  end

  describe php_cli_config('xdebug.remote_enable') do
    its(:value) { should eq 'On' }
  end

  describe php_cli_config('xdebug.remote_autostart') do
    its(:value) { should eq 'On' }
  end

  describe php_cli_config('xdebug.remote_connect_back') do
    its(:value) { should eq 'Off' }
  end

  describe php_cli_config('xdebug.remote_handler') do
    its(:value) { should eq 'dbgp' }
  end

  describe php_cli_config('xdebug.profiler_enable') do
    its(:value) { should eq 'Off' }
  end

  describe php_cli_config('xdebug.profiler_output_dir') do
    its(:value) { should eq '/app' }
  end

  describe php_cli_config('xdebug.remote_port') do
    its(:value) { should eq 9000 }
  end
end
