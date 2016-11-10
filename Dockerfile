FROM anapsix/alpine-java:jre7
ENV VERSION 3.8.8
RUN adduser -D symmetricds
RUN wget https://sourceforge.net/projects/symmetricds/files/symmetricds/symmetricds-3.8/symmetric-server-3.8.8.zip/download -O symmetric-server-3.8.8.zip
RUN unzip -q symmetric-server-3.8.8.zip -d /opt/
RUN mv /opt/symmetric-server-3.8.8 /opt/symmetric
RUN chown -R symmetricds /opt/symmetric
RUN rm symmetric-server-3.8.8.zip
RUN /opt/symmetric/bin/sym_service install

VOLUME /opt/symmetric/logs
VOLUME /opt/symmetric/tmp

USER symmetricds

ENTRYPOINT ["/opt/symmetric/bin/sym"]

EXPOSE 31415
EXPOSE 31416
