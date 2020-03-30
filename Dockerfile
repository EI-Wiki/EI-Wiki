# Dit is de docker file om de EI-Wiki in te pakken.
# Deze container runt enkel de EI-Wiki
# Om je eigen wiki met docker te runnen ga naar:
# - https://github.com/EasyWiki/EasyWiki 
# - https://hub.docker.com/repository/docker/easywiki/easywiki

FROM easywiki/easywiki:latest

WORKDIR /var/easywiki

COPY ./easywiki-config ./config