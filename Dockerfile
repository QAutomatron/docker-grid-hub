FROM selenium/base:2.53.0
MAINTAINER Evgenii <e.skiridov@corp.mail.ru>

#========================
# Selenium Configuration
#========================

EXPOSE 4444

ENV GRID_NEW_SESSION_WAIT_TIMEOUT -1
ENV GRID_JETTY_MAX_THREADS -1
ENV GRID_NODE_POLLING  5000
ENV GRID_CLEAN_UP_CYCLE 5000
ENV GRID_TIMEOUT 150000
ENV GRID_BROWSER_TIMEOUT 120000
ENV GRID_MAX_SESSION 300
ENV GRID_UNREGISTER_IF_STILL_DOWN_AFTER 30000

COPY generate_config /opt/selenium/generate_config
COPY entry_point.sh /opt/bin/entry_point.sh
RUN chown -R seluser /opt/selenium

USER seluser

CMD ["/opt/bin/entry_point.sh"]

