# Dockerfile
FROM continuumio/miniconda3:latest

ARG environment_file=environment_files/dev_environment.yml
ENV TEST_VARIABLE=development

RUN groupadd -r myuser && useradd -r -g myuser myuser

WORKDIR /app

# set environment varibles
ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1

COPY $environment_file /app/environment.yml

RUN conda config --add channels conda-forge \
    && conda env create -n myapp -f environment.yml \
    && rm -rf /opt/conda/pkgs/*

COPY guaraci guaraci

COPY . /app/
RUN chown -R myuser:myuser /app/*

ENV PATH /opt/conda/envs/myapp/bin:$PATH
RUN python manage.py collectstatic --noinput

EXPOSE 8001
COPY ./entrypoint.sh /
RUN chmod a+x /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
