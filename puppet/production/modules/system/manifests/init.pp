class system {
  include apt

  apt::source { "nodejs":
    key => {
      id => "9FD3B784BC1C6FC31A8A0A1C1655A0AB68576280",
      server => "hkp://keyserver.ubuntu.com:80"
    },
    location => "https://deb.nodesource.com/node_10.x"
  }

  exec { "update":
    command => "/usr/bin/apt-get update",
    require => Apt::Source["nodejs"]
  }


  exec { "install keyboard configuration":
    command => "/usr/bin/apt-get install --assume-yes keyboard-configuration",
    require => Exec["update"]
  }

  exec { "upgrade":
    command => "/usr/bin/apt-get upgrade --assume-yes",
    path    => ["/bin/", "/sbin/", "/usr/bin/", "/usr/sbin/"],
    require => Exec["install keyboard configuration"],
    timeout => 0
  }

  file_line { "increase file watcher system limit":
    ensure => present,
    line   => "fs.inotify.max_user_watches=16384",
    path   => "/etc/sysctl.conf"
  }

  exec { "make new file watcher system limit effective":
    command => "/sbin/sysctl -p",
    require => File_line["increase file watcher system limit"]
  }
}
