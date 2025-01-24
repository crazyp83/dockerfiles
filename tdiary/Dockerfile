FROM crazyp83/ruby:latest
LABEL maintainer="Paul Doyle <crazyp@icloud.com>"

COPY build /tmp/build/tdiary
RUN run-parts --report --exit-on-error /tmp/build/tdiary/scripts && rm -rfv /tmp/build
EXPOSE 22 80 9001

ENTRYPOINT ["/opt/init-wrapper/sbin/entrypoint.sh"]
CMD ["/sbin/init"]

