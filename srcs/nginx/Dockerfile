# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: cchromos <marvin@42.fr>                    +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2021/03/23 18:30:25 by cchromos          #+#    #+#              #
#    Updated: 2021/03/23 18:30:38 by cchromos         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

FROM alpine:3.12
RUN apk update \
    && apk add nginx \
	openssl \
	&& openssl req -x509 -nodes -days 365 -subj "/C=RU/ST=Moscow/L=Moscow/O=21shcool/CN=localhost" -newkey rsa:2048 -keyout /etc/ssl/nginx-selfsigned.key -out /etc/ssl/nginx-selfsigned.crt \
	&& mkdir -p /run/nginx \
	&& rm -rf /var/lib/apt/lists/*
COPY default  /etc/nginx/conf.d/default.conf
COPY script.sh ./scripts/script.sh
ENTRYPOINT [ "sh", "./scripts/script.sh" ]
