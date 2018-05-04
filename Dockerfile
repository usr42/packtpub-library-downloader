FROM python:2-alpine
COPY downloader.py /usr/local/bin/
RUN apk add --no-cache \
        py-requests \
        py-lxml \
    && chmod +x /usr/local/bin/downloader.py \
    && addgroup -g 1000 -S downloader \
    && adduser -u 1000 -S downloader -G downloader
USER downloader
WORKDIR /home/downloader
ENTRYPOINT [ "downloader.py" ]
CMD [ "--help" ]
