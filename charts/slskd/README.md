
# slskd

![Version: 0.1.0](https://img.shields.io/badge/Version-0.1.0-informational?style=flat-square) ![Type: application](https://img.shields.io/badge/Type-application-informational?style=flat-square) ![AppVersion: 0.24.3](https://img.shields.io/badge/AppVersion-0.24.3-informational?style=flat-square)

A modern client-server application for the Soulseek file sharing network

**Homepage:** <https://github.com/alexmorbo/helm-charts>

## Maintainers

| Name | Email | Url |
| ---- | ------ | --- |
| AlexMorbo | <alex@morbo.ru> |  |

## Source Code

* <https://github.com/alexmorbo/helm-charts/tree/master/charts/slskd>

## Requirements

Kubernetes: `>=1.23.0-0`

## Values

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| affinity | object | `{}` |  |
| app.directories.downloads | string | `"/media/downloads/slskd"` |  |
| app.directories.incomplete | string | `"/media/downloads/slskd/incomplete"` |  |
| app.existingSecret | string | `""` |  |
| app.limits.download.slots | int | `50` |  |
| app.limits.download.speedLimit | int | `0` |  |
| app.limits.upload.slots | int | `10` |  |
| app.limits.upload.speedLimit | int | `1000` |  |
| app.permissions.fileMode | string | `"0644"` |  |
| app.remoteConfiguration | bool | `false` |  |
| app.retention.downloads | int | `0` |  |
| app.retention.searches | int | `7` |  |
| app.retention.uploads | int | `0` |  |
| app.shares.cache.retention | int | `10080` |  |
| app.shares.cache.storageMode | string | `"memory"` |  |
| app.shares.directories[0] | string | `"/media/music"` |  |
| app.shares.filters[0] | string | `"\\.ini$"` |  |
| app.shares.filters[1] | string | `"Thumbs\\.db$"` |  |
| app.shares.filters[2] | string | `"\\.DS_Store$"` |  |
| app.shares.filters[3] | string | `"@eaDir"` |  |
| app.soulseek.distributedNetwork.childLimit | int | `50` |  |
| app.soulseek.distributedNetwork.enabled | bool | `true` |  |
| app.soulseek.listenPort | int | `50300` |  |
| app.soulseek.password | string | `""` |  |
| app.soulseek.username | string | `""` |  |
| app.timezone | string | `"UTC"` |  |
| app.urlBase | string | `""` |  |
| app.web.apiKey | string | `""` |  |
| app.web.authenticationDisabled | bool | `false` |  |
| extraEnv | list | `[]` |  |
| extraEnvFrom | list | `[]` |  |
| fullnameOverride | string | `""` |  |
| global.imageRegistry | string | `""` |  |
| global.strategy.type | string | `"Recreate"` |  |
| image.pullPolicy | string | `"IfNotPresent"` |  |
| image.registry | string | `"ghcr.io"` |  |
| image.repository | string | `"slskd/slskd"` |  |
| image.tag | string | `""` |  |
| imagePullSecrets | list | `[]` |  |
| ingress.annotations | object | `{}` |  |
| ingress.enabled | bool | `false` |  |
| ingress.hosts[0].host | string | `"slskd.local"` |  |
| ingress.hosts[0].paths[0].path | string | `"/"` |  |
| ingress.hosts[0].paths[0].pathType | string | `"Prefix"` |  |
| ingress.ingressClassName | string | `""` |  |
| ingress.tls | list | `[]` |  |
| livenessProbe.failureThreshold | int | `3` |  |
| livenessProbe.httpGet.path | string | `"/health"` |  |
| livenessProbe.httpGet.port | string | `"http"` |  |
| livenessProbe.periodSeconds | int | `30` |  |
| livenessProbe.timeoutSeconds | int | `10` |  |
| metrics.authentication.disabled | bool | `false` |  |
| metrics.enabled | bool | `false` |  |
| monitoring.basicAuth.enabled | bool | `false` |  |
| monitoring.basicAuth.secretName | string | `""` |  |
| monitoring.enabled | bool | `false` |  |
| monitoring.interval | string | `"30s"` |  |
| monitoring.labels | object | `{}` |  |
| monitoring.namespace | string | `""` |  |
| monitoring.path | string | `"/metrics"` |  |
| monitoring.scrapeTimeout | string | `"10s"` |  |
| monitoring.type | string | `"ServiceMonitor"` |  |
| nameOverride | string | `""` |  |
| nodeSelector | object | `{}` |  |
| p2pService.annotations | object | `{}` |  |
| p2pService.enabled | bool | `true` |  |
| p2pService.port | int | `50300` |  |
| p2pService.type | string | `"LoadBalancer"` |  |
| persistence.accessModes[0] | string | `"ReadWriteOnce"` |  |
| persistence.annotations | object | `{}` |  |
| persistence.enabled | bool | `true` |  |
| persistence.existingClaim | string | `""` |  |
| persistence.size | string | `"5Gi"` |  |
| persistence.storageClass | string | `""` |  |
| podAnnotations | object | `{}` |  |
| podLabels | object | `{}` |  |
| podSecurityContext.fsGroup | int | `1000` |  |
| podSecurityContext.fsGroupChangePolicy | string | `"OnRootMismatch"` |  |
| readinessProbe.failureThreshold | int | `3` |  |
| readinessProbe.httpGet.path | string | `"/health"` |  |
| readinessProbe.httpGet.port | string | `"http"` |  |
| readinessProbe.periodSeconds | int | `10` |  |
| readinessProbe.timeoutSeconds | int | `5` |  |
| replicaCount | int | `1` |  |
| resources | object | `{}` |  |
| route.annotations | object | `{}` |  |
| route.enabled | bool | `false` |  |
| route.hostnames | list | `[]` |  |
| route.labels | object | `{}` |  |
| route.parentRefs | list | `[]` |  |
| securityContext.runAsGroup | int | `1000` |  |
| securityContext.runAsNonRoot | bool | `true` |  |
| securityContext.runAsUser | int | `1000` |  |
| service.annotations | object | `{}` |  |
| service.port | int | `80` |  |
| service.type | string | `"ClusterIP"` |  |
| serviceAccount.annotations | object | `{}` |  |
| serviceAccount.automount | bool | `true` |  |
| serviceAccount.create | bool | `true` |  |
| serviceAccount.name | string | `""` |  |
| startupProbe.failureThreshold | int | `30` |  |
| startupProbe.httpGet.path | string | `"/health"` |  |
| startupProbe.httpGet.port | string | `"http"` |  |
| startupProbe.initialDelaySeconds | int | `5` |  |
| startupProbe.periodSeconds | int | `5` |  |
| startupProbe.timeoutSeconds | int | `5` |  |
| strategy | object | `{}` |  |
| tolerations | list | `[]` |  |
| volumeMounts | list | `[]` |  |
| volumes | list | `[]` |  |

----------------------------------------------
Autogenerated from chart metadata using [helm-docs v1.14.2](https://github.com/norwoodj/helm-docs/releases/v1.14.2)
