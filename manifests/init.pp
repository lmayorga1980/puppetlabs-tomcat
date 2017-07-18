# == Class: tomcat
#
# Class to manage installation and configuration of Tomcat.
#
# === Parameters
#
# @param catalina_home
#   The base directory for the Tomcat installation. Default: /opt/apache-tomcat
#
# @param user
#   The user to run Tomcat as. Default: tomcat
#
# @param group
#   The group to run Tomcat as. Default: tomcat
#
# @param manage_user
#   Boolean specifying whether or not to manage the user. Defaults to true.
#
# @param purge_connectors
#   Boolean specifying whether to purge all Connector elements from server.xml. Defaults to false.
#
# @param purge_realms
#   Boolean specifying whether to purge all Realm elements from server.xml. Defaults to false.
#
# @param manage_group
#   Boolean specifying whether or not to manage the group. Defaults to true.
#
# @param manage_properties
#   Boolean specifying whether or not to manage the catalina.properties file. Defaults to true.
class tomcat (
  $catalina_home       = $::tomcat::params::catalina_home,
  $user                = $::tomcat::params::user,
  $group               = $::tomcat::params::group,
  $install_from_source = undef,
  Boolean $purge_connectors    = false,
  Boolean $purge_realms        = false,
  Boolean $manage_user         = true,
  Boolean $manage_group        = true,
  Boolean $manage_home         = true,
  Boolean $manage_base         = true,
  Boolean $manage_properties   = true,
) inherits ::tomcat::params {

  case $::osfamily {
    'windows','Solaris','Darwin': {
      fail("Unsupported osfamily: ${::osfamily}")
    }
    default: { }
  }
}
