ARG tgtplatform=linux/arm64
FROM --platform=${tgtplatform} alpine:latest
ARG host_name=avahi
RUN apk update
RUN apk add avahi avahi-tools
RUN rm -fr /etc/avahi/services/*
RUN sed -i 's/#host-name=foo/host-name=${host_name}/g' /etc/avahi/avahi-daemon.conf
RUN sed -i 's/#enable-dbus=yes/enable-dbus=no/g' /etc/avahi/avahi-daemon.conf
EXPOSE 5353/udp
CMD /usr/sbin/avahi-daemon
