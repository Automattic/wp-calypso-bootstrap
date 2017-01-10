Push your changes with Rsync
=================

### Prerequisites

You need to have the following things:

* A local copy of the [wp-calypso](https://github.com/Automattic/wp-calypso) repository
* Rsync

**For Windows users only:**

1. Download and install [MinGW]((https://sourceforge.net/projects/mingw/files/latest/download))
2. Start the MinGW Installation Manager
3. Install `rsync` & `openssh` under `MSYS` section
4. Add `PATH=/c/MinGW/msys/1.0/bin:$PATH` to your `.bash_profile` file used by Git Bash
5. Reload your profile with `source ~/.bash_profile`

**Note:** The last line will replace your SSH because Vagrant's rsync won't work with SSH that comes with Git Bash. See mitchellh/vagrant#6702 for more details.

### Setup

1. Add the the following lines to your Vagrantfile:

```ruby
config.vm.synced_folder "<PATH_TO_WP_CALYPSO_COPY>", "/var/sources", type: "rsync",
    rsync__args: ["--verbose", "--archive", "-z", "--copy-links", "--inplace"],
    rsync__auto: true,
    rsync__exclude: ".git/",
    rsync__verbose: true
```

2. Reload your Vagrant machine with `vagrant reload`
3. Open another terminal in your `wp-calypso-bootstrap` folder and run `vagrant rsync-auto`
4. Go ahead and make your changes on the local copy of `wp-calypso`
