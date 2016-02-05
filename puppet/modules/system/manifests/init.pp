class system {
  include apt
  
  apt::source { "nodejs":
    key => {
      "id" => "9FD3B784BC1C6FC31A8A0A1C1655A0AB68576280",
      "server" => "keyserver.ubuntu.com",
    },
    location => "https://deb.nodesource.com/node_4.x",
    release => "precise",
    repos => "main"
  }
  
  exec { "update":
    command => "/usr/bin/apt-get update",
    require => Apt::Source["nodejs"]
  }

  exec { "upgrade":
    command => "/usr/bin/apt-get upgrade --assume-yes",
    path    => ["/bin/", "/sbin/", "/usr/bin/", "/usr/sbin/"],
    require => Exec["update"]
  }
}