FROM crazyp83/baseimage-buster:latest
LABEL maintainer="Paul Doyle <crazyp@icloud.com>"

COPY build /tmp/build/ruby-buster
RUN run-parts --report --exit-on-error /tmp/build/ruby-buster/scripts && rm -rfv /tmp/build
Expose 22

ENTRYPOINT ["/opt/init-wrapper/sbin/entrypoint.sh"]
CMD ["/sbin/init"]

