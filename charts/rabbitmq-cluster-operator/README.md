
# rabbitmq-cluster-operator

![Version: 1.0.0](https://img.shields.io/badge/Version-1.0.0-informational?style=flat-square) ![Type: application](https://img.shields.io/badge/Type-application-informational?style=flat-square) ![AppVersion: 2.22.5](https://img.shields.io/badge/AppVersion-2.22.5-informational?style=flat-square)

RabbitMQ Cluster Operator helm chart for Kubernetes

[![Artifact Hub](https://img.shields.io/endpoint?url=https://artifacthub.io/badge/repository/rabbitmq-cluster-operator)](https://artifacthub.io/packages/search?repo=rabbitmq-cluster-operator)

**Homepage:** <https://github.com/alexmorbo/helm-charts>

## Maintainers

| Name | Email | Url |
| ---- | ------ | --- |
| AlexMorbo | <alex@morbo.ru> |  |

## Source Code

* <https://github.com/alexmorbo/helm-charts/tree/master/charts/rabbitmq-cluster-operator>

## Requirements

Kubernetes: `>=1.23.0-0`

## Install
```console
helm install rabbitmq-cluster-operator oci://ghcr.io/alexmorbo/helm-charts/rabbitmq-cluster-operator
```

## Values

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| affinity | object | `{}` |  |
| crds.install | bool | `true` | Install the RabbitmqCluster CustomResourceDefinition. Rendered as a regular template rather than placed in the chart's crds/ directory: Helm installs that directory once and never upgrades it, which is why upstream asks you to run `kubectl apply --server-side` on every release. Kept on uninstall via helm.sh/resource-policy. |
| extraArgs | list | `[]` | Extra arguments for the operator binary. |
| extraEnv | list | `[]` | Extra environment variables for the operator container. |
| fullnameOverride | string | `""` |  |
| image.pullPolicy | string | `"IfNotPresent"` |  |
| image.registry | string | `"quay.io"` | Image registry. Upstream publishes the same image to quay.io and ghcr.io. |
| image.repository | string | `"rabbitmqoperator/cluster-operator"` |  |
| image.tag | string | `""` | Image tag. Defaults to the chart appVersion. |
| imagePullSecrets | list | `[]` |  |
| metrics.enabled | bool | `true` | Create the Service exposing operator metrics on port 8080. |
| monitoring.enabled | bool | `false` | Scrape the operator metrics. Requires metrics.enabled. |
| monitoring.interval | string | `"30s"` |  |
| monitoring.labels | object | `{}` |  |
| monitoring.namespace | string | `""` |  |
| monitoring.path | string | `"/metrics"` |  |
| monitoring.scrapeTimeout | string | `"10s"` |  |
| monitoring.type | string | `"ServiceMonitor"` | ServiceMonitor for prometheus-operator, VMServiceScrape for the VictoriaMetrics operator. |
| nameOverride | string | `""` |  |
| nodeSelector | object | `{}` |  |
| podAnnotations | object | `{}` |  |
| podLabels | object | `{}` |  |
| podSecurityContext.runAsNonRoot | bool | `true` |  |
| podSecurityContext.seccompProfile.type | string | `"RuntimeDefault"` |  |
| priorityClassName | string | `""` |  |
| rabbitmq.defaultImage | string | `""` | Image the operator gives to RabbitmqCluster objects that do not set spec.image. Empty leaves the operator's compiled-in default, which points at Docker Hub. |
| rabbitmq.defaultImagePullSecrets | string | `""` | Comma separated imagePullSecrets applied to RabbitmqCluster objects that do not set their own. |
| rbac.create | bool | `true` | Create ClusterRole, Role and their bindings. |
| rbac.serviceBinding | bool | `true` | Create the ClusterRole carrying the servicebinding.io/controller label. Only useful with the Service Binding specification installed. |
| replicaCount | int | `1` | Number of operator replicas. The operator elects a leader, so extra replicas only shorten failover; they do not process in parallel. |
| resources.limits.cpu | string | `"200m"` |  |
| resources.limits.memory | string | `"500Mi"` |  |
| resources.requests.cpu | string | `"200m"` |  |
| resources.requests.memory | string | `"500Mi"` |  |
| securityContext.allowPrivilegeEscalation | bool | `false` |  |
| securityContext.capabilities.drop[0] | string | `"ALL"` |  |
| securityContext.runAsNonRoot | bool | `true` |  |
| securityContext.seccompProfile.type | string | `"RuntimeDefault"` |  |
| serviceAccount.annotations | object | `{}` |  |
| serviceAccount.create | bool | `true` | Create the operator ServiceAccount. |
| serviceAccount.name | string | `""` | Name to use. Generated from the fullname template when empty. |
| terminationGracePeriodSeconds | int | `10` |  |
| tolerations | list | `[]` |  |
| topologySpreadConstraints | list | `[]` |  |
| webhook.certificate.duration | string | `""` | Certificate duration and renewal window, left to cert-manager defaults when empty. |
| webhook.certificate.enabled | bool | `true` | Issue the webhook certificate with cert-manager. Required while webhook.enabled is true; the operator has no other way to get one. |
| webhook.certificate.issuerRef | object | `{}` | Issuer to sign with. Empty creates a self-signed Issuer in the release namespace, matching upstream. |
| webhook.certificate.renewBefore | string | `""` |  |
| webhook.enabled | bool | `true` | Admission webhooks validating and defaulting RabbitmqCluster objects. Their rules are scoped to the rabbitmq.com group, so a stopped operator blocks changes to RabbitMQ objects only. |
| webhook.failurePolicy | string | `"Fail"` | failurePolicy for both webhook configurations. |
