FROM centos
MAINTAINER yuriko
RUN     yum -y update && \
	yum -y install centos-release-scl centos-release-scl-rh && \
	yum -y install python-setuptools gcc python-devel bzip2 rh-php70-php && \
	yum clean all && easy_install pip && \
	pip install python-swiftclient python-keystoneclient

COPY	hanoi-tower-backup.php /hanoi-tower-backup.php
COPY	OpenStackAuth.sh /OpenStackAuth.sh
COPY	entrypoint.sh /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
