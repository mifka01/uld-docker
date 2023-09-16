FROM flaresolverr/flaresolverr

LABEL name="uld-docker"
USER root
RUN mkdir -p /downloads
VOLUME /downloads
WORKDIR /app


RUN apt update && \
 apt install -y git tor jq wget gzip && \
 apt install -y chromium xvfb libnss3 libatk1.0-0 libatk-bridge2.0-0 libcups2 libxkbcommon-x11-0 libxcomposite-dev libxdamage1 libxrandr2 libgbm-dev libpangocairo-1.0-0 libasound2

RUN git clone https://github.com/filo891/ulozto-downloader.git && \
 cd /app/ulozto-downloader && \
 git checkout remotes/origin/cfsolver-support && \
 sed -i 's/\[auto-captcha\]//g' requirements.txt && \
 pip3 install -r requirements.txt

COPY ./run.sh /app
RUN chmod 755 /app/run.sh
ENTRYPOINT [ "/app/run.sh" ]
