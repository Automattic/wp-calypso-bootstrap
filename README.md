Calypso Bootstrap
=================

Calypso Bootstrap is a **portable development environment** for [Calypso](https://github.com/Automattic/wp-calypso/), the new face of [WordPress.com](http://wordpress.com). It allows you to install, configure, and start a virtual machine that is ready to run Calypso - with a single command. This sandbox makes it very easy to learn about, test, and hack Calypso without messing with the configuration of your computer. It uses some cool technologies such as [Vagrant](http://www.vagrantup.com/), [Puppet](https://puppetlabs.com/puppet/what-is-puppet), and [VirtualBox](http://virtualbox.org/) under the hood.

### Prerequisites

You need to have the following software already installed:

* [Vagrant](http://www.vagrantup.com/downloads.html)
* [VirtualBox](https://www.virtualbox.org/wiki/Downloads)

> Note you should be able to use another virtual machine provider, but currently only VirtualBox is supported.

Make sure Vagrant is available from your terminal or console with:

```
$ vagrant version

Installed Version: 1.8.1
Latest Version: 1.8.1
```

### Installing

Installing Calypso is very easy - just load a terminal or console and:

1. Clone the Calypso Bootstrap repository to your computer
2. Go to your fresh new Calypso Bootstrap directory
3. Type `vagrant up` to bring the sandbox to life

On Linux, it will probably look like this:

```
$ git clone https://github.com/Automattic/wp-calypso-bootstrap.git
$ cd wp-calypso-bootstrap
$ vagrant up
```

On Windows, it's going to be very similar:

```
C:\>git clone https://github.com/Automattic/wp-calypso-bootstrap.git
C:\>cd wp-calypso-bootstrap
C:\wp-calypso-bootstrap>vagrant up
```

Note this installation process **can take quite some time** the first time you perform a `vagrant up` since it will basically:

1. Download an image of the current stable version of Ubuntu
2. Load it into the virtual machine and update it
3. Install all necessary packages such as Git, Node.js, or NPM
4. Download the Calypso repository

Finally, just add `127.0.0.1 calypso.localhost` to your `hosts` file.

### Running

You should have a virtual machine up and running by now. The next step is simply to connect to this sandbox via SSH with your favorite terminal or console, either by typing `vagrant ssh`, or using the following parameters:

* Host name: `127.0.0.1`
* Port: `2222`
* User name: `vagrant`
* User password: `vagrant`

> These parameters should be pretty standard. However, if you encounter any issues connecting to the virtual machine, you can check them with the `vagrant ssh-config` command.
>
> Note your SSH client should be configured to allow [SSH agent forwarding](https://developer.github.com/guides/using-ssh-agent-forwarding/) if you want to be able to use your local SSH keys to connect to GitHub from inside the virtual machine (using agents such as [ssh-agent](http://en.wikipedia.org/wiki/Ssh-agent) or [Pageant](http://en.wikipedia.org/wiki/PuTTY#Components)).

You should then be presented with something similar to the following:

```
             _
    ___ __ _| |_   _ _ __  ___  ___
   / __/ _` | | | | | '_ \/ __|/ _ \
  | (_| (_| | | |_| | |_) \__ \ (_) |
   \___\__,_|_|\__, | .__/|___/\___/
               |___/|_|

   Welcome to WordPress.com goodness

vagrant@calypso:~$
```

Now simply head to the Calypso directory:

```
vagrant@calypso:~$ cd /var/sources
```

And start the application with:

```
vagrant@calypso:/var/sources$ npm start
```

This will build Calypso, which can be a lengthy process the first time it is run because that will download all dependencies. Hopefully at some point you'll see:

```
Ready! You can load http://calypso.localhost:3000/ now. Have fun!
```

You should now be able to access Calypso in your browser at http://calypso.localhost:3000!

### Hacking

The Calypso repository is located in `/var/sources` on the sandbox. **This isn't a shared folder** (i.e. a directory that is shared between the virtual machine - the guest system - and your own computer - the host system). This was done for performance reason as well as to work around a number of limitations (most of them originating from running Windows as host system).

With Calypso Bootstrap you can either work from the virtual machine itself or from your computer. In the former case, you would edit files in the `/var/sources` folder directly. In the latter, you would have to clone the Calypso repository to your computer and edit files there using your favorite editing tools. You would then have to sync this repository with the one on the sandbox in `/var/sources` using a tool such as [rsync](https://en.wikipedia.org/wiki/Rsync) or [unison](http://www.cis.upenn.edu/~bcpierce/unison/). In both cases, Calypso will pick up the changes, potentially rebuild some files, and serve them when you reload a page in your browser.

### Relaxing

You can shutdown the virtual machine with `vagrant halt` and start it again with `vagrant up`. You can also pause it with `vagrant suspend` and unpause it with `vagrant resume`.

Good job, you deserve a cup of coffee now!

### Troubleshooting

If you encounter any issues, check the Calypso [readme file](https://github.com/Automattic/wp-calypso/blob/master/README.md) and the [documentation](https://github.com/Automattic/wp-calypso/tree/master/docs). If you're still stuck, [we're here to help](https://github.com/Automattic/wp-calypso/blob/master/CONTRIBUTING.md#were-here-to-help).

### License

Calypso Bootstrap is licensed under [GNU General Public License v2 (or later)](./LICENSE.md).
