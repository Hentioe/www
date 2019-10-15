FROM bluerain/crystal:runtime-slim


ARG APP_HOME=/home/www


RUN mkdir "$APP_HOME" && \
    ln -s "$APP_HOME/www" /usr/local/bin/www


COPY bin $APP_HOME
COPY static "$APP_HOME/static"


WORKDIR $APP_HOME


EXPOSE 8080


ENTRYPOINT www --prod
