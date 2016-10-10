class solr::install {

  group { $solr::group:
    ensure => 'present',
    system => true
  }

  user { $solr::user:
    ensure     => 'present',
    home       => $solr::home_dir,
    gid        => $solr::group,
    system     => true,
    managehome => true,
    shell      => '/bin/bash'
  }

  package { $solr::package_name:
    ensure => $solr::package_ensure
  }

  User[$solr::user] -> Package[$solr::package_name]
}
