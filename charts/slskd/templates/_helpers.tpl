{{/*
Expand the name of the chart.
*/}}
{{- define "slskd.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Create a default fully qualified app name.
*/}}
{{- define "slskd.fullname" -}}
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
{{- define "slskd.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Common labels
*/}}
{{- define "slskd.labels" -}}
helm.sh/chart: {{ include "slskd.chart" . }}
{{ include "slskd.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/part-of: {{ .Chart.Name }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}

{{/*
Selector labels
*/}}
{{- define "slskd.selectorLabels" -}}
app.kubernetes.io/name: {{ include "slskd.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
app.kubernetes.io/component: slskd
{{- end }}

{{/*
Create the name of the service account to use
*/}}
{{- define "slskd.serviceAccountName" -}}
{{- if .Values.serviceAccount.create }}
{{- default (include "slskd.fullname" .) .Values.serviceAccount.name }}
{{- else }}
{{- default "default" .Values.serviceAccount.name }}
{{- end }}
{{- end }}

{{/*
Get deployment strategy with global fallback
*/}}
{{- define "slskd.strategy" -}}
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
{{- define "slskd.image" -}}
{{- $registry := .Values.image.registry | default .Values.global.imageRegistry | default "ghcr.io" -}}
{{- $repository := .Values.image.repository -}}
{{- $tag := .Values.image.tag | default .Chart.AppVersion -}}
{{- printf "%s/%s:%s" $registry $repository $tag -}}
{{- end }}

{{/*
PVC name
*/}}
{{- define "slskd.pvcName" -}}
{{- if .Values.persistence.existingClaim }}
{{- .Values.persistence.existingClaim }}
{{- else }}
{{- include "slskd.fullname" . }}
{{- end }}
{{- end }}

{{/*
Secret name
*/}}
{{- define "slskd.secretName" -}}
{{- if .Values.app.existingSecret }}
{{- .Values.app.existingSecret }}
{{- else }}
{{- include "slskd.fullname" . }}
{{- end }}
{{- end }}

{{/*
ConfigMap name
*/}}
{{- define "slskd.configMapName" -}}
{{- include "slskd.fullname" . }}-config
{{- end }}

{{/*
Soulseek listen port (safe nested access with default)
*/}}
{{- define "slskd.soulseekPort" -}}
{{- dig "soulseek" "listen_port" 50300 .Values.app.config -}}
{{- end }}
