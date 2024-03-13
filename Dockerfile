FROM monius/docker-instant-ai:base

COPY entrypoint.sh /run/entrypoint.sh
ENTRYPOINT ["/run/entrypoint.sh"]

EXPOSE 80 443 9100

CMD ["nginx"]