FROM crazyp83/baseimage:latest
LABEL maintainer="Paul Doyle <crazyp@icloud.com>"

COPY build /tmp/build/systemd
RUN run-parts --report --exit-on-error /tmp/build/systemd/scripts && rm -rfv /tmp/build
EXPOSE 22

RUN groupadd -g 1000 pi
RUN useradd -m -s /bin/bash -N -u 1000 pi && \
    echo "pi:raspberry" | chpasswd \
    echo "pi ALL=(ALL:ALL) NOPASSWD: ALL" >> /etc/sudoers && \
    chmod 0440 /etc/sudoers && \
    chmod g+w /etc/passwd && \
    usermod -g pi pi && \
    usermod -a -G sudo pi
RUN echo "root  ALL = NOPASSWD: /bin/su ALL" >> /etc/sudoers


ENTRYPOINT ["/opt/init-wrapper/sbin/entrypoint.sh"]
CMD ["/sbin/init"]

