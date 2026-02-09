
# prometheus-pve-exporter

![Version: 1.2.0](https://img.shields.io/badge/Version-1.2.0-informational?style=flat-square) ![Type: application](https://img.shields.io/badge/Type-application-informational?style=flat-square) ![AppVersion: 3.8.0](https://img.shields.io/badge/AppVersion-3.8.0-informational?style=flat-square)

Prometheus pve exporter helm chart for Kubernetes

[![Artifact Hub](https://img.shields.io/endpoint?url=https://artifacthub.io/badge/repository/prometheus-pve-exporter)](https://artifacthub.io/packages/search?repo=prometheus-pve-exporter)

**Homepage:** <https://github.com/alexmorbo/helm-charts>

## Upgrade Notes

> ⚠️ **Breaking Changes in prometheus-pve-exporter v3.6.0+**
>
> Several metrics have been converted from Gauge to Counter type. This may affect existing dashboards and alerting rules.
> Review your Prometheus queries after upgrading.
>
> Key changes:
> - Some metrics now use `_total` suffix (Counter convention)
> - Rate/increase functions may be required for previously gauge-based queries

## New Metrics (v3.6.0 - v3.8.0)

| Version | Feature | Description |
|---------|---------|-------------|
| v3.6.0 | Subscription collector | Proxmox subscription status metrics |
| v3.7.0 | Backup coverage | `pve_backup_coverage_*` metrics for backup monitoring |
| v3.7.0 | API observability | `pve_api_call_duration_seconds`, `pve_api_call_errors_total` |
| v3.8.0 | Bug fixes | Various stability improvements |

## Maintainers

| Name | Email | Url |
| ---- | ------ | --- |
| AlexMorbo | <alex@morbo.ru> |  |

## Source Code

* <https://github.com/alexmorbo/helm-charts/tree/master/charts/prometheus-pve-exporter>

## Requirements

Kubernetes: `>=1.23.0-0`

## Features

- Supports **Prometheus Operator** (ScrapeConfig, PrometheusRule)
- Supports **VictoriaMetrics Operator** (VMScrapeConfig, VMRule)
- Multiple PVE targets and modules
- Built-in alerting rules for PVE monitoring

## Install

### PVE (Proxmox Virtual Environment) Configuration for Monitoring

To begin, we need to set up a user with appropriate permissions to allow for auditing and monitoring in Proxmox.

#### Step 1: Create a Monitoring User and Assign Audit Permissions

First, you need to create a new user for monitoring purposes. In this example, we create the user `monitoring@pve`:
```shell
pveum user add monitoring@pve
```
Next, assign the user the role `PVEAuditor` which allows the user to view audit logs and other monitoring-related information across the Proxmox environment.
This is done by modifying the Access Control List (ACL):

```shell
pveum aclmod / -user monitoring@pve -role PVEAuditor
```

This command assigns the specified user (`monitoring@pve`) the necessary permissions at the root level (`/`), ensuring they can view system-wide logs and status without altering configurations.

#### Step 2: Generate an Authentication Token for the User

Once the user has been created and permissions assigned, the next step is to generate an authentication token.
This token will be used by the monitoring tools to securely connect and authenticate to the Proxmox API.
You can create a token by executing the following command:

```shell
pveum user token add monitoring@pve exporter -privsep 0
```

The output will display important information about the token, such as the full token ID and its associated value.
Here's an example of what you should see:

```shell
┌──────────────┬──────────────────────────────────────┐
│ key          │ value                                │
╞══════════════╪══════════════════════════════════════╡
│ full-tokenid │ monitoring@pve!exporter              │
├──────────────┼──────────────────────────────────────┤
│ info         │ {"privsep":"0"}                      │
├──────────────┼──────────────────────────────────────┤
│ value        │ 80051882-94e2-4fa4-bfdb-411235019fee │
└──────────────┴──────────────────────────────────────┘
```

- **full-tokenid**: A unique identifier for the token (`monitoring@pve!exporter`), which is a combination of the user and the token name.
- **info**: Additional token metadata, such as `privsep` (privacy separation), which in this case is set to 0.
- **value**: The actual token value (`80051882-94e2-4fa4-bfdb-411235019fee`), which will be used for authentication.

### Helm Installation

```console
helm install prometheus-pve-exporter oci://ghcr.io/alexmorbo/helm-charts/prometheus-pve-exporter
```

## Configuration Examples

### Prometheus Operator (default)

```yaml
observability:
  type: prometheus
  scrape:
    enabled: true
    interval: 30s
    selector:
      release: kube-prometheus-stack
  rules:
    enabled: true
    selector:
      release: kube-prometheus-stack

modules:
  default:
    token_id: monitoring@pve!exporter
    token_secret: 80051882-94e2-4fa4-bfdb-411235019fee
    targets:
      - pve.homelab.local
```

### VictoriaMetrics Operator

```yaml
observability:
  type: victoriametrics
  scrape:
    enabled: true
    interval: 30s
    selector:
      app.kubernetes.io/name: vmagent
  rules:
    enabled: true
    selector:
      app.kubernetes.io/name: vmalert

modules:
  default:
    token_id: monitoring@pve!exporter
    token_secret: 80051882-94e2-4fa4-bfdb-411235019fee
    targets:
      - pve.homelab.local
```

### Multiple PVE Clusters

```yaml
observability:
  type: prometheus
  scrape:
    enabled: true
    selector:
      release: kube-prometheus-stack

modules:
  datacenter1:
    token_id: monitoring@pve!exporter
    token_secret: secret-for-dc1
    targets:
      - pve1.dc1.local
      - pve2.dc1.local
      - pve3.dc1.local
  datacenter2:
    token_id: monitoring@pve!exporter
    token_secret: secret-for-dc2
    targets:
      - pve1.dc2.local
      - pve2.dc2.local
```

### Disable SSL Verification (Self-signed Certificates)

If your Proxmox uses self-signed certificates, you can disable SSL verification:

```yaml
extraEnv:
  - name: PVE_VERIFY_SSL
    value: "false"
```

## Generated Resources

Based on configuration, the chart creates:

| observability.type | Scrape Config | Alerting Rules |
|--------------------|---------------|----------------|
| `prometheus` | `ScrapeConfig` (monitoring.coreos.com/v1alpha1) | `PrometheusRule` (monitoring.coreos.com/v1) |
| `victoriametrics` | `VMScrapeConfig` (operator.victoriametrics.com/v1beta1) | `VMRule` (operator.victoriametrics.com/v1beta1) |

## Values

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| affinity | object | `{}` |  |
| extraEnv | list | `[]` | Environment variables to add to the prometheus-pve-exporter pods |
| extraEnvFrom | list | `[]` | Environment variables from secrets or configmaps to add to the prometheus-pve-exporter pods |
| fullnameOverride | string | `""` |  |
| image.pullPolicy | string | `"IfNotPresent"` |  |
| image.registry | string | `"docker.io"` |  |
| image.repository | string | `"prompve/prometheus-pve-exporter"` |  |
| image.sha | string | `""` |  |
| image.tag | string | `""` | Overrides the image tag whose default is the chart appVersion. |
| imagePullSecrets | list | `[]` |  |
| livenessProbe.httpGet.path | string | `"/"` |  |
| livenessProbe.httpGet.port | string | `"metrics"` |  |
| livenessProbe.initialDelaySeconds | int | `10` |  |
| livenessProbe.periodSeconds | int | `30` |  |
| modules | object | `{}` |  |
| nameOverride | string | `""` |  |
| nodeSelector | object | `{}` |  |
| observability | object | `{"rules":{"enabled":false,"selector":{}},"scrape":{"enabled":true,"interval":"30s","selector":{"release":"kube-prometheus"}},"type":"prometheus"}` | Observability configuration for Prometheus Operator or VictoriaMetrics Operator |
| observability.rules | object | `{"enabled":false,"selector":{}}` | Alerting rules (PrometheusRule or VMRule) |
| observability.rules.enabled | bool | `false` | Enable alerting rules creation |
| observability.rules.selector | object | `{}` | Additional labels for rule selection by Prometheus/VMAlert |
| observability.scrape | object | `{"enabled":true,"interval":"30s","selector":{"release":"kube-prometheus"}}` | Scrape configuration (ScrapeConfig or VMScrapeConfig) |
| observability.scrape.enabled | bool | `true` | Enable scrape config creation |
| observability.scrape.interval | string | `"30s"` | Scrape interval |
| observability.scrape.selector | object | `{"release":"kube-prometheus"}` | Label selector for Prometheus/VMAgent to pick up this scrape config |
| observability.type | string | `"prometheus"` | Type of observability stack: "prometheus" or "victoriametrics" |
| podAnnotations | object | `{}` |  |
| podLabels | object | `{}` |  |
| podSecurityContext.fsGroup | int | `1000` |  |
| podSecurityContext.fsGroupChangePolicy | string | `"OnRootMismatch"` |  |
| readinessProbe.httpGet.path | string | `"/"` |  |
| readinessProbe.httpGet.port | string | `"metrics"` |  |
| readinessProbe.initialDelaySeconds | int | `5` |  |
| readinessProbe.periodSeconds | int | `10` |  |
| resources.limits.cpu | string | `"200m"` |  |
| resources.limits.memory | string | `"128Mi"` |  |
| resources.requests.cpu | string | `"50m"` |  |
| resources.requests.memory | string | `"64Mi"` |  |
| securityContext.allowPrivilegeEscalation | bool | `false` |  |
| securityContext.capabilities.drop[0] | string | `"ALL"` |  |
| securityContext.privileged | bool | `false` |  |
| securityContext.readOnlyRootFilesystem | bool | `false` |  |
| securityContext.runAsGroup | int | `1000` |  |
| securityContext.runAsNonRoot | bool | `true` |  |
| securityContext.runAsUser | int | `1000` |  |
| securityContext.seccompProfile.type | string | `"RuntimeDefault"` |  |
| service.port | int | `9221` |  |
| service.type | string | `"ClusterIP"` |  |
| serviceAccount.annotations | object | `{}` | Annotations to add to the service account |
| serviceAccount.automount | bool | `true` | Automatically mount a ServiceAccount's API credentials? |
| serviceAccount.create | bool | `true` | Specifies whether a service account should be created |
| serviceAccount.name | string | `""` | If not set and create is true, a name is generated using the fullname template |
| tolerations | list | `[]` |  |
| updateStrategy | object | `{"type":"RollingUpdate"}` | Deployment strategy |

## Alerting Rules

When `observability.rules.enabled` is set to `true`, the following alerts are created:

| Alert | Severity | Description |
|-------|----------|-------------|
| `PVEExporterDown` | critical | Fires when the PVE exporter is down for more than 5 minutes |
| `PveNodeDown` | critical | Fires when a PVE node is down for more than 5 minutes |
