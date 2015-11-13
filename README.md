Kankyo
======

Kankyo is a Japanese word meaning 'environment'.  I'm sure I've totally misused that here and I apologize but I like Japanese words so there you have it. :)

This is a basic attempt to create a docker container with a development or work environment in it.  I'm sure this particular version is of no use to anyone but myself but I thought the concept was interesting so I started something.

I work on a lot of different hosts and end up having to configure various bits of software to work efficiently - especially vim and git.  There are other ways to solve this problems but it seems to me a container would allow a complete environment plus config to be usable accross systems very easily.

I debated various methods of configuring the container but decided on simply encrypting a configuration tarball.  This allows you to simply docker run the container, enter your passwd on startup and then use it as a complete container.



