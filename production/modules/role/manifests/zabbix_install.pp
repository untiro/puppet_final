# bla bla bla :)
class role::zabbix_install {
  include profile::zabbix_repo::repo
  include profile::zabbix_server::install
  include profile::mysql_inst::mariadb
  include profile::httpd::install
  include profile::zabbix_agent::install
}
