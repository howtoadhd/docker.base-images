shared_examples 'php::cli::extensions' do

  php_extensions = [
      { :package => 'ctype' },
      { :package => 'curl' },
      { :package => 'dom' },
      { :package => 'exif' },
      { :package => 'fileinfo' },
      { :package => 'gd' },
      { :package => 'gettext' },
      { :package => 'iconv' },
      { :package => 'intl' },
      { :package => 'json' },
      { :package => 'sodium', :name => 'sodium' },
      { :package => 'mbstring' },
      { :package => 'mcrypt' },
      { :package => 'memcached' },
      { :package => 'mysqli' },
      { :package => 'mysqlnd' },
      { :package => 'opcache', :name => 'Zend OPcache' },
      { :package => 'openssl' },
      { :package => 'pdo', :name => 'PDO' },
      { :package => 'pdo_mysql' },
      { :package => 'posix' },
      { :package => 'session' },
      { :package => 'simplexml', :name => 'SimpleXML' },
      { :package => 'tokenizer' },
      { :package => 'xml' },
      { :package => 'xmlreader' },
      { :package => 'xmlwriter' },
      { :package => 'zip' },
      { :package => 'zlib' },
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
