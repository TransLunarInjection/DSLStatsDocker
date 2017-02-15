FROM krallin/ubuntu-tini:xenial
MAINTAINER Ross Allan <docker@nallar.me>

ENV LANG=C.UTF-8 \
FIX_PERMISSIONS=true \
DISPLAY=:0 \
VNC_PASSWORD=CHANGEME

COPY root/ /
RUN chmod +x /root/*.sh && /bin/sh /root/install.sh

#Expose ports (VNC)
EXPOSE 5900 55555

VOLUME /config

ENTRYPOINT ["/usr/local/bin/tini", "-g", "-v", "--", "/root/init.sh"]
