
# rabbitmq-messaging-topology-operator

![Version: 1.0.0](https://img.shields.io/badge/Version-1.0.0-informational?style=flat-square) ![Type: application](https://img.shields.io/badge/Type-application-informational?style=flat-square) ![AppVersion: 1.20.2](https://img.shields.io/badge/AppVersion-1.20.2-informational?style=flat-square)

RabbitMQ Messaging Topology Operator helm chart for Kubernetes

[![Artifact Hub](https://img.shields.io/endpoint?url=https://artifacthub.io/badge/repository/rabbitmq-messaging-topology-operator)](https://artifacthub.io/packages/search?repo=rabbitmq-messaging-topology-operator)

**Homepage:** <https://github.com/alexmorbo/helm-charts>

## Maintainers

| Name | Email | Url |
| ---- | ------ | --- |
| AlexMorbo | <alex@morbo.ru> |  |

## Source Code

* <https://github.com/alexmorbo/helm-charts/tree/master/charts/rabbitmq-messaging-topology-operator>

## Requirements

Kubernetes: `>=1.23.0-0`

## Install
```console
helm install rabbitmq-messaging-topology-operator oci://ghcr.io/alexmorbo/helm-charts/rabbitmq-messaging-topology-operator
```

## Values

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| affinity | object | `{}` |  |
| crds.install | bool | `true` | Install the thirteen topology CustomResourceDefinitions. Rendered as regular templates rather than placed in the chart's crds/ directory: Helm installs that directory once and never upgrades it. Kept on uninstall via helm.sh/resource-policy. |
| extraArgs | list | `[]` | Extra arguments for the operator binary. |
| extraEnv | list | `[]` | Extra environment variables for the operator container. |
| fullnameOverride | string | `""` |  |
| image.pullPolicy | string | `"IfNotPresent"` |  |
| image.registry | string | `"quay.io"` | Image registry. Upstream publishes the same image to quay.io and ghcr.io. |
| image.repository | string | `"rabbitmqoperator/messaging-topology-operator"` |  |
| image.tag | string | `""` | Image tag. Defaults to the chart appVersion. |
| imagePullSecrets | list | `[]` |  |
| metrics.enabled | bool | `true` | Expose operator metrics. |
| metrics.port | int | `8443` |  |
| metrics.secure | bool | `true` | Serve metrics over HTTPS with client authentication, as upstream does. The endpoint then requires a bearer token and the scraper has to accept the certificate; see monitoring.tlsConfig below. Turning this off serves plain HTTP on the same port and drops the certificate, which makes scraping trivial at the cost of an open endpoint inside the cluster. |
| monitoring.enabled | bool | `false` | Scrape the operator metrics. Requires metrics.enabled. |
| monitoring.interval | string | `"30s"` |  |
| monitoring.labels | object | `{}` |  |
| monitoring.namespace | string | `""` |  |
| monitoring.path | string | `"/metrics"` |  |
| monitoring.scrapeTimeout | string | `"10s"` |  |
| monitoring.tlsConfig | object | `{"insecureSkipVerify":true}` | TLS settings used when metrics.secure is true. The default trusts the self-signed certificate the operator serves; point ca at the issued secret instead if you would rather verify it. |
| monitoring.type | string | `"ServiceMonitor"` | ServiceMonitor for prometheus-operator, VMServiceScrape for the VictoriaMetrics operator. |
| nameOverride | string | `""` |  |
| nodeSelector | object | `{}` |  |
| podAnnotations | object | `{}` |  |
| podLabels | object | `{}` |  |
| podSecurityContext.runAsNonRoot | bool | `true` |  |
| podSecurityContext.seccompProfile.type | string | `"RuntimeDefault"` |  |
| priorityClassName | string | `""` |  |
| rbac.create | bool | `true` | Create ClusterRole, Role and their bindings. |
| replicaCount | int | `1` | Number of operator replicas. The operator elects a leader, so extra replicas only shorten failover; they do not process in parallel. |
| resources.limits.cpu | string | `"500m"` |  |
| resources.limits.memory | string | `"512Mi"` |  |
| resources.requests.cpu | string | `"300m"` |  |
| resources.requests.memory | string | `"128Mi"` |  |
| securityContext.allowPrivilegeEscalation | bool | `false` |  |
| securityContext.capabilities.drop[0] | string | `"ALL"` |  |
| securityContext.readOnlyRootFilesystem | bool | `true` |  |
| securityContext.runAsNonRoot | bool | `true` |  |
| securityContext.seccompProfile.type | string | `"RuntimeDefault"` |  |
| serviceAccount.annotations | object | `{}` |  |
| serviceAccount.create | bool | `true` | Create the operator ServiceAccount. |
| serviceAccount.name | string | `""` | Name to use. Generated from the fullname template when empty. |
| terminationGracePeriodSeconds | int | `10` |  |
| tolerations | list | `[]` |  |
| topologySpreadConstraints | list | `[]` |  |
| watchNamespaces | string | `""` | Namespaces the operator watches. Empty watches every namespace. |
| webhook.certificate.duration | string | `""` |  |
| webhook.certificate.enabled | bool | `true` | Issue the webhook certificate with cert-manager. Required while webhook.enabled is true. |
| webhook.certificate.issuerRef | object | `{}` | Issuer to sign with. Empty creates a self-signed Issuer in the release namespace, matching upstream. |
| webhook.certificate.renewBefore | string | `""` |  |
| webhook.enabled | bool | `true` | Admission webhooks for the topology objects. Their rules are scoped to the rabbitmq.com group, so a stopped operator blocks changes to those objects only. |
| webhook.failurePolicy | string | `"Fail"` | failurePolicy for both webhook configurations. |
