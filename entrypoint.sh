#!/bin/sh
# Заменяем переменные в конфиге
envsubst < /etc/coturn/turnserver.conf.template > /etc/coturn/turnserver.conf

# Запускаем основной процесс
exec "$@"
