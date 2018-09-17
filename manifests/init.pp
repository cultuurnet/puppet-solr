# Class: solr
class solr (
  $user           = $solr::params::user,
  $group          = $solr::params::group,
  $home_dir       = $solr::params::home_dir,
  $package_name   = $solr::params::package_name,
  $package_ensure = $solr::params::package_ensure,
  $max_heap       = $solr::params::max_heap,
  $start_heap     = $solr::params::start_heap,
  $java_options   = $solr::params::java_options,
  $listen_address = $solr::params::listen_address,
  $listen_port    = $solr::params::listen_port,
  $service_manage = $solr::params::service_manage,
  $service_enable = $solr::params::service_enable,
  $service_ensure = $solr::params::service_ensure,
  $cores          = {}
) inherits solr::params {

  $default_java_options = [ '-Dsolr.solr.home=/opt/solr/solr' ]
  $start_heap_java_option = "-Xms${solr::start_heap}"
  $max_heap_java_option = "-Xmx${solr::max_heap}"

  $solr_java_options = join($default_java_options + $default_heap_java_option + $max_heap_java_option + $java_options, ' ')

  contain solr::install
  contain solr::config
  contain solr::service

  if is_hash($cores) {
    create_resources(solr::core, $cores)
  }

  Class['solr::install'] -> Class['solr::config']
  Class['solr::install'] -> Solr::Core <| |>
  Class['solr::config'] ~> Class['solr::service']
  Solr::Core <| |> ~> Class['solr::service']
}
