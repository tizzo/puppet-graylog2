class graylog2::web (
    $application_secret = 'CHANGE_ME',
    $graylog2_server_uris = 'http://127.0.0.1:12900/',
    $timezone = "Europe/Berlin"
  ) {

  include graylog2::web::install

  file { '/etc/graylog2-server-node-id':
    owner  => 'graylog2',
    ensure => 'file',
    group  => 'root',
    mode   => 755,
  }->

  file { '/etc/graylog2/web.conf':
    owner => root,
    group => root,
    mode  => 755,
    content => template('graylog2/web.conf.erb'),
  }~>

  service { 'graylog2-web':
    ensure => 'running',
    enable => 'true',
  }

}
