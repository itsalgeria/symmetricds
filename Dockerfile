FROM anapsix/alpine-java:jre7
ENV VERSION 3.9.13
RUN adduser -D symmetricds
RUN wget https://vorboss.dl.sourceforge.net/project/symmetricds/symmetricds/symmetricds-3.9/symmetric-server-3.9.13.zip
RUN unzip -q symmetric-server-3.9.13.zip -d /opt/
RUN mv /opt/symmetric-server-3.9.13 /opt/symmetric
RUN chown -R symmetricds /opt/symmetric
RUN chmod -R 777 /opt/symmetric
RUN rm symmetric-server-3.9.13.zip

VOLUME /opt/symmetric/logs
VOLUME /opt/symmetric/tmp
VOLUME /opt/symmetric/engines

USER symmetricds

ENTRYPOINT ["/opt/symmetric/bin/sym"]

EXPOSE 31415
EXPOSE 31416
