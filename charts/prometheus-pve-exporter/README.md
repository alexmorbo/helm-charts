
# prometheus-pve-exporter

![Version: 1.0.3](https://img.shields.io/badge/Version-1.0.3-informational?style=flat-square) ![Type: application](https://img.shields.io/badge/Type-application-informational?style=flat-square) ![AppVersion: 3.5.0](https://img.shields.io/badge/AppVersion-3.5.0-informational?style=flat-square)

[![Artifact Hub](https://img.shields.io/endpoint?url=https://artifacthub.io/badge/repository/prometheus-pve-exporter)](https://artifacthub.io/packages/search?repo=prometheus-pve-exporter)

Prometheus pve exporter helm chart for Kubernetes

**Homepage:** <https://github.com/alexmorbo/helm-charts>

## Maintainers

| Name | Email | Url |
| ---- | ------ | --- |
| AlexMorbo | <alex@morbo.ru> |  |

## Source Code

* <https://github.com/alexmorbo/helm-charts/tree/master/charts/prometheus-pve-exporter>

## Requirements

Kubernetes: `>=1.23.0-0`

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
Here’s an example of what you should see:

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

### Example Chart Configuration

Now that the user and token are set up, you need to configure helm chart.
Below is an example of how to set up a Prometheus scrape configuration to monitor the Proxmox environment.

In this example, we configure Prometheus to monitor the Proxmox host located at `pve.homelab.local`.
The configuration uses the token generated earlier for authentication.

```yaml
prometheus: kube-prometheus-stack

modules:
  default:
    token_id: monitoring@pve!exporter
    token_secret: 80051882-94e2-4fa4-bfdb-411235019fee
    targets:
      - pve.homelab.local
```

#### Explanation of the Configuration

- **prometheus**: The name of the Prometheus stack (in this case, `kube-prometheus-stack`).
- **modules**: A section to define the authentication credentials for each target. In this case, we define a default module, which uses the previously created user (`monitoring@pve`) and token (`exporter`) for authentication. The `token_secret` is the generated token value (`80051882-94e2-4fa4-bfdb-411235019fee`).
- **modules[].targets**: The list of hosts to scrape metrics from. Here, we specify the Proxmox host `pve.homelab.local`.

### Helm
```console
helm install prometheus-pve-exporter oci://ghcr.io/alexmorbo/helm-charts/prometheus-pve-exporter
```

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
| livenessProbe | string | `nil` |  |
| modules | object | `{}` |  |
| nameOverride | string | `""` |  |
| nodeSelector | object | `{}` |  |
| podAnnotations | object | `{}` |  |
| podLabels | object | `{}` |  |
| podSecurityContext.fsGroup | int | `1000` |  |
| podSecurityContext.fsGroupChangePolicy | string | `"OnRootMismatch"` |  |
| prometheus | string | `""` |  |
| prometheusRule.enabled | bool | `false` |  |
| readinessProbe | string | `nil` |  |
| resources | object | `{}` |  |
| scrapeInterval | string | `""` |  |
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
