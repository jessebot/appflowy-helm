# Helm chart to deploy AppFlowy-Cloud on Kubernetes

This is a quick unofficial helm chart to deploy [AppFlowy-Cloud](https://github.com/AppFlowy-IO/AppFlowy-Cloud). It aims to support:

- S3 (and optionally including minio)
- Admin Frontend deployment
- AppFlowy cloud deployment
- using existing secrets

I'm still working on adding these feaures:

- gotrue - was recently splint into another helm chart, will add as a subchart here
- minio - vanilla community subchart
- bitnami postgresql subchart
- adding renovateBot, so it all the dependencies stay up to date
- working tests

## TLDR

Checkout the [`values.yaml`](./appflowy/values.yaml) and accompanying [`README`](./appflowy/README.md) with auto-generated docs for the values you'd like to use.

```bash
# add the repo to your helm repos
helm repo add appflowy https://jessebot.github.io/appflowy-helm

# show the values you can use
helm show values appflowy/appflowy > values.yaml

# install the helm chart
helm install appflowy appflowy/appflowy --values values.yaml
```

## Status
Under heavy development still, and not ready for production, but happy to review pull requests and issues :)
