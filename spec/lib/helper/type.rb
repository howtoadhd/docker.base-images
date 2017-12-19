module H2ADockerBase
  module Helper
    module Type
      types = [
          'ini_file',
          'nginx_config',
          'php_cli_config',
          'php_cli_extension',
          'php_fpm_config',
          'php_fpm_extension',
      ]

      types.each { |type| require_relative "../type/#{type}" }

      types.each do |type|
        define_method type do |*args|
          eval "H2ADockerBase::Type::#{type.to_camel_case}.new(*args)"
        end
      end
    end
  end
end