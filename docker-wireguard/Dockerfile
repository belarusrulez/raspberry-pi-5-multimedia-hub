FROM alpine:3

RUN apk add --no-cache \
	findutils openresolv iptables ip6tables iproute2 wireguard-tools qbittorrent-nox curl

COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]