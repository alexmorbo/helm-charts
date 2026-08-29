{{/*
Expand the name of the chart.
*/}}
{{- define "rabbitmq-messaging-topology-operator.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Create a default fully qualified app name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
If release name contains chart name it will be used as a full name.
*/}}
{{- define "rabbitmq-messaging-topology-operator.fullname" -}}
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
{{- define "rabbitmq-messaging-topology-operator.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Common labels
*/}}
{{- define "rabbitmq-messaging-topology-operator.labels" -}}
helm.sh/chart: {{ include "rabbitmq-messaging-topology-operator.chart" . }}
{{ include "rabbitmq-messaging-topology-operator.selectorLabels" . }}
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
{{- define "rabbitmq-messaging-topology-operator.selectorLabels" -}}
app.kubernetes.io/name: {{ include "rabbitmq-messaging-topology-operator.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}

{{/*
Create the name of the service account to use
*/}}
{{- define "rabbitmq-messaging-topology-operator.serviceAccountName" -}}
{{- if .Values.serviceAccount.create -}}
  {{ default (include "rabbitmq-messaging-topology-operator.fullname" .) .Values.serviceAccount.name }}
{{- else -}}
  {{ default "default" .Values.serviceAccount.name }}
{{- end -}}
{{- end -}}

{{/*
Webhook service name. Referenced from the webhook configurations and from the
certificate SANs, so it has to resolve the same way in all three places.
*/}}
{{- define "rabbitmq-messaging-topology-operator.webhookServiceName" -}}
{{- printf "%s-webhook" (include "rabbitmq-messaging-topology-operator.fullname" .) | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Name of the certificate holding the webhook serving cert.
*/}}
{{- define "rabbitmq-messaging-topology-operator.webhookCertName" -}}
{{- printf "%s-webhook-cert" (include "rabbitmq-messaging-topology-operator.fullname" .) | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Image reference.
*/}}
{{- define "rabbitmq-messaging-topology-operator.image" -}}
{{- $tag := default .Chart.AppVersion .Values.image.tag -}}
{{- printf "%s/%s:%s" .Values.image.registry .Values.image.repository $tag }}
{{- end }}

{{/*
Metrics service name.
*/}}
{{- define "rabbitmq-messaging-topology-operator.metricsServiceName" -}}
{{- printf "%s-metrics" (include "rabbitmq-messaging-topology-operator.fullname" .) | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Name of the certificate securing the metrics endpoint.
*/}}
{{- define "rabbitmq-messaging-topology-operator.metricsCertName" -}}
{{- printf "%s-metrics-cert" (include "rabbitmq-messaging-topology-operator.fullname" .) | trunc 63 | trimSuffix "-" }}
{{- end }}
