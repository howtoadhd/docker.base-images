require 'spec_helper'

describe 'App Builder:' do
  before(:all) do
    set :backend, :exec
  end

  describe docker_image('builder:app-builder') do
    its(['Os']) { should eq 'linux' }
    its(['Architecture']) { should eq 'amd64' }
    its(['Config.Cmd']) { should eq ['/bin/bash'] }
    its(['Config.User']) { should eq 'root' }
    its(['Config.Entrypoint']) { should eq ['/bin/sh', '-c'] }
    its(['Config.WorkingDir']) { should eq '/app' }
  end
end
