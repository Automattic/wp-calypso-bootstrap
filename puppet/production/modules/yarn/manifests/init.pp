class yarn {
  package { "yarn":
    ensure => latest
  }

  file { "/home/vagrant/.npmrc":
    ensure => present,
    source => "puppet:///modules/yarn/.npmrc",
    mode   => "0644",
    owner  => "vagrant",
    group  => "vagrant"
  }

  file_line { "increase Node memory limit":
    ensure => present,
    line   => "NODE_OPTIONS=--max-old-space-size=3000",
    path   => "/etc/environment"
  }
}
