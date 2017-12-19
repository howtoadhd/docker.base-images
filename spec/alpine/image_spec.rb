require 'spec_helper'

describe 'Alpine:' do
  before(:all) do
    set :backend, :exec
  end

  describe docker_image('builder:alpine') do
    its(['Os']) { should eq 'linux' }
    its(['Architecture']) { should eq 'amd64' }
    its(['Config.Cmd']) { should eq ['/bin/bash'] }
    its(['Config.User']) { should eq '' }
    its(['Config.Entrypoint']) { should eq nil }
    its(['Config.WorkingDir']) { should eq '/app' }
  end
end
