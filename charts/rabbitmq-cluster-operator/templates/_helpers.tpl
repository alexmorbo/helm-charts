{{/*
Expand the name of the chart.
*/}}
{{- define "rabbitmq-cluster-operator.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Create a default fully qualified app name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
If release name contains chart name it will be used as a full name.
*/}}
{{- define "rabbitmq-cluster-operator.fullname" -}}
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
{{- define "rabbitmq-cluster-operator.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Common labels
*/}}
{{- define "rabbitmq-cluster-operator.labels" -}}
helm.sh/chart: {{ include "rabbitmq-cluster-operator.chart" . }}
{{ include "rabbitmq-cluster-operator.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/part-of: rabbitmq
app.kubernetes.io/component: rabbitmq-operator
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}

{{/*
Selector labels
*/}}
{{- define "rabbitmq-cluster-operator.selectorLabels" -}}
app.kubernetes.io/name: {{ include "rabbitmq-cluster-operator.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}

{{/*
Create the name of the service account to use
*/}}
{{- define "rabbitmq-cluster-operator.serviceAccountName" -}}
{{- if .Values.serviceAccount.create -}}
  {{ default (include "rabbitmq-cluster-operator.fullname" .) .Values.serviceAccount.name }}
{{- else -}}
  {{ default "default" .Values.serviceAccount.name }}
{{- end -}}
{{- end -}}

{{/*
Webhook service name. Referenced from the webhook configurations and from the
certificate SANs, so it has to resolve the same way in all three places.
*/}}
{{- define "rabbitmq-cluster-operator.webhookServiceName" -}}
{{- printf "%s-webhook" (include "rabbitmq-cluster-operator.fullname" .) | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Name of the certificate holding the webhook serving cert.
*/}}
{{- define "rabbitmq-cluster-operator.webhookCertName" -}}
{{- printf "%s-webhook-cert" (include "rabbitmq-cluster-operator.fullname" .) | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Image reference.
*/}}
{{- define "rabbitmq-cluster-operator.image" -}}
{{- $tag := default .Chart.AppVersion .Values.image.tag -}}
{{- printf "%s/%s:%s" .Values.image.registry .Values.image.repository $tag }}
{{- end }}
