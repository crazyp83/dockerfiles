FROM crazyp83/baseimage-buster:latest
LABEL maintainer="Paul Doyle <crazyp@icloud.com>"

COPY build /tmp/build/systemd-buster
RUN run-parts --report --exit-on-error /tmp/build/systemd-buster/scripts && rm -rfv /tmp/build
EXPOSE 22

ENTRYPOINT ["/opt/init-wrapper/sbin/entrypoint.sh"]
CMD ["/sbin/init"]

