FROM fedora:22
MAINTAINER Ian Main <imain@redhat.com>

# Update packages
RUN dnf -y update

# Install base packages
RUN dnf -y install \
	vim \
	tmux \
	emacs \
        gnupg \
        tar \
        procps-ng \
        iputils \
        iproute \
        net-tools \
        sudo \
        gcc \
        strace \
        tcpdump \
        nc \
        wget \
        curl \
	git-email \
        git-review

ADD private_config.tar.gz.gpg /private_config.tar.gz.gpg
ADD configure.sh /configure.sh
RUN /configure.sh
ADD public_config.tar.gz /
CMD gpg --decrypt /private_config.tar.gz.gpg > /private_config.tar.gz && tar fxvz private_config.tar.gz && su - imain
