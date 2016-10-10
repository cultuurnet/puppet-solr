class solr::config {

  solr::setting { 'JETTY_USER': value   => $solr::user }
  solr::setting { 'JETTY_HOST': value   => $solr::listen_address }
  solr::setting { 'JETTY_PORT': value   => $solr::listen_port }
  solr::setting { 'JAVA_OPTIONS': value => "-Dsolr.solr.home=/opt/solr/solr -Xmx${solr::max_heap} \$JAVA_OPTIONS" }
}
