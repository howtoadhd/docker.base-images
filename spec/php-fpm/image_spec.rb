require 'spec_helper'

describe 'PHP FPM:' do
  before(:all) do
    set :backend, :exec
  end

  describe docker_image('builder:php-fpm') do
    its(['Os']) { should eq 'linux' }
    its(['Architecture']) { should eq 'amd64' }
    its(['Config.Cmd']) { should eq ['php-fpm'] }
    its(['Config.User']) { should eq 'root' }
    its(['Config.Entrypoint']) { should eq ['docker-php-entrypoint'] }
    its(['Config.WorkingDir']) { should eq '/app' }
    its(['Config.ExposedPorts']) { should include '9000/tcp' }
  end
end
