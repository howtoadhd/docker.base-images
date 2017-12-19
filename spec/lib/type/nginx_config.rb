module H2ADockerBase::Type
  class NginxConfig < Serverspec::Type::Base
    def valid?
      ret = @runner.run_command('nginx -t')

      return false if ret.exit_status.to_i > 0

      true
    end
  end
end
