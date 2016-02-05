class known_hosts {
  # Makes sure the system file that contains SSH keys of known hosts is readable by all users. This basically fixes the
  # Puppet bug mentioned in http://bit.ly/1BNtqDv.
  file { "/etc/ssh/ssh_known_hosts":
    ensure => file,
    mode   => 0644
  }

  # Adds GitHub host signature in this system file to prevent manual confirmation during repository cloning. The key
  # below is generated manually based on official fingerprints available at http://bit.ly/1spcKuZ.
  sshkey { "github.com":
    ensure => "present",
    key    => "AAAAB3NzaC1yc2EAAAABIwAAAQEAq2A7hRGmdnm9tUDbO9IDSwBK6TbQa+PXYPCPy6rbTrTtw7PHkccKrpp0yVhp5HdEIcKr6pLlVDBfOLX9QUsyCOV0wzfjIJNlGEYsdlLJizHhbn2mUjvSAHQqZETYP81eFzLQNnPHt4EVVUh7VfDESU84KezmD5QlWpXLmvU31/yMf+Se8xhHTvKSCZIFImWwoG6mbUoWf9nzpIoaSjB+weqqUUmpaaasXVal72J+UX2B+2RPW3RcT0eOzQgqlJL3RKrTJvdsjE3JEAvGq3lGHSZXy28G3skua2SmVi/w4yCE6gbODqnTWlg7+wC604ydGXA8VJiS5ap43JXiUFFAaQ==",
    type   => "ssh-rsa"
  }
}