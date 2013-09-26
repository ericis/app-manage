class redis::config (
  $owner = 'redis',
  $group = 'redis',
  $ensure = 'present',
  $listen_address = '127.0.0.1',
  $listen_port = '6379',
  $unixsocket = '',
  $unixsocketperm = '755',
  $timeout = '0',
  $tcp_keepalive = '0',
  $redis_loglevel = 'notice',
  $logfile = 'stdout',
  $syslog_enabled = 'no',
  $syslog_ident = 'redis',
  $syslog_facility = 'local0',
  $databases = '16',
  $save = [ '900 1', '300 10', '60 10000'],    #Array for each save line
  $stop_writes_on_bgsave_error = 'yes',
  $rdbcompression = 'yes',
  $rdbchecksum = 'yes',
  $dbfilename = 'dump.rdb',
  $dir = "./",
  $slaveof = '',
  $masterauth = '',
  $slave_serve_stale_data = 'yes',
  $slave_read_only = 'yes',
  $repl_ping_slave_period = '10',
  $repl_timeout = '60',
  $repl_disable_tcp_nodelay = 'no',
  $slave_priority = '100',
  $requirepass = '',
  $rename_command = '',  #Array of each rename command line
  $maxclients = '10000',
  $maxmemory = '',
  $maxmemory_policy = 'volatile-lru',
  $maxmemory_samples = '3',
  $appendonly = 'no',
  $appendfilename = 'appendonly.aof',
  $appendfsync = 'everysec',
  $no_appendfsync_on_rewrite = 'no',
  $auto_aof_rewrite_percentage = '100',
  $auto_aof_rewrite_min_size = '64mb',
  $lua_time_limit = '5000',
  $slowlog_log_slower_than = '10000',
  $slowlog_max_len = '128',
  $hash_max_ziplist_entries = '512',
  $hash_max_ziplist_value = '64',
  $list_max_ziplist_entries = '512',
  $list_max_ziplist_value = '64',
  $set_max_intset_entries = '512',
  $zset_max_ziplist_entries = '128',
  $zset_max_ziplist_value = '64',
  $activerehashing = 'yes',
  $client_output_buffer_limit = ['normal 0 0 0', 'slave 256mb 64mb 60', 'pubsub 32mb 8mb 60' ],
  $hz = '10',
  $aof_rewrite_incremental_fsync = 'yes'
) {

  if $ensure == present {
    $file_ensure = file
  } else {
    $file_ensure = absent
  }

  file { '/etc/redis.conf':
    ensure  => $file_ensure,
    owner   => $owner,
    group   => $group,
    mode    => '0444',
    content => template('redis/redis.conf.erb'),
  }
}
