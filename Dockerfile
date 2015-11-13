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
	git-email \
        git-review

RUN adduser imain
ADD config.tar.gz.gpg /config.tar.gz.gpg
CMD gpg --decrypt /config.tar.gz.gpg > /config.tar.gz && tar fxvz config.tar.gz && su - imain
