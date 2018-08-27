FROM python:3.6

# Set environment variables
ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1

WORKDIR /app

# Install env dependencies
RUN apt-get update \
    && apt-get install -y \
    && apt-get install -y --no-install-recommends \
    gdal-bin libgdal-dev libproj-dev \
    postgresql-9.6-postgis
RUN export CPLUS_INCLUDE_PATH=/usr/include/gdal
RUN export C_INCLUDE_PATH=/usr/include/gdal

RUN pip install --upgrade pip
RUN pip install pipenv

# Install app dependencies
COPY ./requirements/Pipfile /app/Pipfile
RUN pipenv install --deploy --system --skip-lock --dev

# Set django app env vars
ENV DJANGO_ENV=dev
ENV DOCKER_CONTAINER=1
ENV SECRET_KEY="%5n7d+d+)j09i-xbs@cxd9e#z=*gxsbiqxq%r7(j@xm&dicgm="

ENV POSTGRES_HOST="db"
ENV POSTGRES_NAME="postgres"
ENV POSTGRES_USER="mompgdb"
ENV POSTGRES_PASSWORD="cSbza5QGyZiEDgzAttyY5GN9VsrkWarSUIriuqwkiF4JD9IXO1AmRu2fHJKJKAJ"
ENV POSTGRES_PORT=5432

EXPOSE 8000

# Copy project
COPY . /app/
