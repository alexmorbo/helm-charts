{{/*
Expand the name of the chart.
*/}}
{{- define "dell-fan-controller.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Create a default fully qualified app name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
If release name contains chart name it will be used as a full name.
*/}}
{{- define "dell-fan-controller.fullname" -}}
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
{{- define "dell-fan-controller.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Common labels
*/}}
{{- define "dell-fan-controller.labels" -}}
helm.sh/chart: {{ include "dell-fan-controller.chart" . }}
{{ include "dell-fan-controller.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/part-of: {{ .Chart.Name }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}

{{/*
Selector labels
*/}}
{{- define "dell-fan-controller.selectorLabels" -}}
app.kubernetes.io/name: {{ include "dell-fan-controller.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
app.dell-fan-controller/host: {{ .Values.server.host }}
{{- end }}

{{/*
Create the name of the secret to use
*/}}
{{- define "dell-fan-controller.secretName" -}}
{{- printf "%s-secret" (include "dell-fan-controller.fullname" .) }}
{{- end }}