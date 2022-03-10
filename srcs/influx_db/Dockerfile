FROM alpine:3.12
RUN apk update && apk add openrc && apk add influxdb
ENTRYPOINT [ "influxd" ]