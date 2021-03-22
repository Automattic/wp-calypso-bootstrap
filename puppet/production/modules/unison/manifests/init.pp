class unison {
  exec { "download unison":
    command => "/usr/bin/wget --content-disposition https://archive.archlinux.org/packages/u/unison/unison-2.48.15-3-x86_64.pkg.tar.xz --directory-prefix=/tmp"
  }

  exec { "uncompress unison":
    command => "/bin/tar xf /tmp/unison-2.48.15-3-x86_64.pkg.tar.xz -C /",
    require => Exec["download unison"]
  }
}
