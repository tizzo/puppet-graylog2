class graylog2::install () inherits graylog2::params {
    case $::operatingsystem {
    'RedHat', 'CentOS', 'Fedora', 'Scientific', 'Amazon', 'OracleLinux': {
      # $package_provider = 'rpm'
      # $server_package_location = "http://rpm.leebriggs.co.uk/graylog2-server-${version}.el6.noarch.rpm"
      fail('RedHat support needs moar luvz.')
    }
    'Debian', 'Ubuntu': {
      # apt::key { 'puppetlabs':
      #   key        => '016CFFD0',
      #   key_server => 'pgp.surfnet.nl',
      # }
      apt::source { 'graylog2':
        location    => 'http://finja.brachium-system.net/~jonas/packages/graylog2_repro',
        release     => 'wheezy',
        repos       => 'main',
        key         => '016CFFD0',
        key_server  => 'pgp.surfnet.nl',
        include_src => false,
      }

    }
    default: {
      fail("\"${module_name}\" provides no package default value
            for \"${::operatingsystem}\"")
    }
  }
}
