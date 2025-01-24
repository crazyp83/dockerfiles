FROM crazyp83/baseimage:latest
LABEL maintainer="Paul Doyle <crazyp@icloud.com>"

COPY build /tmp/build/squid
RUN run-parts --report --exit-on-error /tmp/build/squid/scripts && rm -rfv /tmp/build
EXPOSE 22 3128

ENTRYPOINT ["/opt/init-wrapper/sbin/entrypoint.sh"]
CMD ["/sbin/init"]

