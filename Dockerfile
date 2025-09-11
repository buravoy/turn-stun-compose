FROM coturn/coturn:4.6.2

# Копируем конфигурационный файл
COPY turnserver.conf /etc/coturn/turnserver.conf

# Открываем порты для TURN/STUN
EXPOSE 3478 3478/udp
EXPOSE 5349 5349/udp
EXPOSE 49152-65535/udp

# Запускаем Coturn
CMD ["turnserver"]
