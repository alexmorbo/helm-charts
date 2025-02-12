{{/*
Expand the name of the chart.
*/}}
{{- define "youtrack.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Create a default fully qualified app name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
If release name contains chart name it will be used as a full name.
*/}}
{{- define "youtrack.fullname" -}}
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
{{- define "youtrack.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Common labels
*/}}
{{- define "youtrack.labels" -}}
helm.sh/chart: {{ include "youtrack.chart" . }}
{{ include "youtrack.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/part-of: {{ .Chart.Name }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}

{{/*
Selector labels
*/}}
{{- define "youtrack.selectorLabels" -}}
app.kubernetes.io/name: {{ include "youtrack.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}

{{/*
Create the name of the service account to use
*/}}
{{- define "youtrack.serviceAccountName" -}}
{{- if .Values.serviceAccount.create -}}
  {{ default (include "youtrack.fullname" .) .Values.serviceAccount.name }}
{{- else -}}
  {{ default "default" .Values.serviceAccount.name }}
{{- end -}}
{{- end -}}

{{/*
Create the name of the config persistence to use
*/}}
{{- define "youtrack.configPersistenceName" -}}
{{- default (printf "%s-config" (include "youtrack.fullname" .)) .Values.persistence.config.name }}
{{- end }}

{{/*
Create the name of the data persistence to use
*/}}
{{- define "youtrack.dataPersistenceName" -}}
{{- default (printf "%s-data" (include "youtrack.fullname" .)) .Values.persistence.data.name }}
{{- end }}

{{/*
Create the name of the backups persistence to use
*/}}
{{- define "youtrack.backupsPersistenceName" -}}
{{- default (printf "%s-backups" (include "youtrack.fullname" .)) .Values.persistence.backups.name }}
{{- end }}

{{/*
Create the name of the utils persistence to use
*/}}
{{- define "youtrack.utilsPersistenceName" -}}
{{- default (printf "%s-utils" (include "youtrack.fullname" .)) .Values.persistence.utils.name }}
{{- end }}

{{/*
Create the name of the temp persistence to use
*/}}
{{- define "youtrack.tempPersistenceName" -}}
{{- default (printf "%s-temp" (include "youtrack.fullname" .)) .Values.persistence.temp.name }}
{{- end }}

{{/*
Create the name of the logs persistence to use
*/}}
{{- define "youtrack.logsPersistenceName" -}}
{{- default (printf "%s-logs" (include "youtrack.fullname" .)) .Values.persistence.logs.name }}
{{- end }}

{{/*
Create the name of the secret to use
*/}}
{{- define "youtrack.serviceName" -}}
{{- printf "%s" (include "youtrack.fullname" .) }}
{{- end }}

{{/*
Create the port to use
*/}}
{{- define "youtrack.servicePort" -}}
{{ .Values.service.port }}
{{- end }}
