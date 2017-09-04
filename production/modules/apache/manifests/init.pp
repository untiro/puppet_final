# bla bla bla :)
class apache {
  $student_name    =   'Yury Shchanouski'

  case $facts['os']['name'] {
  'RedHat', 'CentOS':  {
  $pkg    =  'httpd'
  $node         =       'node2'
  $index_path  =  "/var/www/${node}/index.html"
  $vhost_path  =  "/etc/httpd/conf.modules.d/${node}.conf"
  $user_group  =  'apache'
  }
  /^(Debian|Ubuntu)$/: {
  $pkg          =       'apache2'
  $node    =  'node1'
  $index_path   =       "/var/www/${node}/index.html"
  $vhost_path   =       "/etc/apache2/sites-enabled/${node}.conf"
  $user_group   =       'root'
  }
  default:             {
    notify { 'Unknown OS. Nothing to do.': }
  }
}

package { $pkg:
  ensure=>'installed',
}

notify { "${pkg} is installed.":
}

$index_content_hash = {
  'student_name'        => $student_name,
  'node'    => $node,
}

file { "/var/www/${node}":
  ensure => directory,
  owner  => $user_group,
  group  => $user_group,
  mode   => '0644',
}

$node_conf_hash = {
  'host_name'  =>  $node,
}

file { $vhost_path:
  content => epp('apache/host.conf.epp', $node_conf_hash),
  notify  => Service[$pkg],
}

file { $index_path:
  content => epp('apache/index.html.epp', $index_content_hash),
  notify  => Service[$pkg],
}

service { $pkg:
  ensure => 'running',
}

notify { "${pkg} is running.":
}

}
