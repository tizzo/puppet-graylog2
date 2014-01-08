class graylog2::webui::install {

  $serverTarLocation = 'https://github.com/Graylog2/graylog2-server/releases/download/0.20.0-preview.8/graylog2-server-0.20.0-preview.8.tgz'
  $release_name = 'graylog2-server-0.20.0-preview.8'

  class { 'staging':
    path  => '/tmp/staging',
    owner => 'root',
    group => 'root',
  }

  file { '/tmp/graylog2-server':
    ensure => directory,
    owner  => root,
    group  => root,
  }->
  file { '/opt/graylog2-server':
    ensure => directory,
    owner  => root,
    group  => root,
  }->

  staging::file { 'graylog2-server.tgz':
    source => $serverTarLocation,
  }->

  staging::extract { 'graylog2-server.tgz':
    target  => '/tmp/graylog2-server',
    creates => "/tmp/graylog2-server/${$release_name}",
  }->

  exec { "/bin/cp -r /tmp/graylog2-server/${release_name}/* /opt/graylog2-server":
    creates => '/opt/graylog2-server/README.markdown',
  }
}

