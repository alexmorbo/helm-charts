
# dell-fan-controller

![Version: 1.0.3](https://img.shields.io/badge/Version-1.0.3-informational?style=flat-square) ![Type: application](https://img.shields.io/badge/Type-application-informational?style=flat-square) ![AppVersion: 0.1.6](https://img.shields.io/badge/AppVersion-0.1.6-informational?style=flat-square)

[![Artifact Hub](https://img.shields.io/endpoint?url=https://artifacthub.io/badge/repository/dell-fan-controller)](https://artifacthub.io/packages/search?repo=dell-fan-controller)

Dell Fan Controller helm chart for Kubernetes

**Homepage:** <https://github.com/alexmorbo/helm-charts>

## Maintainers

| Name | Email | Url |
| ---- | ------ | --- |
| AlexMorbo | <alex@morbo.ru> |  |

## Source Code

* <https://github.com/alexmorbo/helm-charts/tree/master/charts/dell-fan-controller>

## Requirements

Kubernetes: `>=1.23.0-0`

## Install
```console
helm install dell-fan-controller oci://ghcr.io/alexmorbo/helm-charts/dell-fan-controller
```

## Values

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| affinity | object | `{}` |  |
| annotations | object | `{}` |  |
| extraEnv | list | `[]` | Environment variables to add |
| extraEnvFrom | list | `[]` | Environment variables from secrets or configmaps to add |
| fullnameOverride | string | `""` |  |
| image.pullPolicy | string | `"IfNotPresent"` |  |
| image.registry | string | `"ghcr.io"` |  |
| image.repository | string | `"alexmorbo/dell_idrac_fan_controller"` |  |
| image.sha | string | `""` |  |
| image.tag | string | `"v0.1.6"` | Overrides the image tag whose default is the chart appVersion. |
| imagePullSecrets | list | `[]` |  |
| nameOverride | string | `""` |  |
| nodeSelector | object | `{}` |  |
| podSecurityContext.fsGroup | int | `65534` |  |
| podSecurityContext.fsGroupChangePolicy | string | `"OnRootMismatch"` |  |
| resources | object | `{}` |  |
| securityContext.allowPrivilegeEscalation | bool | `false` |  |
| securityContext.capabilities.drop[0] | string | `"ALL"` |  |
| securityContext.privileged | bool | `false` |  |
| securityContext.readOnlyRootFilesystem | bool | `true` |  |
| securityContext.runAsGroup | int | `65534` |  |
| securityContext.runAsNonRoot | bool | `true` |  |
| securityContext.runAsUser | int | `65534` |  |
| securityContext.seccompProfile.type | string | `"RuntimeDefault"` |  |
| server.check_interval | string | `"30"` |  |
| server.cpu_temperature_threshold | string | `""` |  |
| server.disable_pcie_cooling | string | `"false"` |  |
| server.fan_speed | string | `""` |  |
| server.host | string | `""` |  |
| server.keep_pcie_cooling | string | `"false"` |  |
| server.password | string | `""` |  |
| server.username | string | `""` |  |
| tolerations | list | `[]` |  |
| updateStrategy | object | `{"type":"Recreate"}` | Deployment strategy |
