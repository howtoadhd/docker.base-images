require 'iniparse'

module H2ADockerBase::Type
  class IniFile < Serverspec::Type::Base
    def value
      ini = @options.has_key?(:ini) ? @options[:ini] : '/etc/php7/php-fpm.conf'
      ret            = @runner.run_command("cat #{ini}")
      ini            = IniParse.parse(ret.stdout)
      name           = @name.split ':'
      ini.to_hash[name[0]][name[1]]
    end
  end
end
