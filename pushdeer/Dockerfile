FROM webdevops/php-apache:8.0

RUN git clone https://github.com/easychen/pushdeer && \
    cd pushdeer/docker/web/ && \
    mkdir -p /data && \
    cp vhost.conf /opt/docker/etc/httpd/vhost.conf && \
    cp init.sh /opt/docker/provision/entrypoint.d/ && \
    chmod +x /opt/docker/provision/entrypoint.d/init.sh && \
    echo "session.save_handler = redis\n" >> /opt/docker/etc/php/php.webdevops.ini && \
    echo "session.save_path = 'tcp://redis:6379'\n" >> /opt/docker/etc/php/php.webdevops.ini && \
    echo "session.gc_maxlifetime = '259200'\n" >> /opt/docker/etc/php/php.webdevops.ini && \
    cp gorush /data/gorush && \
    chmod +x /data/gorush && \
    cp supervisord-ios.conf /opt/docker/etc/supervisor.d/push-ios.conf && \
    cp supervisord-clip.conf /opt/docker/etc/supervisor.d/push-clip.conf && \
    cp larave-cron /etc/cron.d && \
    chmod +x /etc/cron.d/larave-cron && \
    rm -rf /pushdeer

EXPOSE 80