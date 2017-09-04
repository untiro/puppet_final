#bla bla bla
class profile::httpd::install {

  package { 'httpd':
    ensure => 'installed',
  }

  notify { ' httpd is installed. ': }

  file { '/etc/httpd/conf.d/zabbix.conf':
    ensure  => file,
    content => epp('profile/httpd_zabbix.conf.epp'),
    notify  => Service['httpd']
  }

  notify { ' virtualhost zabbix is created. ': }

  service { 'httpd':
    ensure => 'running',
    enable => true,
  }

}