# appflowy

![Version: 0.1.0](https://img.shields.io/badge/Version-0.1.0-informational?style=flat-square) ![Type: application](https://img.shields.io/badge/Type-application-informational?style=flat-square) ![AppVersion: 0.0.2](https://img.shields.io/badge/AppVersion-0.0.2-informational?style=flat-square)

A Helm chart for deploying appflowy cloud on Kubernetes

## Requirements

| Repository | Name | Version |
|------------|------|---------|
| https://jessebot.github.io/gotrue-helm | gotrue | 0.5.* |
| oci://registry-1.docker.io/bitnamicharts | postgresql | 13.2.* |
| oci://registry-1.docker.io/bitnamicharts | redis | 18.4.* |

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
| appflowy.gotrue.adminPassword | string | `""` | APP__GOTRUE__ADMIN_PASSWORD - set the admin password for gotrue - ignored if appflowy.gotrue.existingSecret is not empty |
| appflowy.gotrue.existingSecret | string | `""` | use an existing kubernetes secret for gotrue env vars |
| appflowy.gotrue.secretKeys.adminPassword | string | `"adminPassword"` | secret key in existing kubernetes secret for admin password |
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
| extraVolumeMounts | list | `[]` | Additional volumeMounts on the output Deployment definition. |
| extraVolumes | list | `[]` | Additional volumes on the output Deployment definition. |
| fullnameOverride | string | `""` |  |
| gotrue.apiHost | string | `"localhost"` | GOTRUE_API_HOST - api host |
| gotrue.database.database | string | `"gotrue"` | name of the database on the databsae hostname ignored if databaseUrl or existingSecret are not empty |
| gotrue.database.databaseUrl | string | `""` | database connection url e.g. postgres://supabase_auth_admin:root@postgresql.gotrue.svc.cluster.local:5432/gotrue only required if you don't pass in driver, user, host, port, and password or sslmode/sslcert/sslrootcert/sslkey. |
| gotrue.database.driver | string | `"postgres"` | which database backend to use for gotrue ignored if databaseUrl or existingSecret are not empty |
| gotrue.database.existingSecret | string | `""` | use an existingSecret for database. must contain keys: DATABASE_URL, GOTRUE_DB_DRIVER, DB_NAMESPACE |
| gotrue.database.host | string | `"postgresql.gotrue.svc.cluster.local"` | database hostname - ignored if databaseUrl or existingSecret are not empty |
| gotrue.database.namespace | string | `"auth"` | database namespace - sets the schema name |
| gotrue.database.password | string | `""` | password to connect to database with ignored if databaseUrl or existingSecret are not empty or if sslmode is not empty |
| gotrue.database.port | string | `"5432"` | database port - ignored if databaseUrl or existingSecret are not empty |
| gotrue.database.sslCert | string | `""` | path to TLS cert for connecting to the database with TLS ignored if databaseUrl or existingSecret are not empty. |
| gotrue.database.sslKey | string | `""` | path to TLS key for connecting to the database with TLS ignored if databaseUrl or existingSecret are not empty. |
| gotrue.database.sslMode | string | `""` | mode for connecting to database with TLS e.g. verify-full ignored if databaseUrl or existingSecret are not empty. |
| gotrue.database.sslRootCert | string | `""` | path to root TLS cert for connecting to the database with TLS ignored if databaseUrl or existingSecret are not empty. |
| gotrue.database.user | string | `"supabase_auth_admin"` | database username - ignored if databaseUrl or existingSecret are not empty |
| gotrue.enabled | bool | `false` | enable the gotrue subchart which takes any values from https://github.com/jessebot/gotrue-helm this chart takes presidence over appflowy.gotrue values |
| gotrue.externalUrl | string | `"http://0.0.0.0:9999"` |  |
| gotrue.jwt.existingSecret | string | `""` | use an existing Kubernetes secret for jwt secret |
| gotrue.jwt.secret | string | `""` | set the JWT secret for gotrue - ignored if gotrue.jwt.existingSecret is not empty |
| gotrue.jwt.secretKey | string | `"jwtSecret"` | key in existing kubernetes secret for the jwt secret |
| gotrue.port | string | `"9999"` | PORT - port to use for gotrue |
| gotrue.siteUrl | string | `"http://localhost:3000"` | GOTRUE_SITE_URL - siteUrl to use for gotrue |
| gotrue.smtp.adminEmail | string | `""` | gotrue.smtp.adminEmail takes presidence over appflowy.gotrue.adminEmail |
| gotrue.smtp.existingSecret | string | `""` | use an existing kubernetes secret for SMTP credentials |
| gotrue.smtp.secretKeys.adminEmail | string | `"adminEmail"` | adminEmail secret key inside a gotrue.smtp.existingSecret |
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
| postgresql.enabled | bool | `false` |  |
| postgresql.fullnameOverride | string | `"appflowy-postgres"` |  |
| postgresql.global.postgresql.auth | object | `{"database":"appflowy","existingSecret":"","password":"changeme","postgresPassword":"changeme","secretKeys":{"adminPasswordKey":"","replicationPasswordKey":"","userPasswordKey":""},"username":null}` | global.postgresql.auth overrides postgresql.auth |
| postgresql.global.postgresql.auth.existingSecret | string | `""` | Name of existing secret to use for PostgreSQL credentials. auth.postgresPassword, auth.password, and auth.replicationPassword will be ignored and picked up from this secret. secret might also contains the key ldap-password if LDAP is enabled. ldap.bind_password will be ignored and picked from this secret in this case. |
| postgresql.global.postgresql.auth.secretKeys | object | `{"adminPasswordKey":"","replicationPasswordKey":"","userPasswordKey":""}` | Names of keys in existing secret to use for PostgreSQL credentials |
| postgresql.primary.persistence.enabled | bool | `false` |  |
| redis.enabled | bool | `false` |  |
| replicaCount | int | `1` |  |
| resources | object | `{}` |  |
| securityContext | object | `{}` |  |
| service | object | `{"port":80,"targetPort":3000,"type":"ClusterIP"}` | service for appflowy_cloudy |
| serviceAccount.annotations | object | `{}` | Annotations to add to the service account |
| serviceAccount.automount | bool | `true` | Automatically mount a ServiceAccount's API credentials? |
| serviceAccount.create | bool | `true` | Specifies whether a service account should be created |
| serviceAccount.name | string | `""` | The name of the service account to use. If not set and create is true, a name is generated using the fullname template |
| tolerations | list | `[]` |  |

----------------------------------------------
Autogenerated from chart metadata using [helm-docs v1.11.3](https://github.com/norwoodj/helm-docs/releases/v1.11.3)
