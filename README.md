# docker_mtc
Docker files and notes from mtc docker course

<pre>
Node Red is a visual tool used to design IOT flows and other data flows,
we will use it to pull data from python container and send it out to rest of containers,
to automate it we will use a file called "flows.json" and others stored in volume "/data"
Node Red(port 1880) will send a get request to dev1(port 5000) container "GET http://dev1:5000",
which will respond with JSON data,
and that will be sent to Influxdb(port 8086, mounted volume "var/lib/influxdb2"), 
which will be configured with environemnt variables,
we then configure Grafana(port 3000) to read that data and display it,
Influxdb which is also a non relational time series database also has graphing utilities,
but Grafana is more popular for graphing,
withing Grafana we will preprovision our dashboards(dashboards.yml) and data sources(datasources.yml) such as Influxdb,
and also automatically deploy without any additional configuration, using volume "/var/lib/grafana",
Once we run Docker compose up, data will be flowing, stored and displayed. 
We will also deploy Postgres(post 5432), and preprovision that automatically using "schema.sql" and attached volume "/var/lib/postgresql/data"
We will use PostgREST which will infur the schema of the Postgres database and automatically create REST endpoints(POST http://postgrest:3000/temperature_data) for every table on database.
The data will go into Postgres and Grafana will be able to read that data as well and we will have two matching charts,
of all the data that is streaming from dev1 random generator. 

dev1      192.168.128.2:5000
Node-Red  192.168.128.6:1880
Influxdb  192.168.128.3:8086
PostgREST 192.168.128.4:3000
          192.168.160.3:3000
Postgres  192.168.160.2:5432
Grafana   192.168.128.5:3000
          192.168.160.4:3000
          192.168.144.2:3000
          host: 3000

Network CIDRs to reduce attack surface-
Frontend: 192.168.122.0/24
Backend:  192.168.128.0/20
Postgres: 192.168.120.0/24
Host:     172.31.53.0/20

</pre>
