shared_examples 'php::fpm::pool' do
  describe ini_file('global:error_log') do
    its (:value) { should eq '/proc/self/fd/2' }
  end
  describe ini_file('global:log_level') do
    its (:value) { should eq 'notice' }
  end
  describe ini_file('global:daemonize') do
    its (:value) { should eq 'no' }
  end
  describe ini_file('www:user') do
    its (:value) { should eq 'www-data' }
  end
  describe ini_file('www:group') do
    its (:value) { should eq 'app' }
  end
  describe ini_file('www:listen') do
    its (:value) { should eq '0.0.0.0:9000' }
  end
  describe ini_file('www:pm') do
    its (:value) { should eq 'dynamic' }
  end
  describe ini_file('www:pm.max_children') do
    its (:value) { should eq 20 }
  end
  describe ini_file('www:pm.start_servers') do
    its (:value) { should eq 5 }
  end
  describe ini_file('www:pm.min_spare_servers') do
    its (:value) { should eq 3 }
  end
  describe ini_file('www:pm.max_spare_servers') do
    its (:value) { should eq 10 }
  end
  describe ini_file('www:pm.max_requests') do
    its (:value) { should eq 500 }
  end
  describe ini_file('www:access.log') do
    its (:value) { should eq '/proc/self/fd/2' }
  end
  describe ini_file('www:slowlog') do
    its (:value) { should eq '/proc/self/fd/2' }
  end
  describe ini_file('www:request_slowlog_timeout') do
    its (:value) { should eq 10 }
  end
  describe ini_file('www:chdir') do
    its (:value) { should eq '/' }
  end
  describe ini_file('www:catch_workers_output') do
    its (:value) { should eq 'yes' }
  end
  describe ini_file('www:clear_env') do
    its (:value) { should eq 'no' }
  end
  describe ini_file('www:security.limit_extensions') do
    its (:value) { should eq '.php' }
  end
end
