NAME=yuriko/backup2swift
CNTNAME=backup
VERSION=latest

#Volume that backups from
VOLUME=var/lib/postgresql/data var/www/html var/www/mediawiki etc/openvpn var/log/httpd24

build:
	docker build -t $(NAME):$(VERSION) .

run:
	docker run -it --rm \
	--name $(CNTNAME) \
	--net web \
	--volumes-from data \
	$(NAME):$(VERSION) \
	$(VOLUME)

contener=`docker ps -a -q`
image=`docker images | awk '/^<none>/ { print $$3 }'`

clean:
	@if [ "$(image)" != "" ] ; then \
		docker rmi $(image); \
	fi
	@if [ "$(contener)" != "" ] ; then \
		docker rm $(contener); \
	fi

