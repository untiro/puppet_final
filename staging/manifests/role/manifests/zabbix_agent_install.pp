class role::zabbix_agent_install {
  include profile::zabbix_repo::repo
  include profile::zabbix_agent::install  
}
