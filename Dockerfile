FROM fedora:22
MAINTAINER Ian Main <imain@redhat.com>

# Update packages
RUN dnf -y update

# Install extra packages
ADD rpmlist.conf /rpmlist.conf
RUN dnf -y install `cat /rpmlist.conf`

ADD private_config.tar.gz.gpg /private_config.tar.gz.gpg
ADD configure.sh /configure.sh
ADD public_config.tar.gz /
RUN /configure.sh
CMD gpg --decrypt /private_config.tar.gz.gpg > /private_config.tar.gz && tar fxvz private_config.tar.gz && su - imain
