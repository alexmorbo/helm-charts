
# lidarr

![Version: 0.1.2](https://img.shields.io/badge/Version-0.1.2-informational?style=flat-square) ![Type: application](https://img.shields.io/badge/Type-application-informational?style=flat-square) ![AppVersion: 3.1.2.4902](https://img.shields.io/badge/AppVersion-3.1.2.4902-informational?style=flat-square)

Lidarr helm chart for Kubernetes - Music collection manager for Usenet and BitTorrent users

**Homepage:** <https://github.com/alexmorbo/helm-charts>

## Maintainers

| Name | Email | Url |
| ---- | ------ | --- |
| AlexMorbo | <alex@morbo.ru> |  |

## Source Code

* <https://github.com/alexmorbo/helm-charts/tree/master/charts/lidarr>

## Requirements

Kubernetes: `>=1.23.0-0`

## Values

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| affinity | object | `{}` |  |
| app.analyticsEnabled | bool | `false` | Analytics |
| app.auth | object | `{"apiKey":"","apiKeyKey":"api-key","existingSecret":"","method":"External","required":"DisabledForLocalAddresses"}` | Authentication configuration |
| app.auth.apiKey | string | `""` | API key (auto-generated if empty and no existingSecret) |
| app.auth.apiKeyKey | string | `"api-key"` | Key in the secret containing the API key |
| app.auth.existingSecret | string | `""` | Existing secret with API key |
| app.auth.method | string | `"External"` | Authentication method: None, Basic, Forms, External |
| app.auth.required | string | `"DisabledForLocalAddresses"` | When authentication is required: Enabled, DisabledForLocalAddresses |
| app.branch | string | `"develop"` | Update branch: master, develop |
| app.database | object | `{"existingSecret":"","host":"","logsName":"lidarr_logs","name":"lidarr","password":"","passwordKey":"password","port":5432,"user":"lidarr"}` | Database configuration (PostgreSQL) |
| app.database.existingSecret | string | `""` | Existing secret with database password |
| app.database.host | string | `""` | Database host (empty = use SQLite) |
| app.database.logsName | string | `"lidarr_logs"` | Logs database name |
| app.database.name | string | `"lidarr"` | Main database name |
| app.database.password | string | `""` | Database password (required if host is set) |
| app.database.passwordKey | string | `"password"` | Key in the secret containing the password |
| app.instanceName | string | `"Lidarr"` | Instance name shown in UI |
| app.logLevel | string | `"info"` | Log level: debug, info, warn, error |
| app.server | object | `{"bindAddress":"*"}` | Server configuration |
| app.server.bindAddress | string | `"*"` | Bind address (* for all interfaces) |
| app.timezone | string | `"UTC"` | Timezone (e.g., Europe/Moscow, UTC) |
| extraEnv | list | `[]` | Environment variables to add to the pods |
| extraEnvFrom | list | `[]` | Environment variables from secrets or configmaps to add to the pods |
| extraInitContainers | list | `[]` | Extra init containers (e.g., for installing ffmpeg) |
| fullnameOverride | string | `""` |  |
| global.imageRegistry | string | `""` | Global image registry (used as fallback for all components) |
| global.strategy | object | `{"type":"Recreate"}` | Global deployment strategy (used as fallback for all components) |
| image.pullPolicy | string | `"IfNotPresent"` |  |
| image.registry | string | `""` | Image registry (falls back to global.imageRegistry, then to ghcr.io) |
| image.repository | string | `"home-operations/lidarr"` |  |
| image.tag | string | `""` | Overrides the image tag whose default is the chart appVersion |
| imagePullSecrets | list | `[]` |  |
| ingress.annotations | object | `{}` |  |
| ingress.enabled | bool | `false` |  |
| ingress.hosts[0].host | string | `"lidarr.local"` |  |
| ingress.hosts[0].paths[0].path | string | `"/"` |  |
| ingress.hosts[0].paths[0].pathType | string | `"Prefix"` |  |
| ingress.ingressClassName | string | `""` |  |
| ingress.tls | list | `[]` |  |
| livenessProbe.failureThreshold | int | `3` |  |
| livenessProbe.httpGet.path | string | `"/ping"` |  |
| livenessProbe.httpGet.port | string | `"http"` |  |
| livenessProbe.periodSeconds | int | `10` |  |
| livenessProbe.timeoutSeconds | int | `5` |  |
| monitoring | object | `{"enabled":false,"interval":"30s","labels":{},"namespace":"","path":"/metrics","scrapeTimeout":"10s","type":"ServiceMonitor"}` | Monitoring configuration |
| monitoring.type | string | `"ServiceMonitor"` | Type of service monitor: ServiceMonitor (Prometheus) or VMServiceScrape (VictoriaMetrics) |
| nameOverride | string | `""` |  |
| nodeSelector | object | `{}` |  |
| persistence | object | `{"accessModes":["ReadWriteOnce"],"annotations":{},"enabled":true,"existingClaim":"","size":"20Gi","storageClass":""}` | Persistence configuration for /config |
| podAnnotations | object | `{}` |  |
| podLabels | object | `{}` |  |
| podSecurityContext.fsGroup | int | `568` |  |
| podSecurityContext.fsGroupChangePolicy | string | `"OnRootMismatch"` |  |
| readinessProbe.failureThreshold | int | `3` |  |
| readinessProbe.httpGet.path | string | `"/ping"` |  |
| readinessProbe.httpGet.port | string | `"http"` |  |
| readinessProbe.periodSeconds | int | `10` |  |
| readinessProbe.timeoutSeconds | int | `5` |  |
| resources | object | `{}` |  |
| route | object | `{"annotations":{},"enabled":false,"hostnames":["lidarr.local"],"labels":{},"parentRefs":[{"name":"gateway","namespace":"gateway-system"}]}` | Gateway API HTTPRoute |
| securityContext.allowPrivilegeEscalation | bool | `false` |  |
| securityContext.capabilities.drop[0] | string | `"ALL"` |  |
| securityContext.readOnlyRootFilesystem | bool | `true` |  |
| securityContext.runAsGroup | int | `568` |  |
| securityContext.runAsNonRoot | bool | `true` |  |
| securityContext.runAsUser | int | `568` |  |
| securityContext.seccompProfile.type | string | `"RuntimeDefault"` |  |
| service.annotations | object | `{}` |  |
| service.port | int | `80` |  |
| service.type | string | `"ClusterIP"` |  |
| serviceAccount.annotations | object | `{}` |  |
| serviceAccount.automount | bool | `true` |  |
| serviceAccount.create | bool | `true` |  |
| serviceAccount.name | string | `""` |  |
| startupProbe.failureThreshold | int | `30` |  |
| startupProbe.httpGet.path | string | `"/ping"` |  |
| startupProbe.httpGet.port | string | `"http"` |  |
| startupProbe.initialDelaySeconds | int | `10` |  |
| startupProbe.periodSeconds | int | `5` |  |
| startupProbe.timeoutSeconds | int | `5` |  |
| strategy | object | `{}` | Deployment strategy (falls back to global.strategy) |
| tolerations | list | `[]` |  |
| volumeMounts | list | `[]` | Extra volume mounts |
| volumes | list | `[]` | Extra volumes (e.g., NFS for media) |
| youtubeCookies | object | `{"content":"","enabled":false,"existingSecret":"","mountPath":"/config/youtube_cookies.txt"}` | YouTube cookies for Tubifarry/yt-dlp |
| youtubeCookies.content | string | `""` | Cookies content (Netscape format, used if existingSecret is empty) Get from browser extension like "Get cookies.txt LOCALLY" |
| youtubeCookies.enabled | bool | `false` | Enable YouTube cookies mounting |
| youtubeCookies.existingSecret | string | `""` | Use existing secret (must contain 'cookies.txt' key) |
| youtubeCookies.mountPath | string | `"/config/youtube_cookies.txt"` | Path inside container where cookies file will be mounted |

----------------------------------------------
Autogenerated from chart metadata using [helm-docs v1.14.2](https://github.com/norwoodj/helm-docs/releases/v1.14.2)
