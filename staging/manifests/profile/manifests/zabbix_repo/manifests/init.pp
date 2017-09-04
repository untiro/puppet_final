class profile::zabbix_repo::init {
   yumrepo { "zabbix":
      baseurl => "http://repo.zabbix.com/zabbix/3.4/rhel/7/x86_64/zabbix-release-3.4-1.el7.centos.noarch.rpm",
      descr => "Official Zabbix repository",
      enabled => 1,
      gpgcheck => 0
   }
}
