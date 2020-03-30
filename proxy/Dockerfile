FROM nginx

RUN apt-get update && apt-get install -y curl
RUN curl -o /usr/local/bin/certbot-auto https://dl.eff.org/certbot-auto
RUN chown root /usr/local/bin/certbot-auto
RUN chmod 0755 /usr/local/bin/certbot-auto

COPY tic.sh.conf /etc/nginx/conf.d
COPY git.tic.sh.conf /etc/nginx/conf.d
COPY sta.tic.sh.conf /etc/nginx/conf.d
