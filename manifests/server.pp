class graylog2::server (
    $is_master = 'true',
    $password_secret = 'secret',
    $root_username = 'admin',
    $root_password_sha2 = '',
    $rest_listen_uri = 'http://127.0.0.1:12900/',
    $elasticsearch_max_docs_per_index = 20000000,
    $elasticsearch_cluster_name = 'graylog2',
    $elasticsearch_node_name = 'graylog2-server',
    $elasticsearch_discovery_zen_ping_multicast_enabled = false,
    $elasticsearch_discovery_zen_ping_unicast_hosts = '127.0.0.1:9200',
    $elasticsearch_index_prefix = 'graylog2',
    $elasticsearch_replicas = 0,
    $elasticsearch_shards = 4,
    $elasticsearch_max_number_of_indices = 20,
    $retention_strategy = 'delete',
    $mongodb_useauth = 'false',
    $mongodb_host = '127.0.0.1',
    $network_host = false
  ) {

  class { 'graylog2::server::install': }~>

  file { '/etc/graylog2/server.conf':
    owner => root,
    group => root,
    mode  => 755,
    content => template('graylog2/graylog2-server.conf.erb'),
  }~>

  file { '/etc/graylog2/graylog2-elasticsearch.yml':
    owner => root,
    group => root,
    mode  => 755,
    content => template('graylog2/graylog2-elasticsearch.yml.erb'),
  }~>

  service { 'graylog2-server':
    enable => 'true',
    ensure => 'running',
  }
}
