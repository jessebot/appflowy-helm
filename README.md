# Helm chart to deploy AppFlowy-Cloud on Kubernetes

This is a quick unofficial helm chart to deploy [AppFlowy-Cloud](https://github.com/AppFlowy-IO/AppFlowy-Cloud). It aims to support:

- S3 (and optionally including minio)
- Admin Frontend deployment
- AppFlowy cloud deployment
- using existing secrets (optional)
- gotrue subchart (optional)
- bitnami postgresql subchart (optional)
- bitnami redis subchart (optional)

I'm still working on adding these feaures:

- minio - vanilla community subchart
- adding renovateBot, so it all the dependencies stay up to date
- working tests

# Installation

### required values


```yaml
appflowy:
  gotrue:
    adminPassword: ""

# if you provide your own gotrue deployment you only need the following
# if not, please see the gotrue section below for more info
gotrue:
  externalUrl: ""
  smtp:
    adminEmail: ""
  jwt:
    secret: ""
```

## basic installation

Checkout the [`values.yaml`](./appflowy/values.yaml) and accompanying [`README`](./appflowy/README.md) with auto-generated docs for the values you'd like to use.

```bash
# add the repo to your helm repos
helm repo add appflowy https://jessebot.github.io/appflowy-helm

# show the values you can use
helm show values appflowy/appflowy > values.yaml

# install the helm chart
helm install appflowy appflowy/appflowy --values values.yaml
```

## database

We're still working on this, but to start, we've included the bitnami postgresql sub chart. To enable:

```yaml
postgresql:
  enabled: true
```

Checkout the [Bitnami postgresql chart](https://github.com/bitnami/charts/tree/main/bitnami/postgresql) for more values you can pass in.

## gotrue

AppFlowy-Cloud requires [supabase/gotrue](https://github.com/supabase/gotrue) for authentication, which we provide as an optional subchart that you can enable with:

```yaml
gotrue:
  enabled: true
```

See [jessebot/gotrue-helm:charts/gotrue/README.md](https://github.com/jessebot/gotrue-helm/blob/main/charts/gotrue/README.md) for all available values.

# Status
Under heavy development still, and not ready for production, but happy to review pull requests and issues :)
