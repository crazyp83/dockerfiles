FROM crazyp83/baseimage-stretch:latest
LABEL maintainer="Paul Doyle <crazyp@icloud.com>"

COPY build /tmp/build/systemd-stretch
RUN run-parts --report --exit-on-error /tmp/build/systemd-stretch/scripts && rm -rfv /tmp/build
EXPOSE 22

ENTRYPOINT ["/opt/init-wrapper/sbin/entrypoint.sh"]
CMD ["/sbin/init"]

