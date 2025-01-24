FROM crazyp83/debian-bookworm:latest
LABEL maintainer="Paul Doyle <crazyp@icloud.com>"

COPY build /tmp/build/baseimage-bookworm
RUN run-parts --report --exit-on-error /tmp/build/baseimage-bookworm/scripts && rm -rfv /tmp/build
EXPOSE 22

ENTRYPOINT ["/opt/init-wrapper/sbin/entrypoint.sh"]
CMD ["/sbin/init"]

