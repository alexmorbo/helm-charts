{{/*
Expand the name of the chart.
*/}}
{{- define "paperless-ngx.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Create a default fully qualified app name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
If release name contains chart name it will be used as a full name.
*/}}
{{- define "paperless-ngx.fullname" -}}
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
{{- define "paperless-ngx.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Common labels
*/}}
{{- define "paperless-ngx.labels" -}}
helm.sh/chart: {{ include "paperless-ngx.chart" . }}
{{ include "paperless-ngx.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/part-of: {{ .Chart.Name }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}

{{/*
Selector labels
*/}}
{{- define "paperless-ngx.selectorLabels" -}}
app.kubernetes.io/name: {{ include "paperless-ngx.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
app.kubernetes.io/component: server
{{- end }}

{{/*
Create the name of the service account to use
*/}}
{{- define "paperless-ngx.serviceAccountName" -}}
{{- if .Values.serviceAccount.create }}
{{- default (include "paperless-ngx.fullname" .) .Values.serviceAccount.name }}
{{- else }}
{{- default "default" .Values.serviceAccount.name }}
{{- end }}
{{- end }}

{{/*
Get image registry with global fallback
Usage: {{ include "paperless-ngx.imageRegistry" (dict "local" .Values.image.registry "global" .Values.global.imageRegistry "default" "ghcr.io") }}
*/}}
{{- define "paperless-ngx.imageRegistry" -}}
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
Usage: {{ include "paperless-ngx.strategy" (dict "local" .Values.strategy "global" .Values.global.strategy) }}
*/}}
{{- define "paperless-ngx.strategy" -}}
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
{{- define "paperless-ngx.image" -}}
{{- $registry := include "paperless-ngx.imageRegistry" (dict "local" .Values.image.registry "global" .Values.global.imageRegistry "default" "ghcr.io") -}}
{{- $repository := .Values.image.repository -}}
{{- $tag := .Values.image.tag | default .Chart.AppVersion -}}
{{- printf "%s/%s:%s" $registry $repository $tag -}}
{{- end }}

{{/*
PVC name
*/}}
{{- define "paperless-ngx.pvcName" -}}
{{- if .Values.persistence.existingClaim }}
{{- .Values.persistence.existingClaim }}
{{- else }}
{{- include "paperless-ngx.fullname" . }}
{{- end }}
{{- end }}

{{/*
kubectl image for init containers and jobs
Auto-detects cluster version if tag is empty (uses full semver from GitVersion)
*/}}
{{- define "paperless-ngx.kubectlImage" -}}
{{- $registry := include "paperless-ngx.imageRegistry" (dict "local" .Values.monitoring.kubectl.registry "global" .Values.global.imageRegistry "default" "docker.io") -}}
{{- $repository := .Values.monitoring.kubectl.repository | default "alpine/kubectl" -}}
{{- $tag := .Values.monitoring.kubectl.tag -}}
{{- if not $tag -}}
{{- $tag = trimPrefix "v" .Capabilities.KubeVersion.GitVersion -}}
{{- end -}}
{{- printf "%s/%s:%s" $registry $repository $tag -}}
{{- end }}

{{/*
Paperless exporter image
*/}}
{{- define "paperless-ngx.paperlessExporterImage" -}}
{{- $registry := include "paperless-ngx.imageRegistry" (dict "local" .Values.monitoring.paperlessExporter.image.registry "global" .Values.global.imageRegistry "default" "ghcr.io") -}}
{{- $repository := .Values.monitoring.paperlessExporter.image.repository -}}
{{- $tag := .Values.monitoring.paperlessExporter.image.tag -}}
{{- printf "%s/%s:%s" $registry $repository $tag -}}
{{- end }}

{{/*
Valkey exporter image
*/}}
{{- define "paperless-ngx.valkeyExporterImage" -}}
{{- $registry := include "paperless-ngx.imageRegistry" (dict "local" .Values.monitoring.valkeyExporter.image.registry "global" .Values.global.imageRegistry "default" "docker.io") -}}
{{- $repository := .Values.monitoring.valkeyExporter.image.repository -}}
{{- $tag := .Values.monitoring.valkeyExporter.image.tag -}}
{{- printf "%s/%s:%s" $registry $repository $tag -}}
{{- end }}
