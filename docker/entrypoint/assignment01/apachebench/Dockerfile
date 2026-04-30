FROM ubuntu:latest

RUN apt-get update && \
    apt-get install -y apache2-utils && \
    rm -rf /var/lib/apt/lists/*

ENTRYPOINT ["ab"]
CMD ["-n", "10", "-c", "2", "https://www.bretfisher.com/"]