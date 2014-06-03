class graylog2::params {

  $version = '0.20.2-1'

  case $::operatingsystem {
    'RedHat', 'CentOS', 'Fedora', 'Scientific', 'Amazon', 'OracleLinux': {
      # $package_provider = 'rpm'
      # $server_package_location = "http://rpm.leebriggs.co.uk/graylog2-server-${version}.el6.noarch.rpm"
      fail('RedHat support needs moar luvz.')
      $graylog2_user = 'graylog2'
    }
    'Debian', 'Ubuntu': {
      $graylog2_user = '_graylog2'
    }
    default: {
      fail("\"${module_name}\" provides no package default value
            for \"${::operatingsystem}\"")
    }
  }

}
