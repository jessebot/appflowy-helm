# Helm chart to deploy appFlowy

Supports:

- gotrue
- s3
- admin frontend deployment
- appflowy cloud deployment
- using existing secrets

## TLDR

Checkout the [`values.yaml`](./appflowy/values.yaml) and accompanying [`README`](./appflowy/README.md) with auto-generated docs for the values you'd like to use.

```bash
# add the repo to your helm repos
helm repo add appflowy https://jessebot.github.io/appflowy-helm

# install the helm chart
helm install appflowy appflowy/appflowy
```

## Status
Under development still, but happy to review pull requests and issues :)
