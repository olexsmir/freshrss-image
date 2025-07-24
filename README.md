# FreshRSS image

It's my personal container image of [FreshRSS](https://github.com/FreshRSS/FreshRSS) with extensions I like.

Feel free to use `ghcr.io/olexsmir/freshrss-image:latest` image.

## Files structure
- `fetch.sh` - downloads extensions
- `build.sh` - builds the containers from `Containerfile`
- `fly.toml` - the config for fly.io so I can deploy this container.
