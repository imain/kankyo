Kankyo
======

Kankyo is a Japanese word meaning 'environment'.  I'm sure I've totally misused that here and I apologize but I like Japanese words so there you have it. :)

This is a basic attempt to create a docker container with a development or work environment in it.  I'm sure this particular version is of no use to anyone but myself but I thought the concept was interesting so I started something.

I work on a lot of different hosts and end up having to configure various bits of software to work efficiently - especially vim and git.  There are other ways to solve this problems but it seems to me a container would allow a complete environment plus config to be usable accross systems very easily.

I debated various methods of configuring the container but decided on simply encrypting a configuration tarball.  This allows you to simply docker run the container, enter your passwd on startup and then use it as a complete container.  Choose a long password as this offers better security.

Capabilities
============

The kankyo container allows you to have your work environment, including git, editor configurations, ssh keys etc in a container so that you can easily move from machine to machine with your environment.  This is especially useful when developing using minimal operating systems such as atomic or working with VMs a lot.

In addition to the configuration I've added a number of useful utilities like nc, bc, networking tools, libvirt-client (virsh), strace etc.

Development options include vim and emacs as well as curl, git, tig, tmux/tmate etc.

When using the run.sh script to start the container you gain access to a number of mounts on the host.  This includes allowing you to access the entire host in /host, and /etc and /var (for logs) are mapped directly inside the container as well.

You can also use docker and virsh from within the container to connect to the host daemons.  You can also load kernel modules.


Configuration
=============

rpmlist.conf contains a list of RPMs that you want installed in your container for use.  I have an example minimal set that I am currently using.

public_filelist.conf is a list of configuration files from your home directory that you want copied into the container.  These will be visible to anyone who can download the container.

private_filelist.conf is a list of private configuration files that will be copied into the container.  These ones are encrypted using gpg and require a passphrase to untar when you log into the container.  I currently only have my ssh keys and git config in this list.

Building
========

Once you have your configurations in place just run ./build.sh and it will tar everything up, install the RPMs required etc and build you a container.

Starting
========

The command line to run the container is a bit tricky as we're mapping in a lot of directories to allow for the use of various programs.  From inside the container you should be able to use virsh (connect to the hosts libvirt), docker (on the host), load kernel modules, access /etc.  To start the container just use:

./run.sh

