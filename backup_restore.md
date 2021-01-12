Last time modified:  11th Jan 2021

In order to recover Infra use ansible playbook 

## Agama
To restore Agama run command below on your local machine (the management host/system) 

```bash
ansible-playbook ansible-playbook lab04_web_app.yaml
```

To restore  AGAMA  on docker run:

```bash
ansible-playbook ansible-playbook lab12_docker.yaml
```

## MySQL

To restore MYsql run:

```bash
ansible-playbook ansible-playbook lab04_web_app.yaml
ansible-playbook ansible-playbook lab07_grafana.yaml
ansible-playbook ansible-playbook lab10_backups.yaml
```

To restore data on database on the host with MySQL installed run the following commands:

```bash
duplicity --no-encryption --force restore rsync://<backup_user>@<our_domain>//home/<backup_user> /home/backup/restore/
mysql agama < /home/backup/restore/agama.sql

# To check the results run:
mysql -e 'SELECT * FROM agama.item'
```

## uWSGI 

To restore UWSGU run:

```bash
ansible-playbook ansible-playbook lab04_web_app.yaml
```

##  DNS

To restore DNS run:

```bash
ansible-playbook ansible-playbook lab05_dns.yaml
```

### Hosts' DNS resolvers configuration

To restore resolvers config run:

```bash
ansible-playbook ansible-playbook lab05_dns.yaml
```

## Duplicity - backup facility

To restore Duplicity run:

```bash
ansible-playbook ansible-playbook lab10_backups.yaml
```
## Nginx - web server

To restore nginx run:

```bash
ansible-playbook ansible-playbook lab02_web_server.yaml
```

## Docker

To restore Docker run:

```bash
ansible-playbook ansible-playbook lab12_docker.yaml
```

## InfluxDB - metrics/logs database

To restore influxdb run:

```bash
ansible-playbook ansible-playbook lab08_logging.yaml
```

To restore InfluxDB databases and their data, start with user "ubuntu" run the following commands on the host with InfluxDB installed (sudo privileges are required to stop/start InlfuxDB and transfer the files to the final destination with `rsync`).

```bash
duplicity --no-encryption --force restore rsync://<backup_user>@<our_domain>//home/<backup_user> /home/backup/restore/
sudo systemctl stop influxdb
influxd restore -metadir /var/lib/influxdb/meta /home/backup/restore/influxdb
influxd restore -datadir /var/lib/influxdb/data /home/backup/restore/influxdb
sudo systemctl start influxdb

# To check the results run the next command to show databases
influx -execute 'show databases'
```

## Grafana - 

To restore Grafana run :

```bash
ansible-playbook ansible-playbook lab07_grafana.yaml
```

To restore grafana on docker run:

```bash
ansible-playbook ansible-playbook lab12_docker.yaml
```

To restore Grafana's configuration, start with user "ubuntu" run the following commands on the host with Grafana installed (sudo privileges are required to stop/start Grafana and transfer the files to the final destination with `rsync`).

```bash
duplicity --no-encryption --force restore rsync://<backup_user>@<our_domain>//home/<backup_user> /home/backup/restore/
sudo systemctl stop grafana-server
rsync -a --delete /home/backup/backup/grafana.etc/ /etc/grafana/
rsync -a --delete home/backup/backup/grafana.lib/ /var/lib/grafana/
sudo systemctl start grafana-server
```

Run the following commands if the configuration should be restored for the Grafana Docker container, start with user "ubuntu"(sudo privileges are required to change file permissions and transfer the files to the final destination with `rsync`):

```bash
duplicity --no-encryption --force restore rsync://<backup_user>@<our_domain>//home/<backup_user> /home/backup/restore/
docker stop grafana
rsync -a --delete /home/backup/backup/grafana.docker.etc/grafana-etc/ /opt/docker/grafana-etc/
rsync -a --delete home/backup/backup/grafana.docker.lib/grafana/ /opt/docker/grafana/
chown -R 472:472 /opt/docker/grafana-etc
chown -R 472:472 /opt/docker/grafana
docker start grafana
```

## Pinger - connectivity/latency checker

To restore Pinger run:

```bash
ansible-playbook ansible-playbook lab08_logging.yaml
```

## Prometheus - metrics collector

To restore Prometheus run :

```bash
ansible-playbook ansible-playbook lab06_prometheus.yaml
```

To restore Prometheus databases and their data, start with user "ubuntu", run the following commands on the host with Prometheus installed (sudo privileges are required to stop/start Prometheus and transfer the files to the final destination with `rsync`).

```bash
duplicity --no-encryption --force restore rsync://<backup_user>@<our_domain>//home/<backup_user> /home/backup/restore/
sudo systemctl stop prometheus
rsync -a --delete /home/backup/backup/prometheus/ /var/lib/prometheus/
sudo systemctl start prometheus
```

## Bind9 exporter

To restore Bind9 exporter run:

```bash
ansible-playbook ansible-playbook lab07_grafana.yaml
```

## MySQL exporter

To restore MySQL exporter run:

```bash
ansible-playbook ansible-playbook lab07_grafana.yaml
```

## Nginx exporters

To restore Nginx exporters run:

```bash
ansible-playbook ansible-playbook lab07_grafana.yaml
```

## Node exporters

To restore Node exporters run:

```bash
ansible-playbook ansible-playbook lab06_prometheus.yaml
```

## HAProxy exporters

To restore HAProxy exporters run:

```bash
ansible-playbook ansible-playbook lab13_haproxy.yaml
```

## keepalived exporters

To restore keepalived exporters run:

```bash
ansible-playbook ansible-playbook lab13_haproxy.yaml
```

## Rsyslog 

To restore Rsyslog run:

```bash
ansible-playbook ansible-playbook lab08_logging.yaml
```

## Telegraf - metrics collector

To restore Telegraf run :

```bash
ansible-playbook ansible-playbook lab08_logging.yaml
```



## HAProxy - TCP/HTTP load balancer

To restore **HAProxy** run the following commands in the Ansible directory containing playbooks on the management host/system (or the system where playbooks were restored):

```bash
ansible-playbook ansible-playbook lab13_haproxy.yaml
```

## keepalived - Layer 4 load balancer

To restore keepalived run:

```bash
ansible-playbook ansible-playbook lab13_haproxy.yaml
```

