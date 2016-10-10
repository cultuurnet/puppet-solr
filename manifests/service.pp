class solr::service {

  if $solr::service_manage {
    service { 'solr':
      enable => $solr::service_enable,
      ensure => $solr::service_ensure
    }
  }
}
