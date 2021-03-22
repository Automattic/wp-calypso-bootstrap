stage { "bootstrap":
  before => Stage["main"]
}

class { "system":
  stage => bootstrap
}

include bash
include github
include motd
include nodejs
include system
include unison
include yarn
