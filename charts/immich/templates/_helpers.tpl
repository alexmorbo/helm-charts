{{/*
Expand the name of the chart.
*/}}
{{- define "immich.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Create a default fully qualified app name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
If release name contains chart name it will be used as a full name.
*/}}
{{- define "immich.fullname" -}}
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
{{- define "immich.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Common labels
*/}}
{{- define "immich.labels" -}}
helm.sh/chart: {{ include "immich.chart" . }}
{{ include "immich.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/part-of: {{ .Chart.Name }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}

{{/*
Selector labels
*/}}
{{- define "immich.selectorLabels" -}}
app.kubernetes.io/name: {{ include "immich.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
app.kubernetes.io/component: server
{{- end }}

{{/*
Create the name of the service account to use
*/}}
{{- define "immich.serviceAccountName" -}}
{{- if .Values.serviceAccount.create }}
{{- default (include "immich.fullname" .) .Values.serviceAccount.name }}
{{- else }}
{{- default "default" .Values.serviceAccount.name }}
{{- end }}
{{- end }}

{{/*
Get image registry with global fallback
Usage: {{ include "immich.imageRegistry" (dict "local" .Values.image.registry "global" .Values.global.imageRegistry "default" "ghcr.io") }}
*/}}
{{- define "immich.imageRegistry" -}}
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
Usage: {{ include "immich.strategy" (dict "local" .Values.strategy "global" .Values.global.strategy) }}
*/}}
{{- define "immich.strategy" -}}
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
{{- define "immich.image" -}}
{{- $registry := include "immich.imageRegistry" (dict "local" .Values.image.registry "global" .Values.global.imageRegistry "default" "ghcr.io") -}}
{{- $repository := .Values.image.repository -}}
{{- $tag := .Values.image.tag | default .Chart.AppVersion -}}
{{- printf "%s/%s:%s" $registry $repository $tag -}}
{{- end }}

{{/*
Machine learning image name
Tag is kept separate from the server image so CPU and OpenVINO/CUDA variants
(e.g. v3.1.0 vs v3.1.0-openvino) can be switched with a single value.
*/}}
{{- define "immich.machineLearningImage" -}}
{{- $registry := include "immich.imageRegistry" (dict "local" .Values.machineLearning.image.registry "global" .Values.global.imageRegistry "default" "ghcr.io") -}}
{{- $repository := .Values.machineLearning.image.repository -}}
{{- $tag := .Values.machineLearning.image.tag | default .Chart.AppVersion -}}
{{- printf "%s/%s:%s" $registry $repository $tag -}}
{{- end }}

{{/*
Machine learning fullname
*/}}
{{- define "immich.machineLearningFullname" -}}
{{- printf "%s-machine-learning" (include "immich.fullname" .) | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Library PVC name.
The library holds the photo archive and is never created nor deleted by this
chart - it is owned by the platform (Terraform, CSI, ...) and must be passed in
via persistence.library.existingClaim.
*/}}
{{- define "immich.libraryClaimName" -}}
{{- required "immich: persistence.library.existingClaim is required - the library PVC holds the photo archive and is not managed by this chart. Create it beforehand (e.g. with Terraform) and pass its name, or disable persistence.library." .Values.persistence.library.existingClaim }}
{{- end }}

{{/*
Machine learning model cache PVC name
*/}}
{{- define "immich.cacheClaimName" -}}
{{- if .Values.persistence.cache.existingClaim }}
{{- .Values.persistence.cache.existingClaim }}
{{- else }}
{{- printf "%s-cache" (include "immich.machineLearningFullname" .) | trunc 63 | trimSuffix "-" }}
{{- end }}
{{- end }}

{{/*
Fullname of the bundled valkey subchart release, mirroring valkey.fullname
*/}}
{{- define "immich.valkeyFullname" -}}
{{- $valkey := default dict .Values.valkey }}
{{- if $valkey.fullnameOverride }}
{{- $valkey.fullnameOverride | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- $name := default "valkey" $valkey.nameOverride }}
{{- if contains $name .Release.Name }}
{{- .Release.Name | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- printf "%s-%s" .Release.Name $name | trunc 63 | trimSuffix "-" }}
{{- end }}
{{- end }}
{{- end }}

{{/*
Name of the secret holding the database credentials.
Either an externally managed secret or the one created by this chart.
*/}}
{{- define "immich.databaseSecretName" -}}
{{- if .Values.app.database.existingSecret }}
{{- .Values.app.database.existingSecret }}
{{- else }}
{{- include "immich.fullname" . }}
{{- end }}
{{- end }}
