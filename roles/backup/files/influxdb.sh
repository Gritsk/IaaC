#!/bin/bash

influxd backup -database telegraf /home/backup/backup/influxdb  &> /dev/null
influxd backup -database latency /home/backup/backup/influxdb  &> /dev/null
