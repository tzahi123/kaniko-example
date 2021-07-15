FROM 10.232.52.103:5000/artifactory/docker/external/airflow:2.0.2

USER root

RUN mkdir -p /opt/airflow/dags
RUN mkdir -p /opt/airflow/logs
RUN umask 002

RUN chmod 777 -R /opt/airflow

USER airflow

