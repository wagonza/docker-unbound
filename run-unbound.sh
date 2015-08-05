#!/usr/bin/env bash

# Check to see if we want things to be re-configured from scratch
if [ ! -z ${FORCE_REINSTALL} ]; then
	rm -f /.unbound_configured
fi


# Set initial configuration
if [ ! -f /.unbound_configured ]; then

	# Setup our cert and keys
	/usr/sbin/unbound-control-setup -d /etc/unbound/

	# Configure the config file
	# Interface
	sed -i 's/# interface: 0.0.0.0/interface: 0.0.0.0/' /etc/unbound/unbound.conf
	# Logfile - send to stdout
	sed -i 's/# logfile: ""/logfile: ""/' /etc/unbound/unbound.conf

	# access control
	if [ ! -z ${UNBOUND_ACCESS_CONTROL} ]; then
		rm -f /etc/unbound/local.d/network_acls.conf
		IFS=, read -a acls <<< "$UNBOUND_ACCESS_CONTROL"
		for net in "${acls[@]}";
		do
			echo "access-control: ${net} allow" >> /etc/unbound/local.d/network_acls.conf
		done
	fi

	touch /.unbound_configured
fi

exec /usr/sbin/unbound -d