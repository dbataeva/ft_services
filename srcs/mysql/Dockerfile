FROM alpine:3.12
RUN apk update \
    && apk add mysql mysql-client \
	openrc \
	&& mkdir -p /run/mysqld \
	&& rm -rf /var/lib/apt/lists/*
COPY my.cnf /etc/
COPY wordpress.sql ./
COPY create_db.sql ./
COPY script.sh ./scripts/script.sh
ENTRYPOINT [ "sh", "./scripts/script.sh" ]