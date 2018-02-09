require 'spec_helper'

describe 'PHP CLI Dev:' do
  before(:all) do
    set :backend, :exec
  end

  describe docker_image('builder:php-cli-dev') do
    its(['Os']) { should eq 'linux' }
    its(['Architecture']) { should eq 'amd64' }
    its(['Config.Cmd']) { should eq ['php'] }
    its(['Config.User']) { should eq 'root' }
    its(['Config.Entrypoint']) { should eq ['docker-php-entrypoint'] }
    its(['Config.WorkingDir']) { should eq '/app' }
  end
end
