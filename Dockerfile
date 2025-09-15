FROM coturn/coturn:4.6.2-alpine3.21
USER root
ARG TURN_EXTERNAL_IP
ARG TURN_SERVER_NAME
ARG TURN_SECRET
ARG CACHE_BUST=1
# Устанавливаем envsubst
RUN apk add gettext

# Копируем шаблон конфигурационного файла
COPY turnserver.conf /etc/coturn/turnserver.conf.template
COPY entrypoint.sh /entrypoint.sh

# Открываем порты для TURN/STUN
EXPOSE 3478 3478/udp
EXPOSE 5349 5349/udp
EXPOSE 49152-65535/udp


RUN chmod +x /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
CMD ["turnserver"]
