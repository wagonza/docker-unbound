# docker-unbound
Unbound container

Configure access lists by using the environment variable UNBOUND_ACCESS_CONTROL
For example, the following will allow the following networks to query the name server:

UND_ACCESS_CONTROL="192.168.0.0/24,10.0.0.0/24"

