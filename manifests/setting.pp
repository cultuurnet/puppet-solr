define solr::setting (
  $value
) {

  $key = $title

  augeas { $key:
    lens    => 'Sysctl.lns',
    incl    => '/etc/default/solr',
    context => '/files/etc/default/solr',
    changes => [
      "set ${key} '${value}'",
    ]
  }
}
