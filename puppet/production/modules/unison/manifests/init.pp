class unison {
  exec { "download":
    command => "/usr/bin/wget --content-disposition https://www.archlinux.org/packages/extra/x86_64/unison/download/ -O /tmp/unison-2.48.3-2-x86_64.pkg.tar.xz"
  }
  
  exec { "uncompress":
    command => "/bin/tar xf /tmp/unison-2.48.3-2-x86_64.pkg.tar.xz -C /",
    require => Exec["download"]
  }
}