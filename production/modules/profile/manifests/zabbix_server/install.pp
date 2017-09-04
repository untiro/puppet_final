# bla bla bla :)
class profile::zabbix_server::install {

  package { 'zabbix-server-mysql':
    ensure => 'installed',
  }

  notify { ' zabbix-server-mysql is installed. ': }

  package { 'zabbix-web-mysql':
    ensure => 'installed',
  }

  notify { ' zabbix-web-mysql is installed. ': }

  include '::php::install'

  file { '/etc/zabbix/zabbix_server.conf':
    ensure  => file,
    content => epp('profile/zabbix_server_zabbix_server.conf.epp'),
    notify  => Service['zabbix-server']
  }

  file { '/etc/zabbix/web/zabbix.conf.php':
    ensure  => file,
    content => epp('profile/zabbix_server_zabbix.conf.php.epp'),
    notify  => Service['zabbix-server']
  }

  service { 'zabbix-server':
    ensure => 'running',
    enable => true,
  }

}
