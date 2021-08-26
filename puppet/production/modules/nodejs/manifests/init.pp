class nodejs {
  package { "nodejs":
    ensure => latest
  }

  exec { "install n":
    command => "/usr/bin/npm install -g n",
    require => Package["nodejs"]
  }
}
