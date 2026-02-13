{{/*
Expand the name of the chart.
*/}}
{{- define "tubearchivist.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Create a default fully qualified app name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
If release name contains chart name it will be used as a full name.
*/}}
{{- define "tubearchivist.fullname" -}}
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
{{- define "tubearchivist.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Common labels
*/}}
{{- define "tubearchivist.labels" -}}
helm.sh/chart: {{ include "tubearchivist.chart" . }}
{{ include "tubearchivist.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/part-of: {{ .Chart.Name }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}

{{/*
Selector labels
*/}}
{{- define "tubearchivist.selectorLabels" -}}
app.kubernetes.io/name: {{ include "tubearchivist.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
app.kubernetes.io/component: server
{{- end }}

{{/*
Create the name of the service account to use
*/}}
{{- define "tubearchivist.serviceAccountName" -}}
{{- if .Values.serviceAccount.create }}
{{- default (include "tubearchivist.fullname" .) .Values.serviceAccount.name }}
{{- else }}
{{- default "default" .Values.serviceAccount.name }}
{{- end }}
{{- end }}

{{/*
Get image registry with global fallback
Usage: {{ include "tubearchivist.imageRegistry" (dict "local" .Values.image.registry "global" .Values.global.imageRegistry "default" "docker.io") }}
*/}}
{{- define "tubearchivist.imageRegistry" -}}
{{- if .local }}
{{- .local }}
{{- else if .global }}
{{- .global }}
{{- else }}
{{- .default }}
{{- end }}
{{- end }}

{{/*
Create the image name
*/}}
{{- define "tubearchivist.image" -}}
{{- $registry := include "tubearchivist.imageRegistry" (dict "local" .Values.image.registry "global" .Values.global.imageRegistry "default" "docker.io") -}}
{{- $repository := .Values.image.repository -}}
{{- $tag := .Values.image.tag | default .Chart.AppVersion -}}
{{- printf "%s/%s:%s" $registry $repository $tag -}}
{{- end }}

{{/*
Get deployment strategy with global fallback
Usage: {{ include "tubearchivist.strategy" (dict "local" .Values.strategy "global" .Values.global.strategy) }}
*/}}
{{- define "tubearchivist.strategy" -}}
{{- $strategy := .global }}
{{- if .local }}
{{- if .local.type }}
{{- $strategy = .local }}
{{- end }}
{{- end }}
{{- toYaml $strategy }}
{{- end }}

{{/*
PVC media name - for storing downloaded videos
*/}}
{{- define "tubearchivist.pvcMediaName" -}}
{{- if .Values.persistence.media.existingClaim }}
{{- .Values.persistence.media.existingClaim }}
{{- else }}
{{- printf "%s-media" (include "tubearchivist.fullname" .) }}
{{- end }}
{{- end }}

{{/*
PVC cache name - for storing thumbnails and cache
*/}}
{{- define "tubearchivist.pvcCacheName" -}}
{{- if .Values.persistence.cache.existingClaim }}
{{- .Values.persistence.cache.existingClaim }}
{{- else }}
{{- printf "%s-cache" (include "tubearchivist.fullname" .) }}
{{- end }}
{{- end }}

{{/*
Valkey host - returns internal valkey service name when enabled
*/}}
{{- define "tubearchivist.valkeyHost" -}}
{{- if .Values.valkey.enabled }}
{{- printf "%s-valkey" (include "tubearchivist.fullname" .) }}
{{- end }}
{{- end }}

{{/*
Elasticsearch host - returns internal elasticsearch service name when enabled
*/}}
{{- define "tubearchivist.elasticsearchHost" -}}
{{- if .Values.elasticsearch.enabled }}
{{- printf "%s-elasticsearch" (include "tubearchivist.fullname" .) }}
{{- end }}
{{- end }}

{{/*
Merge nodeSelector: per-component -> global -> empty
Usage: {{ include "tubearchivist.nodeSelector" (dict "local" .Values.nodeSelector "global" .Values.global.nodeSelector) }}
*/}}
{{- define "tubearchivist.nodeSelector" -}}
{{- $local := .local | default dict -}}
{{- $global := .global | default dict -}}
{{- $merged := merge $local $global -}}
{{- if $merged }}
{{- toYaml $merged }}
{{- end }}
{{- end }}

{{/*
Merge tolerations: per-component + global (concatenated)
Usage: {{ include "tubearchivist.tolerations" (dict "local" .Values.tolerations "global" .Values.global.tolerations) }}
*/}}
{{- define "tubearchivist.tolerations" -}}
{{- $local := .local | default list -}}
{{- $global := .global | default list -}}
{{- $result := concat $local $global -}}
{{- if $result }}
{{- toYaml $result }}
{{- end }}
{{- end }}

{{/*
Merge affinity: per-component -> global -> empty
Usage: {{ include "tubearchivist.affinity" (dict "local" .Values.affinity "global" .Values.global.affinity) }}
*/}}
{{- define "tubearchivist.affinity" -}}
{{- $local := .local | default dict -}}
{{- $global := .global | default dict -}}
{{- $merged := merge $local $global -}}
{{- if $merged }}
{{- toYaml $merged }}
{{- end }}
{{- end }}
