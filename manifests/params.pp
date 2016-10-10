class solr::params {
  case $::operatingsystem {
    'Ubuntu': {
      case $::operatingsystemrelease {
        '14.04': {
          $ensure = 'present'
          $user = 'solr'
          $group = 'solr'
          $home_dir = '/home/solr'
          $package_name   = 'solr'
          $package_ensure = 'present'
          $max_heap       = '256m'
          $listen_address = '127.0.0.1'
          $listen_port    = '8983'
          $service_manage = true
          $service_name   = 'solr'
          $service_enable = true
          $service_ensure = 'running'
        }
        default: {
          fail("Ubuntu ${::operatingsystemrelease} not supported")
        }
      }
    }
    default: {
      fail("${::operatingsystem} not supported")
    }
  }
}
