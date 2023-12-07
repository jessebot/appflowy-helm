{{/*
Expand the name of the chart.
*/}}
{{- define "appflowy.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Create a default fully qualified app name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
If release name contains chart name it will be used as a full name.
*/}}
{{- define "appflowy.fullname" -}}
{{- if .Values.fullnameOverride }}
{{- .Values.fullnameOverride | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- $name := default .Chart.Name .Values.nameOverride }}
{{- if contains $name .Release.Name }}
{{- .Release.Name | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- printf "%s-%s" .Release.Name $name | trunc 63 | trimSuffix "-" }}
{{- end }}
{{- end }}
{{- end }}

{{/*
Create chart name and version as used by the chart label.
*/}}
{{- define "appflowy.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Common labels
*/}}
{{- define "appflowy.labels" -}}
helm.sh/chart: {{ include "appflowy.chart" . }}
{{ include "appflowy.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}

{{/*
Selector labels
*/}}
{{- define "appflowy.selectorLabels" -}}
app.kubernetes.io/name: {{ include "appflowy.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}

{{/*
Create the name of the service account to use
*/}}
{{- define "appflowy.serviceAccountName" -}}
{{- if .Values.serviceAccount.create }}
{{- default (include "appflowy.fullname" .) .Values.serviceAccount.name }}
{{- else }}
{{- default "default" .Values.serviceAccount.name }}
{{- end }}
{{- end }}

{{/*
Create the name of the s3 secret to use
*/}}
{{- define "appflowy.s3.secret" -}}
{{- if .Values.appflowy.s3.existingSecret }}
{{- .Values.appflowy.s3.existingSecret }}
{{- else }}
{{- print "appflowy-s3-secret" }}
{{- end }}
{{- end }}

{{/*
Create the name of the database secret to use
*/}}
{{- define "appflowy.db.secret" -}}
{{- if and .Values.postgresql.enabled .Values.postgresql.global.postgresql.auth.existingSecret }}
{{- .Values.postgresql.global.postgresql.auth.existingSecret }}
{{- else if .Values.externalDatabase.existingSecret }}
{{- .Values.externalDatabase.existingSecret }}
{{- else }}
{{- print "appflowy-db-secret" }}
{{- end }}
{{- end }}

{{/*
Create the name of the database secret key for db hostname
*/}}
{{- define "appflowy.db.secretKey.host" -}}
{{- if .Values.externalDatabase.existingSecret }}
{{- .Values.externalDatabase.secretKeys.host }}
{{- else }}
{{- print "host" }}
{{- end }}
{{- end }}

{{/*
Create the name of the database secret key for db port
*/}}
{{- define "appflowy.db.secretKey.port" -}}
{{- if .Values.externalDatabase.existingSecret }}
{{- .Values.externalDatabase.secretKeys.port }}
{{- else }}
{{- print "port" }}
{{- end }}
{{- end }}

{{/*
Create the name of the database secret key for database name
*/}}
{{- define "appflowy.db.secretKey.database" -}}
{{- if .Values.externalDatabase.existingSecret }}
{{- .Values.externalDatabase.secretKeys.database }}
{{- else }}
{{- print "database" }}
{{- end }}
{{- end }}

{{/*
Create the name of the database secret key for db user
*/}}
{{- define "appflowy.db.secretKey.user" -}}
{{- if and .Values.postgresql.enabled }}
{{- print "user" }}
{{- else if .Values.externalDatabase.existingSecret }}
{{- .Values.externalDatabase.secretKeys.user }}
{{- else }}
{{- print "user" }}
{{- end }}
{{- end }}

{{/*
Create the name of the database secret key for db user password
*/}}
{{- define "appflowy.db.secretKey.userPassword" -}}
{{- if and .Values.postgresql.enabled .Values.postgresql.global.postgresql.auth.existingSecret }}
{{- .Values.postgresql.global.postgresql.auth.secretKeys.userPasswordKey }}
{{- else if .Values.externalDatabase.existingSecret }}
{{- .Values.externalDatabase.secretKeys.password }}
{{- else }}
{{- print "password" }}
{{- end }}
{{- end }}

{{/*
Create the name of the gotrue secret to use
*/}}
{{- define "appflowy.gotrue.secret" -}}
{{- if .Values.gotrue.enabled }}
{{- else }}
{{- if .Values.gotrue.existingSecret }}
{{- .Values.gotrue.existingSecret }}
{{- else }}
{{- print "appflowy-gotrue-secret" }}
{{- end }}
{{- end }} {{/* end if gotrue.endabled */}}
{{- end }} {{/* end define */}}
