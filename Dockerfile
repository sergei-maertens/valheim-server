FROM cm2network/steamcmd:latest

WORKDIR /home/steam/valheim

RUN /home/steam/steamcmd/steamcmd.sh \
    +login anonymous \
    +force_install_dir /home/steam/valheim \
    +app_update 896660 validate \
    +exit

RUN mkdir /home/steam/.config && chown steam:steam -R /home/steam/.config
COPY --chown=steam:steam ./start_server.sh /home/steam/valheim/start_server.sh

ENV SERVER_NAME="Bloom Room" \
    SERVER_WORLD="Dedicated" \
    SERVER_PASSWORD="change-me"

EXPOSE 2456 2457 2458
CMD ["/home/steam/valheim/start_server.sh"]
