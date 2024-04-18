## dockerhub source, alpine builder image
FROM caddy:2.7.6-builder-alpine AS builder

## add cloudflare dns module via xcaddy
RUN xcaddy build \
    --with github.com/caddy-dns/cloudflare

## dockerhub source (should be cached)
FROM caddy:2.7.6

## copy over binary
COPY --from=builder /usr/bin/caddy /usr/bin/caddy