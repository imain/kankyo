#!/bin/bash

# This run line is a bit complex but it really is best as it lets you interact with the host in a meaningful way.
sudo docker run --name kankyo --privileged --net=host --rm=true -v /run:/run -v /:/host -v /opt:/opt -v /usr/bin/atomic:/usr/bin/atomic -v /bin/docker:/bin/docker -v /sys:/sys -v /lib/modules:/lib/modules:ro -v /var/lib/libvirt:/var/lib/libvirt -v /var/log:/var/log -v /dev/null:/var/run/dbus/system_bus_socket -ti imain/kankyo:v1

# - /run so you can interact with system processes.
# - /usr/bin/atomic so you can use system atomic.
# - /bin/docker so you can use system docker.
# - /sys iirc for docker and libvirt.
# - /etc we don't really use anything in there locally so it's fine.
# - /opt if something is on the system this might be nice.
# - /lib/modules in case you want to load kernel modules.
# - /var logs, images, config data etc.
