FROM python:alpine

RUN apk update && \
    apk upgrade && \
    apk add bash && \
    apk add --no-cache --virtual build-deps build-base gcc && \
    pip install aws-sam-cli && \
    apk del build-deps

RUN mkdir /app
WORKDIR /app
EXPOSE 3001

ENTRYPOINT ["./bin/sam_entrypoint.sh"]
