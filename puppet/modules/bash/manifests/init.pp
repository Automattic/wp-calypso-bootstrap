class bash {
  file { "/root/.bash_aliases":
    ensure => present,
    source => "puppet:///modules/bash/.bash_aliases",
    mode   => 0644,
    owner  => "root",
    group  => "root"
  }

  file { "/home/vagrant/.bash_aliases":
    ensure => present,
    source => "puppet:///modules/bash/.bash_aliases",
    mode   => 0644,
    owner  => "vagrant",
    group  => "vagrant"
  }

  file { "/home/vagrant/.screenrc":
    ensure => present,
    source => "puppet:///modules/bash/.screenrc",
    mode   => 0644,
    owner  => "vagrant",
    group  => "vagrant"
  }
}