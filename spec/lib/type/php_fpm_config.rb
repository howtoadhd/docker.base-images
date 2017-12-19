require 'nokogiri'
require 'json'

module H2ADockerBase::Type
  class PhpFpmConfig < Serverspec::Type::Base

    @@cache = {}

    def _parse_phpinfo

      if @runner.run_command('cgi-fcgi --help').exit_status.to_i > 0
        @runner.run_command('apk add --no-cache fcgi')
      end

      @runner.run_command('echo "<?php phpinfo(INFO_CONFIGURATION | INFO_MODULES);" > /app/www/info.php;')

      fcgi_cmd = 'SCRIPT_NAME="/app/www/info.php" SCRIPT_FILENAME="/app/www/info.php" DOCUMENT_ROOT="/" REQUEST_METHOD=GET cgi-fcgi -bind -connect 127.0.0.1:9000'

      ret = @runner.run_command(fcgi_cmd)

      document = Nokogiri::HTML(ret.stdout)

      configs = {}

      document.css('tr').each do |row|
        cells = row.css('td')

        if cells.count === 3
          contents = []

          cells.each do |cell|
            cell = cell.content.gsub(/[[:space:]]/, ' ')
            cell = cell.to_i if cell.match(/^-?\d+$/)
            cell = nil if cell === 'no value'
            contents.push cell
          end

          configs[contents[0]] = { local: contents[1], master: contents[2] }
        end
      end

      @runner.run_command('rm -f /app/info.php')

      configs
    end

    def phpinfo
      hostname          = @runner.run_command('hostname').stdout

      @@cache[hostname] = _parse_phpinfo unless @@cache[hostname]

      @@cache[hostname]
    end

    def value
      configs = phpinfo

      return nil unless configs[@name]

      configs[@name][:local]
    end
  end
end
