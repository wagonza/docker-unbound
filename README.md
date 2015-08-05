Unbound container

Configure access lists by using the environment variable UNBOUND_ACCESS_CONTROL
For example, the following will allow the following networks to query the name server:

UNBOUND_ACCESS_CONTROL="192.168.0.0/24,10.0.0.0/24"

To run

docker run -d -e UNBOUND_ACCESS_CONTROL="192.168.0.0/24,10.0.0.0/24" -p 53:53/tcp -p 53:53/udp wagonza/unbound

