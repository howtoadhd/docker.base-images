shared_examples 'nginx:nginx' do

  describe package('nginx') do
    it { should be_installed }
  end

  describe port(80) do
    it { should be_listening.on('0.0.0.0').with('tcp') }
  end

  describe nginx_config do
    it { should be_valid }
  end
end
