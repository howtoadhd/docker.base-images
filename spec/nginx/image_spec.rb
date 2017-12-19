require 'spec_helper'

describe 'Nginx:' do
  before(:all) do
    set :backend, :exec
  end

  describe docker_image('builder:nginx') do
    its(['Os']) { should eq 'linux' }
    its(['Architecture']) { should eq 'amd64' }
    its(['Config.Cmd']) { should eq ['nginx'] }
    its(['Config.User']) { should eq 'root' }
    its(['Config.Entrypoint']) { should eq ['docker-nginx-entrypoint'] }
    its(['Config.WorkingDir']) { should eq '/app' }
  end
end
