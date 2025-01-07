
# qbittorrent

![Version: 1.0.16](https://img.shields.io/badge/Version-1.0.16-informational?style=flat-square) ![Type: application](https://img.shields.io/badge/Type-application-informational?style=flat-square) ![AppVersion: 4.6.6](https://img.shields.io/badge/AppVersion-4.6.6-informational?style=flat-square)

[![Artifact Hub](https://img.shields.io/endpoint?url=https://artifacthub.io/badge/repository/qbittorrent)](https://artifacthub.io/packages/search?repo=qbittorrent)

qbittorrent helm chart for Kubernetes

**Homepage:** <https://github.com/qbittorrent/qBittorrent>

## Maintainers

| Name | Email | Url |
| ---- | ------ | --- |
| AlexMorbo | <alex@morbo.ru> |  |

## Source Code

* <https://github.com/alexmorbo/helm-charts/tree/master/charts/qbittorrent>
* <https://github.com/M0NsTeRRR/helm-charts>

## Requirements

Kubernetes: `>=1.23.0-0`

## Install
```console
helm install qbittorrent oci://ghcr.io/alexmorbo/helm-charts/qbittorrent
```

## Values

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| genericDevicePlugin | object | `{"affinity":{},"enabled":true,"extraContainers":[],"extraEnv":[],"extraEnvFrom":[],"extraInitContainers":[],"fullnameOverride":"","image":{"registry":"ghcr.io","repository":"squat/generic-device-plugin","sha":"","tag":"36bfc606bba2064de6ede0ff2764cbb52edff70d"},"imagePullSecrets":[],"nameOverride":"","nodeSelector":{},"podAnnotations":{},"podLabels":{},"podSecurityContext":{},"priorityClassName":"system-node-critical","resources":{},"securityContext":{"privileged":true},"serviceAccount":{"annotations":{},"automount":true,"create":true,"name":""},"serviceMonitor":{"enabled":false,"interval":"30s","labels":{},"metricRelabelings":[],"namespace":null,"path":"/metrics","relabelings":[],"scheme":"http","scrapeTimeout":"30s","service":{"port":8080},"targetLabels":[],"tlsConfig":{}},"tolerations":[],"updateStrategy":{"type":"RollingUpdate"}}` | A Kubernetes device plugin to schedule generic Linux devices (used for /dev/tun) |
| genericDevicePlugin.enabled | bool | `true` | Enable generic device plugin daemonset |
| genericDevicePlugin.extraEnv | list | `[]` | Environment variables to add to the qbittorrent pods |
| genericDevicePlugin.extraEnvFrom | list | `[]` | Environment variables from secrets or configmaps to add to the qbittorrent pods |
| genericDevicePlugin.image.tag | string | `"36bfc606bba2064de6ede0ff2764cbb52edff70d"` | Overrides the image tag whose default is the chart appVersion. |
| genericDevicePlugin.serviceAccount.annotations | object | `{}` | Annotations to add to the service account |
| genericDevicePlugin.serviceAccount.automount | bool | `true` | Automatically mount a ServiceAccount's API credentials? |
| genericDevicePlugin.serviceAccount.create | bool | `true` | Specifies whether a service account should be created |
| genericDevicePlugin.serviceAccount.name | string | `""` | If not set and create is true, a name is generated using the fullname template |
| genericDevicePlugin.serviceMonitor.enabled | bool | `false` | If true, a ServiceMonitor CRD is created for a prometheus operator |
| genericDevicePlugin.serviceMonitor.namespace | string | `nil` | If set create the `ServiceMonitor` in an alternate namespace. |
| genericDevicePlugin.serviceMonitor.service.port | int | `8080` | Metrics service port to scrape |
| genericDevicePlugin.updateStrategy | object | `{"type":"RollingUpdate"}` | Deployment strategy |
| manage.affinity | object | `{}` |  |
| manage.config | object | `{}` |  |
| manage.enabled | bool | `false` |  |
| manage.env | list | `[]` |  |
| manage.image.pullPolicy | string | `"IfNotPresent"` |  |
| manage.image.registry | string | `"ghcr.io"` |  |
| manage.image.repository | string | `"stuffanthings/qbit_manage"` |  |
| manage.image.sha | string | `""` |  |
| manage.image.tag | string | `"v4.1.15"` |  |
| manage.imagePullSecrets | list | `[]` |  |
| manage.nodeSelector | object | `{}` |  |
| manage.persistence.accessModes | list | `["ReadWriteOnce"]` | Access modes of persistent disk |
| manage.persistence.annotations | object | `{}` | Annotations for PVCs |
| manage.persistence.enabled | bool | `true` |  |
| manage.persistence.name | string | `""` | Config name |
| manage.persistence.size | string | `"5Gi"` | Size of persistent disk |
| manage.persistence.volumeName | string | `""` | Name of the permanent volume to reference in the claim. Can be used to bind to existing volumes. |
| manage.podAnnotations | object | `{}` |  |
| manage.podLabels | object | `{}` |  |
| manage.podSecurityContext.fsGroup | int | `65534` |  |
| manage.podSecurityContext.fsGroupChangePolicy | string | `"OnRootMismatch"` |  |
| manage.resources.limits.cpu | string | `"100m"` |  |
| manage.resources.limits.memory | string | `"128Mi"` |  |
| manage.resources.requests.cpu | string | `"50m"` |  |
| manage.resources.requests.memory | string | `"64Mi"` |  |
| manage.securityContext.allowPrivilegeEscalation | bool | `false` |  |
| manage.securityContext.capabilities.drop[0] | string | `"ALL"` |  |
| manage.securityContext.privileged | bool | `false` |  |
| manage.securityContext.readOnlyRootFilesystem | bool | `true` |  |
| manage.securityContext.runAsGroup | int | `65534` |  |
| manage.securityContext.runAsNonRoot | bool | `true` |  |
| manage.securityContext.runAsUser | int | `65534` |  |
| manage.securityContext.seccompProfile.type | string | `"RuntimeDefault"` |  |
| manage.tolerations | list | `[]` |  |
| manage.updateStrategy.type | string | `"Recreate"` |  |
| qbittorrent.affinity | object | `{}` |  |
| qbittorrent.config | object | `{"persistence":{"accessModes":["ReadWriteOnce"],"annotations":{},"enabled":true,"name":"","size":"5Gi","volumeName":""}}` | Creating PVC to store configuration |
| qbittorrent.config.persistence.accessModes | list | `["ReadWriteOnce"]` | Access modes of persistent disk |
| qbittorrent.config.persistence.annotations | object | `{}` | Annotations for PVCs |
| qbittorrent.config.persistence.name | string | `""` | Config name |
| qbittorrent.config.persistence.size | string | `"5Gi"` | Size of persistent disk |
| qbittorrent.config.persistence.volumeName | string | `""` | Name of the permanent volume to reference in the claim. Can be used to bind to existing volumes. |
| qbittorrent.extraEnv | list | `[]` | Environment variables to add to the qbittorrent pods |
| qbittorrent.extraEnvFrom | list | `[]` | Environment variables from secrets or configmaps to add to the qbittorrent pods |
| qbittorrent.extraInitContainers | list | `[]` |  |
| qbittorrent.fullnameOverride | string | `""` |  |
| qbittorrent.gluetun | object | `{"enabled":true,"extraEnv":[],"extraEnvFrom":[],"image":{"pullPolicy":"IfNotPresent","registry":"docker.io","repository":"qmcgaw/gluetun","sha":"","tag":"v3.40.0"},"resources":{"limits":{"squat.ai/tun":1}},"securityContext":{"capabilities":{"add":["NET_ADMIN"]}},"volumeMounts":[]}` | Gluetun sidecar |
| qbittorrent.image.pullPolicy | string | `"IfNotPresent"` |  |
| qbittorrent.image.registry | string | `"ghcr.io"` |  |
| qbittorrent.image.repository | string | `"onedr0p/qbittorrent"` |  |
| qbittorrent.image.sha | string | `""` |  |
| qbittorrent.image.tag | string | `""` | Overrides the image tag whose default is the chart appVersion. |
| qbittorrent.imagePullSecrets | list | `[]` |  |
| qbittorrent.ingress.annotations | object | `{}` |  |
| qbittorrent.ingress.enabled | bool | `false` |  |
| qbittorrent.ingress.hosts[0].host | string | `"chart-example.local"` |  |
| qbittorrent.ingress.hosts[0].paths[0].path | string | `"/"` |  |
| qbittorrent.ingress.hosts[0].paths[0].pathType | string | `"ImplementationSpecific"` |  |
| qbittorrent.ingress.ingressClassName | string | `""` |  |
| qbittorrent.ingress.tls | list | `[]` |  |
| qbittorrent.metrics.affinity | object | `{}` |  |
| qbittorrent.metrics.enabled | bool | `false` |  |
| qbittorrent.metrics.image.pullPolicy | string | `"IfNotPresent"` |  |
| qbittorrent.metrics.image.registry | string | `"ghcr.io"` |  |
| qbittorrent.metrics.image.repository | string | `"esanchezm/prometheus-qbittorrent-exporter"` |  |
| qbittorrent.metrics.image.sha | string | `""` |  |
| qbittorrent.metrics.image.tag | string | `"v1.6.0"` |  |
| qbittorrent.metrics.imagePullSecrets | list | `[]` |  |
| qbittorrent.metrics.livenessProbe.failureThreshold | int | `4` |  |
| qbittorrent.metrics.livenessProbe.httpGet.path | string | `"/"` |  |
| qbittorrent.metrics.livenessProbe.httpGet.port | int | `8000` |  |
| qbittorrent.metrics.livenessProbe.httpGet.scheme | string | `"HTTP"` |  |
| qbittorrent.metrics.livenessProbe.initialDelaySeconds | int | `20` |  |
| qbittorrent.metrics.livenessProbe.periodSeconds | int | `10` |  |
| qbittorrent.metrics.livenessProbe.successThreshold | int | `1` |  |
| qbittorrent.metrics.livenessProbe.timeoutSeconds | int | `5` |  |
| qbittorrent.metrics.nodeSelector | object | `{}` |  |
| qbittorrent.metrics.podAnnotations | object | `{}` |  |
| qbittorrent.metrics.podLabels | object | `{}` |  |
| qbittorrent.metrics.podSecurityContext.fsGroup | int | `65534` |  |
| qbittorrent.metrics.podSecurityContext.fsGroupChangePolicy | string | `"OnRootMismatch"` |  |
| qbittorrent.metrics.readinessProbe.failureThreshold | int | `4` |  |
| qbittorrent.metrics.readinessProbe.httpGet.path | string | `"/"` |  |
| qbittorrent.metrics.readinessProbe.httpGet.port | int | `8000` |  |
| qbittorrent.metrics.readinessProbe.httpGet.scheme | string | `"HTTP"` |  |
| qbittorrent.metrics.readinessProbe.initialDelaySeconds | int | `20` |  |
| qbittorrent.metrics.readinessProbe.periodSeconds | int | `10` |  |
| qbittorrent.metrics.readinessProbe.successThreshold | int | `1` |  |
| qbittorrent.metrics.readinessProbe.timeoutSeconds | int | `5` |  |
| qbittorrent.metrics.resources.limits.cpu | string | `"100m"` |  |
| qbittorrent.metrics.resources.limits.memory | string | `"128Mi"` |  |
| qbittorrent.metrics.resources.requests.cpu | string | `"50m"` |  |
| qbittorrent.metrics.resources.requests.memory | string | `"64Mi"` |  |
| qbittorrent.metrics.securityContext.allowPrivilegeEscalation | bool | `false` |  |
| qbittorrent.metrics.securityContext.capabilities.drop[0] | string | `"ALL"` |  |
| qbittorrent.metrics.securityContext.privileged | bool | `false` |  |
| qbittorrent.metrics.securityContext.readOnlyRootFilesystem | bool | `true` |  |
| qbittorrent.metrics.securityContext.runAsGroup | int | `65534` |  |
| qbittorrent.metrics.securityContext.runAsNonRoot | bool | `true` |  |
| qbittorrent.metrics.securityContext.runAsUser | int | `65534` |  |
| qbittorrent.metrics.securityContext.seccompProfile.type | string | `"RuntimeDefault"` |  |
| qbittorrent.metrics.service.port | int | `8000` |  |
| qbittorrent.metrics.serviceMonitor.enabled | bool | `false` |  |
| qbittorrent.metrics.serviceMonitor.interval | string | `"30s"` |  |
| qbittorrent.metrics.serviceMonitor.labels | object | `{}` |  |
| qbittorrent.metrics.serviceMonitor.namespace | string | `""` | If set create the `ServiceMonitor` in an alternate namespace. |
| qbittorrent.metrics.serviceMonitor.relabelings | list | `[]` |  |
| qbittorrent.metrics.serviceMonitor.scheme | string | `"http"` |  |
| qbittorrent.metrics.serviceMonitor.scrapeTimeout | string | `"30s"` |  |
| qbittorrent.metrics.serviceMonitor.tlsConfig | object | `{}` |  |
| qbittorrent.metrics.tolerations | list | `[]` |  |
| qbittorrent.metrics.updateStrategy.type | string | `"Recreate"` |  |
| qbittorrent.nameOverride | string | `""` |  |
| qbittorrent.nodeSelector | object | `{}` |  |
| qbittorrent.podAnnotations | object | `{}` |  |
| qbittorrent.podLabels | object | `{}` |  |
| qbittorrent.podSecurityContext.fsGroup | int | `65534` |  |
| qbittorrent.podSecurityContext.fsGroupChangePolicy | string | `"OnRootMismatch"` |  |
| qbittorrent.replicaCount | int | `1` |  |
| qbittorrent.resources | object | `{}` |  |
| qbittorrent.securityContext.allowPrivilegeEscalation | bool | `false` |  |
| qbittorrent.securityContext.capabilities.drop[0] | string | `"ALL"` |  |
| qbittorrent.securityContext.privileged | bool | `false` |  |
| qbittorrent.securityContext.readOnlyRootFilesystem | bool | `true` |  |
| qbittorrent.securityContext.runAsGroup | int | `65534` |  |
| qbittorrent.securityContext.runAsNonRoot | bool | `true` |  |
| qbittorrent.securityContext.runAsUser | int | `65534` |  |
| qbittorrent.securityContext.seccompProfile.type | string | `"RuntimeDefault"` |  |
| qbittorrent.service.torrent.annotations | object | `{}` | Annotations to add to the torrent service |
| qbittorrent.service.torrent.port | int | `8388` |  |
| qbittorrent.service.torrent.type | string | `"ClusterIP"` |  |
| qbittorrent.service.web.annotations | object | `{}` | Annotations to add to the web service |
| qbittorrent.service.web.port | int | `80` |  |
| qbittorrent.service.web.type | string | `"ClusterIP"` |  |
| qbittorrent.serviceAccount.annotations | object | `{}` | Annotations to add to the service account |
| qbittorrent.serviceAccount.automount | bool | `true` | Automatically mount a ServiceAccount's API credentials? |
| qbittorrent.serviceAccount.create | bool | `true` | Specifies whether a service account should be created |
| qbittorrent.serviceAccount.name | string | `""` | If not set and create is true, a name is generated using the fullname template |
| qbittorrent.tolerations | list | `[]` |  |
| qbittorrent.updateStrategy | object | `{"type":"Recreate"}` | Deployment strategy |
| qbittorrent.volumeMounts | list | `[]` | Additional volumeMounts on the output Deployment definition. |
| qbittorrent.volumes | list | `[]` | Additional volumes on the output Deployment definition. |