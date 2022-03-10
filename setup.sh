minikube stop \
&& minikube delete \
&& minikube start --vm-driver=virtualbox --memory='3000' --disk-size 40000MB \
&& minikube addons enable metallb \
&& cd srcs \
&& kubectl apply -f metallb_config.yaml \
&& eval $(minikube docker-env) \
&& cd nginx \
&& docker build -t nginx_image . \
&& kubectl apply -f nginx.yaml \
&& cd ../wordpress \
&& docker build -t wordpress_image . \
&& kubectl apply -f wordpress.yaml \
&& cd ../pma \
&& docker build -t pma_image . \
&& kubectl apply -f pma.yaml \
&& cd ../mysql \
&& docker build -t mysql_image . \
&& kubectl apply -f mysql.yaml \
&& cd ../ftps \
&& docker build -t ftps_image . \
&& kubectl apply -f ftps.yaml \
&& cd ../grafana \
&& docker build -t grafana_image .\
&& kubectl apply -f grafana.yaml \
&& cd ../influx_db \
&& docker build -t influxdb_image .\
&& kubectl apply -f influxdb.yaml \
&& cd ../telegraf \
&& docker build -t telegraf_image .\
&& kubectl apply -f telegraf.yaml \
&& cd ../.. \
&& minikube dashboard