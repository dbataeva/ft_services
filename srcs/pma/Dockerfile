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
	php7 php7-fpm php7-mysqli php7-mbstring php7-json php7-session \
	supervisor \
	&& mkdir -p /run/nginx \
	&& wget https://files.phpmyadmin.net/phpMyAdmin/5.0.1/phpMyAdmin-5.0.1-all-languages.tar.gz \
    && tar -xzvf phpMyAdmin-5.0.1-all-languages.tar.gz \
	&& rm phpMyAdmin-5.0.1-all-languages.tar.gz \
	&& mv phpMyAdmin-5.0.1-all-languages /var/www/phpmyadmin/ \
	&& rm -rf /var/lib/apt/lists/*
COPY default  /etc/nginx/conf.d/default.conf
COPY config.inc.php /var/www/phpmyadmin
COPY supervisord.conf /etc/supervisord.conf
ENTRYPOINT [ "usr/bin/supervisord", "-c", "/etc/supervisord.conf" ]