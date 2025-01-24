FROM crazy83/baseimage-bookworm:latest
LABEL maintainer="Paul Doyle <crazyp@icloud.com>"

COPY build /tmp/build/ruby-bookworm
RUN run-parts --report --exit-on-error /tmp/build/ruby-bookworm/scripts && rm -rfv /tmp/build
Expose 22

ENTRYPOINT ["/opt/init-wrapper/sbin/entrypoint.sh"]
CMD ["/sbin/init"]

