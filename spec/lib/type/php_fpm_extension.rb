module H2ADockerBase::Type
  class PhpFpmExtension < Serverspec::Type::Base
    def loaded?
      ret = @runner.run_command("php-fpm -m")

      extensions = ret.stdout
                       .gsub(/^(\[.*\]|$\n)/, '')
                       .split(/\n+/)
                       .uniq

      return false unless extensions.include? name

      true
    end
  end
end