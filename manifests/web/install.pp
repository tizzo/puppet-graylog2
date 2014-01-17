class graylog2::web::install (
    $package_location = 'https://github.com/jaxxstorm/graylog2-web-rpm/releases/download/0.20.0-rc1/graylog2-web-0.20.0-rc1.el6.noarch.rpm',
  ) {

  package { 'graylog2-web':
    provider => 'rpm',
    source   => $package_location,
    ensure   => 'installed',
  }

}

