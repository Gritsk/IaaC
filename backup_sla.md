# service level agreement (SLA)

##backup is set up for:

- Web services - **Nginx**
- App services - **Agama**
- Database services - **MySQL, InfluxDB**
- DNS service - **Bind9**
- Monitoring services - **Prometheus, Grafana, Telegraf, Pinger, Bind9 exporter, MySQL exporter, Nginx exporters, Node exporters, Rsyslog, HAProxy exporter, keepalived exporter**
- Backup services - **Scripts, Duplicity**
- container - **Docker**
- Load balancing services - **HAProxy, keepalived**
- Additional services - **Ansible, uWSGI, Cron**


## Times to recovery backup


- **MySQL** - **4 weeks/28 days**. bakcups ar eretained for 8 weeks
- **InfluxDB** - **4 weeks/28 days**.  bakcups ar eretained for 8 weeks
- **Prometheus** - **4 weeks/28 days**.  bakcups ar eretained for 8 weeks
- **Grafana** - **1 week/7 days**.
- **Agama**  bakcups ar eretained for 2 weeks
