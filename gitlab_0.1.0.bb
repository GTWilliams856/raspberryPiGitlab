SUMMARY = "Gitlab functionality for the Raspberry Pi"
HOMEPAGE = "https://github.com/RPi-Distro/python-sense-hat"
SECTION = "devel/sourceControl
LICENSE = "GNU Lesser Public Licence V3"

SRCNAME = "sense-hat"

SRC_URI = "https://gitlab.com/gitlab-org/gitlab-ce/repository/archive.tar.gz?ref=master"

S = "${WORKDIR}/${SRCNAME}-${PV}"

inherit setuptools

DEPENDS += " \
    libcurl4-openssl-dev \
    openssh-server \
    ca-certificates \
    postfix \
    apt-transport-https \
    "
