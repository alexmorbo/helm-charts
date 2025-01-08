{{/*
Expand the name of the chart.
*/}}
{{- define "esphome.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Create a default fully qualified app name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
If release name contains chart name it will be used as a full name.
*/}}
{{- define "esphome.fullname" -}}
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
{{- define "esphome.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Common labels
*/}}
{{- define "esphome.labels" -}}
helm.sh/chart: {{ include "esphome.chart" . }}
{{ include "esphome.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/part-of: {{ .Chart.Name }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}

{{/*
Selector labels
*/}}
{{- define "esphome.selectorLabels" -}}
app.kubernetes.io/name: {{ include "esphome.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}

{{/*
Create the name of the service account to use
*/}}
{{- define "esphome.serviceAccountName" -}}
{{- if .Values.serviceAccount.create -}}
  {{ default (include "esphome.fullname" .) .Values.serviceAccount.name }}
{{- else -}}
  {{ default "default" .Values.serviceAccount.name }}
{{- end -}}
{{- end -}}

{{/*
Create the name of the config persistence to use
*/}}
{{- define "esphome.configPersistenceName" -}}
{{- default (printf "%s-config" (include "esphome.fullname" .)) .Values.persistence.config.name }}
{{- end }}

{{/*
Create the name of the secret to use
*/}}
{{- define "esphome.serviceName" -}}
{{- printf "%s" (include "esphome.fullname" .) }}
{{- end }}

{{/*
Create the port to use
*/}}
{{- define "esphome.servicePort" -}}
{{ .Values.service.port }}
{{- end }}
