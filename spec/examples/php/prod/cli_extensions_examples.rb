shared_examples 'php::prod::cli::extensions' do

  describe php_cli_extension('xdebug') do
    it { should_not be_loaded }
  end
end