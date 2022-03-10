FROM alpine:3.12
RUN apk update \
	&& apk add libc6-compat \
	openrc \
	&& wget https://dl.grafana.com/enterprise/release/grafana-enterprise-7.5.7.linux-amd64.tar.gz \
	&& tar -zxvf grafana-enterprise-7.5.7.linux-amd64.tar.gz \
	&& rm -rf grafana-enterprise-7.5.7.linux-amd64.tar.gz \
	&& mkdir -p /var/lib/grafana_dashboards/
COPY start.sh /
COPY datasources.yaml /usr/share/grafana/conf/provisioning/datasources/influxdb.yaml
COPY dashboards.yaml /usr/share/grafana/conf/provisioning/dashboards/influxdb.yaml
COPY grafana.db /grafana-7.5.7/data/grafana.db
ENTRYPOINT [ "sh", "./start.sh" ]