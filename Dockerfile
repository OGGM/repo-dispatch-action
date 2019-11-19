FROM alpine:3
RUN apk add --no-cache --update bash curl ca-certificates
COPY repo_dispatch.sh /repo_dispatch.sh
ENTRYPOINT ["/repo_dispatch.sh"]
