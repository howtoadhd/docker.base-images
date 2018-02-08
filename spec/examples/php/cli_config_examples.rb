shared_examples 'php::cli::config' do
  describe php_cli_config('user_ini.filename') do
    its(:value) { should eq nil }
  end

  describe php_cli_config('short_open_tag') do
    its(:value) { should eq 'Off' }
  end

  describe php_cli_config('precision') do
    its(:value) { should eq 14 }
  end

  describe php_cli_config('output_buffering') do
    its(:value) { should eq 0 }
  end

  describe php_cli_config('zlib.output_compression') do
    its(:value) { should eq 'Off' }
  end

  describe php_cli_config('implicit_flush') do
    its(:value) { should eq 'On' }
  end

  describe php_cli_config('unserialize_callback_func') do
    its(:value) { should eq nil }
  end

  describe php_cli_config('serialize_precision') do
    its(:value) { should eq 17 }
  end

  describe php_cli_config('disable_functions') do
    its(:value) { should eq nil }
  end

  describe php_cli_config('disable_classes') do
    its(:value) { should eq nil }
  end

  describe php_cli_config('zend.enable_gc') do
    its(:value) { should eq 'On' }
  end

  describe php_cli_config('expose_php') do
    its(:value) { should eq 'Off' }
  end

  describe php_cli_config('max_execution_time') do
    its(:value) { should eq 0 }
  end

  describe php_cli_config('max_input_time') do
    its(:value) { should eq -1 }
  end

  describe php_cli_config('max_input_vars') do
    its(:value) { should eq 1000 }
  end

  describe php_cli_config('memory_limit') do
    its(:value) { should eq '256M' }
  end

  describe php_cli_config('display_startup_errors') do
    its(:value) { should eq 'Off' }
  end

  describe php_cli_config('log_errors') do
    its(:value) { should eq 'On' }
  end

  describe php_cli_config('log_errors_max_len') do
    its(:value) { should eq 1024 }
  end

  describe php_cli_config('ignore_repeated_errors') do
    its(:value) { should eq 'Off' }
  end

  describe php_cli_config('ignore_repeated_source') do
    its(:value) { should eq 'Off' }
  end

  describe php_cli_config('report_memleaks') do
    its(:value) { should eq 'On' }
  end

  describe php_cli_config('track_errors') do
    its(:value) { should eq 'Off' }
  end

  describe php_cli_config('html_errors') do
    its(:value) { should eq 'Off' }
  end

  describe php_cli_config('variables_order') do
    its(:value) { should eq 'GPCS' }
  end

  describe php_cli_config('request_order') do
    its(:value) { should eq 'GP' }
  end

  describe php_cli_config('register_argc_argv') do
    its(:value) { should eq 'On' }
  end

  describe php_cli_config('auto_globals_jit') do
    its(:value) { should eq 'On' }
  end

  describe php_cli_config('post_max_size') do
    its(:value) { should eq '150M' }
  end

  describe php_cli_config('auto_prepend_file') do
    its(:value) { should eq nil }
  end

  describe php_cli_config('auto_append_file') do
    its(:value) { should eq nil }
  end

  describe php_cli_config('default_mimetype') do
    its(:value) { should eq 'text/html' }
  end

  describe php_cli_config('default_charset') do
    its(:value) { should eq 'UTF-8' }
  end

  describe php_cli_config('doc_root') do
    its(:value) { should eq nil }
  end

  describe php_cli_config('user_dir') do
    its(:value) { should eq nil }
  end

  describe php_cli_config('enable_dl') do
    its(:value) { should eq 'Off' }
  end

  describe php_cli_config('file_uploads') do
    its(:value) { should eq 'On' }
  end

  describe php_cli_config('upload_max_filesize') do
    its(:value) { should eq '150M' }
  end

  describe php_cli_config('max_file_uploads') do
    its(:value) { should eq 20 }
  end

  describe php_cli_config('allow_url_fopen') do
    its(:value) { should eq 'On' }
  end

  describe php_cli_config('allow_url_include') do
    its(:value) { should eq 'Off' }
  end

  describe php_cli_config('default_socket_timeout') do
    its(:value) { should eq 60 }
  end

  describe php_cli_config('pdo_mysql.default_socket') do
    its(:value) { should eq '/run/mysqld/mysqld.sock' }
  end

  describe php_cli_config('sendmail_path') do
    its(:value) { should eq '/usr/sbin/sendmail -t -i' }
  end

  describe php_cli_config('mail.add_x_header') do
    its(:value) { should eq 'On' }
  end

  describe php_cli_config('sql.safe_mode') do
    its(:value) { should eq 'Off' }
  end

  describe php_cli_config('mysqli.max_persistent') do
    its(:value) { should eq 'Unlimited' }
  end

  describe php_cli_config('mysqli.allow_persistent') do
    its(:value) { should eq 'On' }
  end

  describe php_cli_config('mysqli.max_links') do
    its(:value) { should eq 'Unlimited' }
  end

  describe php_cli_config('mysqli.default_port') do
    its(:value) { should eq 3306 }
  end

  describe php_cli_config('mysqli.default_socket') do
    its(:value) { should eq '/run/mysqld/mysqld.sock' }
  end

  describe php_cli_config('mysqli.default_host') do
    its(:value) { should eq nil }
  end

  describe php_cli_config('mysqli.default_user') do
    its(:value) { should eq nil }
  end

  describe php_cli_config('mysqli.default_pw') do
    its(:value) { should eq nil }
  end

  describe php_cli_config('mysqli.reconnect') do
    its(:value) { should eq 'Off' }
  end

  describe php_cli_config('opcache.blacklist_filename') do
    its(:value) { should eq nil }
  end

  describe php_cli_config('opcache.consistency_checks') do
    its(:value) { should eq 0 }
  end

  describe php_cli_config('opcache.dups_fix') do
    its(:value) { should eq 'Off' }
  end

  describe php_cli_config('opcache.enable') do
    its(:value) { should eq 'On' }
  end

  describe php_cli_config('opcache.enable_cli') do
    its(:value) { should eq 'Off' }
  end

  describe php_cli_config('opcache.enable_file_override') do
    its(:value) { should eq 'Off' }
  end

  describe php_cli_config('opcache.error_log') do
    its(:value) { should eq nil }
  end

  describe php_cli_config('opcache.fast_shutdown') do
    its(:value) { should eq 1 }
  end

  describe php_cli_config('opcache.file_cache') do
    its(:value) { should eq nil }
  end

  describe php_cli_config('opcache.file_cache_consistency_checks') do
    its(:value) { should eq 1 }
  end

  describe php_cli_config('opcache.file_cache_only') do
    its(:value) { should eq 0 }
  end

  describe php_cli_config('opcache.file_update_protection') do
    its(:value) { should eq 2 }
  end

  describe php_cli_config('opcache.force_restart_timeout') do
    its(:value) { should eq 180 }
  end

  describe php_cli_config('opcache.huge_code_pages') do
    its(:value) { should eq 'Off' }
  end

  describe php_cli_config('opcache.inherited_hack') do
    its(:value) { should eq 'On' }
  end

  describe php_cli_config('opcache.interned_strings_buffer') do
    its(:value) { should eq 16 }
  end

  describe php_cli_config('opcache.lockfile_path') do
    its(:value) { should eq '/tmp' }
  end

  describe php_cli_config('opcache.log_verbosity_level') do
    its(:value) { should eq 1 }
  end

  describe php_cli_config('opcache.max_accelerated_files') do
    its(:value) { should eq 10000 }
  end

  describe php_cli_config('opcache.max_file_size') do
    its(:value) { should eq 0 }
  end

  describe php_cli_config('opcache.max_wasted_percentage') do
    its(:value) { should eq 5 }
  end

  describe php_cli_config('opcache.memory_consumption') do
    its(:value) { should eq 192 }
  end

  describe php_cli_config('opcache.opt_debug_level') do
    its(:value) { should eq 0 }
  end

  describe php_cli_config('opcache.optimization_level') do
    its(:value) { should eq '0x7FFFBFFF' }
  end

  describe php_cli_config('opcache.preferred_memory_model') do
    its(:value) { should eq nil }
  end

  describe php_cli_config('opcache.protect_memory') do
    its(:value) { should eq 0 }
  end

  describe php_cli_config('opcache.restrict_api') do
    its(:value) { should eq nil }
  end

  describe php_cli_config('opcache.revalidate_freq') do
    its(:value) { should eq 0 }
  end

  describe php_cli_config('opcache.revalidate_path') do
    its(:value) { should eq 'Off' }
  end

  describe php_cli_config('opcache.save_comments') do
    its(:value) { should eq 1 }
  end

  describe php_cli_config('opcache.use_cwd') do
    its(:value) { should eq 'On' }
  end

  describe php_cli_config('opcache.validate_permission') do
    its(:value) { should eq 'Off' }
  end

  describe php_cli_config('opcache.validate_root') do
    its(:value) { should eq 'Off' }
  end

  describe php_cli_config('session.save_handler') do
    its(:value) { should eq 'files' }
  end

  describe php_cli_config('session.use_cookies') do
    its(:value) { should eq 'On' }
  end

  describe php_cli_config('session.use_only_cookies') do
    its(:value) { should eq 'On' }
  end

  describe php_cli_config('session.name') do
    its(:value) { should eq 'PHPSESSID' }
  end

  describe php_cli_config('session.auto_start') do
    its(:value) { should eq 'Off' }
  end

  describe php_cli_config('session.cookie_lifetime') do
    its(:value) { should eq 0 }
  end

  describe php_cli_config('session.cookie_path') do
    its(:value) { should eq '/' }
  end

  describe php_cli_config('session.cookie_domain') do
    its(:value) { should eq nil }
  end

  describe php_cli_config('session.cookie_httponly') do
    its(:value) { should eq 'Off' }
  end

  describe php_cli_config('session.serialize_handler') do
    its(:value) { should eq 'php' }
  end

  describe php_cli_config('session.gc_probability') do
    its(:value) { should eq 1 }
  end

  describe php_cli_config('session.gc_divisor') do
    its(:value) { should eq 1000 }
  end

  describe php_cli_config('session.gc_maxlifetime') do
    its(:value) { should eq 1440 }
  end

  describe php_cli_config('session.referer_check') do
    its(:value) { should eq nil }
  end

  describe php_cli_config('session.cache_limiter') do
    its(:value) { should eq 'nocache' }
  end

  describe php_cli_config('session.cache_expire') do
    its(:value) { should eq 180 }
  end

  describe php_cli_config('session.use_trans_sid') do
    its(:value) { should eq 0 }
  end

  describe php_cli_config('url_rewriter.tags') do
    its(:value) { should eq 'a=href,area=href,frame=src,input=src,form=fakeentry' }
  end
end
