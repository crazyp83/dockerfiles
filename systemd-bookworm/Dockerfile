FROM crazyp83/baseimage-bookworm:latest
LABEL maintainer="Paul Doyle <crazyp@icloud.com>"

# Create user and setup permissions on /etc/sudoers
RUN groupadd -g 1000 pi
RUN useradd -m -s /bin/bash -N -u 1000 pi && \
    echo "pi:raspberry" | chpasswd \
    echo "pi ALL=(ALL:ALL) NOPASSWD: ALL" >> /etc/sudoers && \
    chmod 0440 /etc/sudoers && \
    chmod g+w /etc/passwd && \
    usermod -g pi pi && \
    usermod -a -G sudo pi

COPY build /tmp/build/systemd-bookworm
RUN run-parts --report --exit-on-error /tmp/build/systemd-bookworm/scripts && rm -rfv /tmp/build
EXPOSE 22

ENTRYPOINT ["/opt/init-wrapper/sbin/entrypoint.sh"]
CMD ["/sbin/init"]

