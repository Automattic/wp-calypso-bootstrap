class ssh_keys {
  # Copies the private deploy key of the GitHub Calypso repository on the guest system
  file { "/root/.ssh/id_rsa":
    ensure => present,
    source => "puppet:///modules/github/id_rsa",
    mode   => 0600,
    owner  => "root",
    group  => "root"
  }
}