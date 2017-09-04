# gigaclass
class php::install {

  package { 'php':
    ensure => 'installed',
  }

  notify { ' php is installed. ': }

  file { '/etc/php.ini':
    ensure  => file,
    content => epp('php/php.ini.epp'),
  }

  notify { ' php.ini is updated. ': }
}
