FROM anapsix/alpine-java:jre7
ENV VERSION 3.7.28
RUN adduser -D symmetricds
ADD https://excellmedia.dl.sourceforge.net/project/symmetricds/symmetricds/symmetricds-3.7/symmetric-server-3.7.28.zip symmetric-server-3.7.28.zip
RUN unzip -q symmetric-server-3.7.28.zip -d /opt/
RUN mv /opt/symmetric-server-3.7.28 /opt/symmetric
RUN chown -R symmetricds /opt/symmetric
RUN chmod -R 777 /opt/symmetric
RUN rm symmetric-server-3.7.28.zip

VOLUME /opt/symmetric/logs
VOLUME /opt/symmetric/tmp
VOLUME /opt/symmetric/engines

USER symmetricds

ENTRYPOINT ["/opt/symmetric/bin/sym"]

EXPOSE 31415
EXPOSE 31416
