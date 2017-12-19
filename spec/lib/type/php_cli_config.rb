module H2ADockerBase::Type
  class PhpCliConfig < Serverspec::Type::Base

    @@cache = {}

    def _parse_phpinfo

      ret = @runner.run_command("php -r 'echo phpinfo(INFO_CONFIGURATION | INFO_MODULES);'")

      ret = ret.stdout.split("\n").select { |l| l[/.* => .* => .*/] }

      configs = {}

      ret.each do |l|
        next if 'Directive => Local Value => Master Value' == l

        l    = l.split ' => '

        l[1] = l[1].to_i if l[1].match(/^-?\d+$/)
        l[1] = nil if l[1] === 'no value'

        l[2] = l[2].to_i if l[2].match(/^-?\d+$/)
        l[2] = nil if l[2] === 'no value'

        configs[l[0]] = { local: l[1], master: l[2] }
      end

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
