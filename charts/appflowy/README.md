# appflowy

![Version: 0.1.0](https://img.shields.io/badge/Version-0.1.0-informational?style=flat-square) ![Type: application](https://img.shields.io/badge/Type-application-informational?style=flat-square) ![AppVersion: 0.0.2](https://img.shields.io/badge/AppVersion-0.0.2-informational?style=flat-square)

A Helm chart for deploying appflowy cloud on Kubernetes

## Values

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| affinity | object | `{}` |  |
| appflowy.adminFrontend.enabled | bool | `true` | whether or not to deploy the admin frontend |
| appflowy.adminFrontend.image.pullPolicy | string | `"IfNotPresent"` | image pullPolicy for the admin frontend. set to Always if using latest tag |
| appflowy.adminFrontend.image.repository | string | `"appflowyinc/admin_frontend"` | docker repository for the admin frontend |
| appflowy.adminFrontend.image.tag | string | `"v0.0.1"` | image tag to use for the admin frontend container ref: https://hub.docker.com/r/appflowyinc/admin_frontend/tags |
| appflowy.adminFrontend.ingress.annotations | object | `{}` |  |
| appflowy.adminFrontend.ingress.className | string | `"nginx"` |  |
| appflowy.adminFrontend.ingress.enabled | bool | `false` | enable ingress, access from outside the cluster, for the admin frontend |
| appflowy.adminFrontend.ingress.hosts[0].host | string | `"chart-example.local"` |  |
| appflowy.adminFrontend.ingress.hosts[0].paths[0].path | string | `"/"` |  |
| appflowy.adminFrontend.ingress.hosts[0].paths[0].pathType | string | `"ImplementationSpecific"` |  |
| appflowy.adminFrontend.ingress.tls | list | `[]` |  |
| appflowy.adminFrontend.service | object | `{"port":80,"targetPort":8000,"type":"ClusterIP"}` | service for the appflowy admin frontend |
| appflowy.environment | string | `"production"` | set environment |
| appflowy.rustLog | string | `"info"` | set the log level for rust |
| appflowy.s3.accessKeyId | string | `""` | the access key ID for your S3 endpoint |
| appflowy.s3.bucket | string | `""` | S3 bucket for appflowy to use |
| appflowy.s3.endpoint | string | `"http://minio:9000"` | your S3 endpoint |
| appflowy.s3.existingSecret | string | `""` | use an existing kubernetes secret for s3 credentials |
| appflowy.s3.region | string | `""` | region your S3 bucket is in |
| appflowy.s3.secretAccessKey | string | `""` | the secret access key for your S3 endpoint |
| appflowy.s3.secretKeys.accessKeyId | string | `"accessKeyId"` | secret key in existing k8s secret for s3 accessKeyId |
| appflowy.s3.secretKeys.bucket | string | `"bucket"` | secret key in existing k8s secret for s3 bucket |
| appflowy.s3.secretKeys.endpoint | string | `"endpoint"` | secret key in existing k8s secret for s3 endpoint |
| appflowy.s3.secretKeys.region | string | `"region"` | secret key in existing k8s secret for s3 region |
| appflowy.s3.secretKeys.secretAccessKey | string | `"secretAccessKey"` | secret key in existing k8s secret for s3 secretAccessKey |
| appflowy.s3.useMinio | bool | `false` | whether or not to use minio |
| autoscaling.enabled | bool | `false` |  |
| autoscaling.maxReplicas | int | `100` |  |
| autoscaling.minReplicas | int | `1` |  |
| autoscaling.targetCPUUtilizationPercentage | int | `80` |  |
| fullnameOverride | string | `""` |  |
| gotrue.adminEmail | string | `""` | APP__GOTRUE__ADMIN_EMAIL - set the admin email for gotrue - ignored if appflowy.gotrue.existingSecret is not empty |
| gotrue.adminPassword | string | `""` | APP__GOTRUE__ADMIN_PASSWORD - set the admin password for gotrue - ignored if appflowy.gotrue.existingSecret is not empty |
| gotrue.existingSecret | string | `""` | use an existing kubernetes secret for gotrue env vars |
| gotrue.externalUrl | string | `""` | APP__GOTRUE__EXT_URL - gotrue api external URL - ignored if appflowy.gotrue.existingSecret is not empty |
| gotrue.jwtSecret | string | `""` | APP__GOTRUE__JWT_SECRET - set the JWT secret for gotrue - ignored if appflowy.gotrue.existingSecret is not empty |
| gotrue.secretKeys.adminEmail | string | `"adminEmail"` | secret key in existing kubernetes secret for admin Email |
| gotrue.secretKeys.adminPassword | string | `"adminPassword"` | secret key in existing kubernetes secret for admin password |
| gotrue.secretKeys.externalUrl | string | `"externalUrl"` | secret key in existing kubernetes secret for external URL |
| gotrue.secretKeys.jwtSecret | string | `"jwtSecret"` | secret key in existing kubernetes secret for the jwt secret |
| image.pullPolicy | string | `"IfNotPresent"` | image pullPolicy, set to Always if using latest tag |
| image.repository | string | `"appflowyinc/appflowy_cloud"` | image repo for the appflowy cloud image |
| image.tag | string | `""` | Overrides the image tag whose default is the chart appVersion. ref: https://hub.docker.com/r/appflowyinc/appflowy_cloud/tags |
| imagePullSecrets | list | `[]` |  |
| ingress.annotations | object | `{}` |  |
| ingress.className | string | `"nginx"` |  |
| ingress.enabled | bool | `false` | enable ingress, access from outside the cluster |
| ingress.hosts[0].host | string | `"chart-example.local"` |  |
| ingress.hosts[0].paths[0].path | string | `"/"` |  |
| ingress.hosts[0].paths[0].pathType | string | `"ImplementationSpecific"` |  |
| ingress.tls | list | `[]` |  |
| nameOverride | string | `""` |  |
| nodeSelector | object | `{}` |  |
| podAnnotations | object | `{}` |  |
| podLabels | object | `{}` |  |
| podSecurityContext | object | `{}` |  |
| replicaCount | int | `1` |  |
| resources | object | `{}` |  |
| securityContext | object | `{}` |  |
| service | object | `{"port":80,"targetPort":3000,"type":"ClusterIP"}` | service for appflowy_cloudy |
| serviceAccount.annotations | object | `{}` | Annotations to add to the service account |
| serviceAccount.automount | bool | `true` | Automatically mount a ServiceAccount's API credentials? |
| serviceAccount.create | bool | `true` | Specifies whether a service account should be created |
| serviceAccount.name | string | `""` | The name of the service account to use. If not set and create is true, a name is generated using the fullname template |
| tolerations | list | `[]` |  |
| volumeMounts | list | `[]` | Additional volumeMounts on the output Deployment definition. |
| volumes | list | `[]` | Additional volumes on the output Deployment definition. |

----------------------------------------------
Autogenerated from chart metadata using [helm-docs v1.11.3](https://github.com/norwoodj/helm-docs/releases/v1.11.3)
