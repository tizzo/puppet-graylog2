class graylog2::server (
    $is_master = 'true',
    $password_secret = 'secret',
    $root_username = 'admin',
    $root_password_sha256 = '',
    $rest_listen_uri = 'http://0.0.0.0:12900/',
    $elasticsearch_max_docs_per_index = 20000000,
    $elasticsearch_cluster_name = 'graylog2',
    $elasticsearch_node_name = 'graylog2-server',
    $elasticsearch_discovery_zen_ping_multicast_enabled = false,
    $elasticsearch_discovery_zen_ping_unicast_hosts = '127.0.0.1:9300',
    $elasticsearch_index_prefix = 'graylog2',
    $elasticsearch_replicas = 0,
    $elasticsearch_shards = 1,
    $elasticsearch_max_number_of_indices = 20,
    $retention_strategy = 'delete',
    $mongodb_useauth = 'false',
    $mongodb_host = '127.0.0.1',
    $network_host = false,
    $elasticsearch_node_master = 'false',
    $elasticsearch_node_data = 'false',
    $server_package_location = $graylog2::params::server_package_location,
    $package_provider = $graylog2::params::package_provider
  ) inherits graylog2::params {

  include graylog2::install

  package { 'graylog2-server':
    ensure   => 'installed',
    require  => Apt::Source['graylog2'],
  }~>

  file { '/etc/default/graylog2-server':
    owner   => 'root',
    group   => 'root',
    content => "# Change to yes, to enable Graylog2 on boot\nRUN=yes"
  }~>

  file { '/etc/default/graylog2-web':
    owner   => 'root',
    group   => 'root',
    content => "# Change to yes, to enable Graylog2 on boot\nRUN=yes"
  }

  file { '/etc/graylog2/server/server.conf':
    owner => root,
    group => root,
    mode  => 755,
    content => template('graylog2/graylog2-server.conf.erb'),
    notify => Service['graylog2-server'],
  }~>

  file { '/etc/graylog2-server-node-id':
    owner  => $graylog2::params::graylog2_user,
    ensure => 'file',
    group  => 'root',
    mode   => 755,
  }->

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

