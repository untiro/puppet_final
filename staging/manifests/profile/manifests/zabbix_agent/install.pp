class profile::zabbix_agent::install {
  package { 'zabbix-agent':
    ensure => 'installed', 
  }

  notify { ' zabbix-agent is installed. ': }

  case $facts['fqdn'] {
    'node1.minsk.epam.com': { 
    $node_name  = 'Zabbix server'
    $server_ip  = '127.0.0.1'
    }
    default:             { 
      $server_ip  = '192.168.56.21'
      $node_name  = $facts['fqdn']
    }
  }

  $zabbix_agentd_hash = {
    'server_ip'  => $server_ip,
    'node_name'  => $node_name,
  }

  file { '/etc/zabbix/zabbix_agentd.conf':
    ensure  => file,
    content => epp('profile/zabbix_agent_zabbix_agentd.conf.epp', $zabbix_agentd_hash),
    notify  => Service['zabbix-agent']
  }

  service { 'zabbix-agent':
    ensure => 'running',
    enable => true,
  }
 

}