FROM alpine:3.12
RUN apk update \
    && apk add openssl \
	vsftpd \
	&& openssl req -x509 -nodes -days 365 -subj "/C=RU/ST=Moscow/L=Moscow/O=21shcool/CN=localhost" -newkey rsa:2048 -keyout /etc/ssl/ftps-selfsigned.key -out /etc/ssl/ftps-selfsigned.crt \
	&& mkdir -p /etc/ftps/admin \
	&& adduser --home=/etc/ftps/admin -D admin \
	&& echo "admin:admin" | chpasswd \
	&& rm -rf /var/lib/apt/lists/*
COPY script.sh ./scripts/script.sh
COPY vsftpd.conf /etc/vsftpd/
ENTRYPOINT [ "sh", "./scripts/script.sh" ]