class graylog2::server::install (
    $package_location = 'https://github.com/jaxxstorm/graylog2-server-rpm/releases/download/0.20.0-rc1/graylog2-server-0.20.0-rc1.el6.noarch.rpm',
  ) {

  package { 'graylog2-server':
    provider => 'rpm',
    source   => $package_location,
    ensure   => 'installed',
  }

}

