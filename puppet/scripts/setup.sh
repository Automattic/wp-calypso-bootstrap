#! /bin/bash

## Constants ##########################################################################################################

TRUE=0
FALSE=1


## Shell ##############################################################################################################

function error() {
  log error "$1"
}

function info() {
  log info "$1"
}

function log() {
  if [[ "$1" == "error" ]]; then
    echo -e "! $2"
  else
    echo -e "> $2"
  fi
}

function is_module_installed() {
  module=$1
  module_list=$2

  local results=$(echo "$module_list" | grep $module);

  if [[ -z "$results" ]]; then
    return $FALSE
  else
    return $TRUE
  fi
}



## Shell ##############################################################################################################

info "Installing Puppet"

apt-get install --assume-yes --quiet puppet

if [[ $? -eq $TRUE ]]; then
  info "Puppet installed successfully"
  
  module_list=$(puppet module list)

  is_module_installed puppetlabs-apt "$module_list"

  if [[ $? -eq $FALSE ]]; then
    info "Installing Puppet module 'puppetlabs-apt'"

    puppet module install puppetlabs-apt --version 2.4.0

    if [[ $? -eq $TRUE ]]; then
      info "Puppet module 'puppetlabs-apt' installed successfully"
    else
      error "Unable to install Puppet module 'puppetlabs-apt'"
    fi
  else
    info "Puppet module 'puppetlabs-apt' already installed"
  fi

  for module in puppetlabs-stdlib puppetlabs-vcsrepo
  do
    is_module_installed $module "$module_list"

    if [[ $? -eq $FALSE ]]; then
      info "Installing Puppet module '$module'"
      
      puppet module install $module

      if [[ $? -eq $TRUE ]]; then
        info "Puppet module '$module' installed successfully"
      else
        error "Unable to install Puppet module '$module'"
      fi
    else
      info "Puppet module '$module' already installed"
    fi
  done
else
  error "Unable to install Puppet"
fi