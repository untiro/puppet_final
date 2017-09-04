# bla bla bla :)
class profile::mysql_inst::mariadb (
  $user = lookup('profile::mysql_inst::mariadb::user'),
  $pass = lookup('profile::mysql_inst::mariadb::pass'),
  $db = lookup('profile::mysql_inst::mariadb::db'),
  $db_server = lookup('profile::mysql_inst::mariadb::db_server'),
) {

  class { '::mysql::server':
    package_name            => 'mariadb-server',
    remove_default_accounts => true,
  }

  mysql::db { $db:
    user           => $user,
    password       => $pass,
    host           => $db_server,
    grant          => ['ALL'],
    sql            => '/usr/share/doc/zabbix-server-mysql-3.4.1/create.sql.gz',
    import_cat_cmd => 'zcat',
    import_timeout => 900,
  }

}
