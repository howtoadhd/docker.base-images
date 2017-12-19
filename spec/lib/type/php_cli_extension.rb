module H2ADockerBase::Type
  class PhpCliExtension < Serverspec::Type::Base
    def loaded?
      ret = @runner.run_command("php -m")

      extensions = ret.stdout
                       .gsub(/^(\[.*\]|$\n)/, '')
                       .split(/\n+/)
                       .uniq

      return false unless extensions.include? name

      true
    end
  end
end