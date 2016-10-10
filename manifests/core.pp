define solr::core (
  $schema_source,
  $solrconfig_source
) {

  $core_name = $title

  File {
    owner   => $solr::user,
    group   => $solr::group,
  }

  file { "/opt/solr/solr/${core_name}":
    ensure  => 'directory',
    source  => '/opt/solr/example/collection1',
    recurse => true
  }

  file { "/opt/solr/solr/${core_name}/conf/schema.xml":
    ensure => 'file',
    source => $schema_source
  }

  file { "/opt/solr/solr/${core_name}/conf/solrconfig.xml":
    ensure => 'file',
    source => $solrconfig_source
  }

  File["/opt/solr/solr/${core_name}"] ~> Class['solr::service']
  File["/opt/solr/solr/${core_name}/conf/schema.xml"] ~> Class['solr::service']
  File["/opt/solr/solr/${core_name}/conf/solrconfig.xml"] ~> Class['solr::service']
}
