#bla bla bla :)
class mysql_inst::db {

  class { '::mysql::server':
    root_password           => 'strongpassword',
    remove_default_accounts => true,
  }


  mysql::db { 'test_mdb':
  user     => 'test_user',
  password => 'password',
  host     => 'localhost',
  grant    => ['SELECT', 'UPDATE'],
  }

}
