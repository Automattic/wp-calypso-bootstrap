class github::ssh_keys {
  file { "/root/.ssh":
    ensure => directory,
    mode   => "0700",
    owner  => "root",
    group  => "root"
  }
  
  # Copies the private deploy key of the GitHub Calypso repository on the guest system
  file { "/root/.ssh/id_rsa":
    ensure  => present,
    source  => "puppet:///modules/github/id_rsa",
    mode    => "0600",
    owner   => "root",
    group   => "root",
    require => File["/root/.ssh"]
  }
}