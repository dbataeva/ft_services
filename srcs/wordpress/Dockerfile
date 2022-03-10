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
	openrc \
	php7 php7-mbstring php7-json php7-session \
	php7-fpm php7-mysqli \
	supervisor \
	&& mkdir -p /run/nginx \
	&& wget https://wordpress.org/latest.tar.gz \
    && tar -xvf latest.tar.gz && rm latest.tar.gz \
	&& mv wordpress /var/www \
	&& rm -rf latest.tar.gz \
	&& rm -rf /var/lib/apt/lists/*
COPY default  /etc/nginx/conf.d/default.conf
COPY wp-config.php /var/www/wordpress
COPY supervisord.conf /etc/supervisord.conf
ENTRYPOINT [ "usr/bin/supervisord", "-c", "/etc/supervisord.conf" ]