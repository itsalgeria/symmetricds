FROM anapsix/alpine-java:jre7
ENV VERSION 3.8.8
RUN adduser -D symmetricds
RUN wget https://sourceforge.net/projects/symmetricds/files/symmetricds/symmetricds-3.8/symmetric-server-$VERSION.zip/download -O symmetric-server-$VERSION.zip
RUN unzip -q symmetric-server-$VERSION.zip -d /opt/
RUN mv /opt/symmetric-server-$VERSION /opt/symmetric
RUN chown -R symmetricds /opt/symmetric
RUN rm symmetric-server-$VERSION.zip

VOLUME /opt/symmetric/logs
VOLUME /opt/symmetric/tmp

USER symmetricds

ENTRYPOINT ["/opt/symmetric/bin/sym"]

EXPOSE 31415
EXPOSE 31416
