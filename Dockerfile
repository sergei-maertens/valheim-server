FROM cm2network/steamcmd:latest

WORKDIR /home/steam/valheim

RUN /home/steam/steamcmd/steamcmd.sh \
    +login anonymous \
    +force_install_dir /home/steam/valheim \
    +app_update 896660 validate \
    +exit

COPY ./start_server.sh /home/steam/valheim/start_server.sh

ENV SERVER_NAME="Bloom Room" \
    SERVER_WORLD="Dedicated" \
    SERVER_PASSWORD="change-me"

CMD ["/home/steam/valheim/start_server.sh"]
