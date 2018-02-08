shared_examples 'php::dev::cli::extensions' do

  php_extensions = [
      { :package => 'xdebug' },
  ]

  php_extensions.each do |ext|

    ext[:name] = ext[:package] unless ext[:name]

    describe package("php7-#{ext[:package]}") do
      it { should be_installed }
    end

    describe php_cli_extension(ext[:name]) do
      it { should be_loaded }
    end
  end
end