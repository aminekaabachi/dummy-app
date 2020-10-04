FROM golang:latest

RUN set -e \
	&& apt-get update -y \
	&& apt-get install -y --no-install-recommends --no-install-suggests tzdata \
	&& apt-get clean \
	&& rm -rf /var/lib/apt/lists/*

RUN set -e \
	&& cp /usr/share/zoneinfo/Asia/Tokyo /etc/localtime \
	&& echo "Asia/Tokyo" > /etc/timezone

RUN set -e \
	&& mkdir -p /go/src/github.com/aminekaabachi/dummy-app

COPY main.go /go/src/github.com/aminekaabachi/dummy-app

CMD ["go", "run", "/go/src/github.com/aminekaabachi/dummy-app/main.go"]
