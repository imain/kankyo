Kankyo
======

Kankyo is a Japanese word meaning 'environment'.  This is a customizable container with a work and development environment in it that can be tailored to your needs.

I work on a lot of different hosts and end up having to configure various bits of software to work efficiently - especially vim and git.  There are other ways to solve this problem but it seems to me a container would allow a complete environment plus config to be usable across systems very easily.

I debated various methods of configuring the container but decided on encrypting a configuration tarball.  This allows you to simply docker run the container, enter your passwd on startup and then use it as a complete container.  Choose a long password as this offers better security.

Capabilities
============

The kankyo container allows you to have your work environment, including git, editor configurations, ssh keys etc in a container so that you can easily move from machine to machine with your environment.  This is especially useful when developing using minimal operating systems such as atomic or working with VMs a lot.

In addition to the configuration I've added a number of useful utilities like nc, bc, networking tools, libvirt-client (virsh), strace etc.

Development options include vim and emacs as well as curl, git, tig, tmux/tmate etc.

When using the run.sh script to start the container you gain access to a number of mounts on the host.  This includes allowing you to access the entire host in /host, and /etc and /var (for logs) are mapped directly inside the container as well.

You can also use docker and virsh from within the container to connect to the host daemons and load kernel modules.


Configuration
=============

* rpmlist.conf - contains a list of RPMs that you want installed in your container for use.  I have an example minimal set that I am currently using.

* public_filelist.conf - a list of configuration files from your home directory that you want copied into the container.  These will be visible to anyone who can download the container.

* private_filelist.conf - a list of private configuration files that will be copied into the container.  These ones are encrypted using gpg and require a passphrase to untar when you log into the container.  I currently only have my ssh keys and git config in this list.

Building
========

Once you have your configurations in place just run ./build.sh and it will tar everything up, install the RPMs required and build you a container.

Starting
========

The command line to run the container is a bit tricky as we're mapping in a lot of directories to allow for the use of various programs as described above.  To start the container just use:

```
./run.sh [dockerhub username]
```

If the dockerhub username is not specified it will assume it's in the local registry.

If you want to run it all in one command on another machine from the hub use:

```
bash -c "`curl https://raw.githubusercontent.com/imain/kankyo/master/run.sh`" [-c <dockerhub username>]
```

