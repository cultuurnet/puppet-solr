# Class: solr
class solr (
  $user           = $solr::params::user,
  $group          = $solr::params::group,
  $home_dir       = $solr::params::home_dir,
  $package_name   = $solr::params::package_name,
  $package_ensure = $solr::params::package_ensure,
  $max_heap       = $solr::params::max_heap,
  $listen_address = $solr::params::listen_address,
  $listen_port    = $solr::params::listen_port,
  $service_manage = $solr::params::service_manage,
  $service_enable = $solr::params::service_enable,
  $service_ensure = $solr::params::service_ensure,
  $cores          = {}
) inherits solr::params {

  include solr::install
  include solr::config
  include solr::service

  if is_hash($cores) {
    create_resources(solr::core, $cores)
  }

  Class['solr::install'] -> Class['solr::config']
  Class['solr::install'] -> Solr::Core <| |>
  Class['solr::config'] ~> Class['solr::service']
  Solr::Core <| |> ~> Class['solr::service']
}
