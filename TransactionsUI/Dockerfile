FROM nginx:alpine
COPY nginx.tpl.conf /etc/nginx/nginx.tpl.conf
COPY dist /usr/share/nginx/html
COPY entrypoint.sh /entrypoint.sh
RUN apk add --no-cache gettext && \
  chmod +x /entrypoint.sh

EXPOSE 80
CMD ["/entrypoint.sh"]


