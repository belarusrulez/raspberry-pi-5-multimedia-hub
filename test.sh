curl --interface wg0 -s https://ipinfo.io/country
curl -s https://ipinfo.io/country

iptables -L -v -n
tcpdump -ni wg0 port 8080
