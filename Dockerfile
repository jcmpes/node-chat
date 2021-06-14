FROM node:14.17.0-buster

# Copiamos el código fuente de la app en /code
COPY . /code/

# Nos cambiamos al directorio /code
WORKDIR /code

# Instalamos dependencias
RUN \
  apt update && \
  apt upgrade -y && \
  apt install -y python3-pip && \
  pip3 install supervisor && \
  npm i

# Exponer el puerto 3000
EXPOSE 3000

# Comando a ejecutar cuando el contenedor arranca
CMD supervisord -c supervisor.conf &