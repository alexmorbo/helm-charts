{{/*
Expand the name of the chart.
*/}}
{{- define "lidarr.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Create a default fully qualified app name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
If release name contains chart name it will be used as a full name.
*/}}
{{- define "lidarr.fullname" -}}
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
{{- define "lidarr.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Common labels
*/}}
{{- define "lidarr.labels" -}}
helm.sh/chart: {{ include "lidarr.chart" . }}
{{ include "lidarr.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/part-of: {{ .Chart.Name }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}

{{/*
Selector labels
*/}}
{{- define "lidarr.selectorLabels" -}}
app.kubernetes.io/name: {{ include "lidarr.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
app.kubernetes.io/component: server
{{- end }}

{{/*
Create the name of the service account to use
*/}}
{{- define "lidarr.serviceAccountName" -}}
{{- if .Values.serviceAccount.create }}
{{- default (include "lidarr.fullname" .) .Values.serviceAccount.name }}
{{- else }}
{{- default "default" .Values.serviceAccount.name }}
{{- end }}
{{- end }}

{{/*
Get image registry with global fallback
Usage: {{ include "lidarr.imageRegistry" (dict "local" .Values.image.registry "global" .Values.global.imageRegistry "default" "ghcr.io") }}
*/}}
{{- define "lidarr.imageRegistry" -}}
{{- if .local }}
{{- .local }}
{{- else if .global }}
{{- .global }}
{{- else }}
{{- .default }}
{{- end }}
{{- end }}

{{/*
Get deployment strategy with global fallback
Usage: {{ include "lidarr.strategy" (dict "local" .Values.strategy "global" .Values.global.strategy) }}
*/}}
{{- define "lidarr.strategy" -}}
{{- $strategy := .global }}
{{- if .local }}
{{- if .local.type }}
{{- $strategy = .local }}
{{- end }}
{{- end }}
{{- toYaml $strategy }}
{{- end }}

{{/*
Create the image name
*/}}
{{- define "lidarr.image" -}}
{{- $registry := include "lidarr.imageRegistry" (dict "local" .Values.image.registry "global" .Values.global.imageRegistry "default" "ghcr.io") -}}
{{- $repository := .Values.image.repository -}}
{{- $tag := .Values.image.tag | default .Chart.AppVersion -}}
{{- printf "%s/%s:%s" $registry $repository $tag -}}
{{- end }}

{{/*
PVC name
*/}}
{{- define "lidarr.pvcName" -}}
{{- if .Values.persistence.existingClaim }}
{{- .Values.persistence.existingClaim }}
{{- else }}
{{- include "lidarr.fullname" . }}
{{- end }}
{{- end }}

{{/*
Secret name
*/}}
{{- define "lidarr.secretName" -}}
{{- include "lidarr.fullname" . }}
{{- end }}

{{/*
Generate API key (32 chars alphanumeric)
*/}}
{{- define "lidarr.apiKey" -}}
{{- if .Values.app.auth.apiKey }}
{{- .Values.app.auth.apiKey }}
{{- else }}
{{- randAlphaNum 32 }}
{{- end }}
{{- end }}
