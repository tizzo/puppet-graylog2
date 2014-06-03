class graylog2::web (
    $application_secret = 'CHANGE_ME',
    $graylog2_server_uris = 'http://127.0.0.1:12900/',
    $timezone = "Europe/Berlin",
    $package_location = 'https://github.com/jaxxstorm/graylog2-web-rpm/releases/download/0.20.0-rc1/graylog2-web-0.20.0-rc1.el6.noarch.rpm',
  ) {

  package { 'graylog2-web':
    ensure   => 'installed',
  }~>

  file { '/etc/graylog2/web/graylog2-web-interface.conf':
    owner   => root,
    group   => root,
    mode    => 755,
    content => template('graylog2/web.conf.erb'),
    notify  => Service['graylog2-web'],
  }~>

  service { 'graylog2-web':
    ensure => 'running',
    enable => 'true',
  }

}
