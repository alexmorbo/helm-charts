
# paperless-ngx

![Version: 0.1.1](https://img.shields.io/badge/Version-0.1.1-informational?style=flat-square) ![Type: application](https://img.shields.io/badge/Type-application-informational?style=flat-square) ![AppVersion: 2.20.5](https://img.shields.io/badge/AppVersion-2.20.5-informational?style=flat-square)

Paperless-ngx helm chart for Kubernetes - Document management system

**Homepage:** <https://github.com/alexmorbo/helm-charts>

## Maintainers

| Name | Email | Url |
| ---- | ------ | --- |
| AlexMorbo | <alex@morbo.ru> |  |

## Source Code

* <https://github.com/alexmorbo/helm-charts/tree/master/charts/paperless-ngx>

## Requirements

Kubernetes: `>=1.23.0-0`

| Repository | Name | Version |
|------------|------|---------|
| https://valkey.io/valkey-helm/ | valkey | 0.x.x |

## Values

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| affinity | object | `{}` |  |
| app.csrfTrustedOrigins | string | `""` | CSRF trusted origins (comma-separated, defaults to app.url if set) |
| app.database | object | `{"existingSecret":"","existingSecretKey":"password","host":"","name":"paperless","password":"","port":5432,"sslmode":"prefer","user":"paperless"}` | Database configuration |
| app.dateOrder | string | `"DMY"` | Date order for parsing: DMY, MDY, YMD |
| app.filenameFormat | string | `""` | Filename format template |
| app.filenameFormatRemoveNone | bool | `true` | Remove 'none' placeholders from filename |
| app.ocrLanguages | list | `[]` | OCR languages to install and use (e.g., ["rus", "eng", "deu"]) First language is primary. English is always included. |
| app.ocrMode | string | `"skip"` | OCR mode: skip (default), redo, force |
| app.oidc | object | `{"clientId":"","clientIdKey":"client-id","clientSecret":"","clientSecretKey":"client-secret","disableRegularLogin":false,"displayName":"SSO Login","enabled":false,"existingSecret":"","providerId":"keycloak","redirectLoginToSSO":false,"serverUrl":""}` | OIDC/SSO configuration |
| app.taskWorkers | int | `1` | Number of task workers |
| app.threadsPerWorker | int | `1` | Threads per worker |
| app.timeZone | string | `""` | Timezone (e.g., Europe/Moscow, UTC) |
| app.url | string | `""` | Public URL of paperless-ngx (e.g., https://paperless.example.com) |
| app.valkey | object | `{"enabled":true,"prefix":""}` | Built-in Valkey (Redis) |
| app.valkey.prefix | string | `""` | Prefix for Redis keys |
| app.valkeyExternal | object | `{"existingSecret":"","existingSecretKey":"url","url":""}` | External Valkey/Redis (when app.valkey.enabled=false) |
| extraEnv | list | `[]` | Environment variables to add to the pods |
| extraEnvFrom | list | `[]` | Environment variables from secrets or configmaps to add to the pods |
| extraInitContainers | list | `[]` | Additional init containers |
| flower | object | `{"enabled":false,"ingress":{"annotations":{},"enabled":false,"hosts":[{"host":"flower.local","paths":[{"path":"/","pathType":"Prefix"}]}],"ingressClassName":"","tls":[]},"port":5555,"route":{"annotations":{},"enabled":false,"hostnames":["flower.local"],"labels":{},"parentRefs":[{"name":"gateway","namespace":"gateway-system"}]}}` | Flower (Celery monitoring) |
| fullnameOverride | string | `""` |  |
| global.imageRegistry | string | `""` | Global image registry (used as fallback for all components) |
| global.strategy | object | `{"type":"Recreate"}` | Global deployment strategy (used as fallback for all components) |
| gotenberg | object | `{"affinity":{},"enabled":false,"image":{"pullPolicy":"IfNotPresent","registry":"","repository":"gotenberg/gotenberg","tag":"8.25.1"},"nodeSelector":{},"port":3000,"resources":{},"strategy":{},"tolerations":[]}` | Gotenberg for document conversion |
| gotenberg.image.registry | string | `""` | Registry (falls back to global.imageRegistry) |
| gotenberg.strategy | object | `{}` | Strategy (falls back to global.strategy) |
| image.pullPolicy | string | `"IfNotPresent"` |  |
| image.registry | string | `""` | Image registry (falls back to global.imageRegistry, then to ghcr.io) |
| image.repository | string | `"paperless-ngx/paperless-ngx"` |  |
| image.tag | string | `""` | Overrides the image tag whose default is the chart appVersion. |
| imagePullSecrets | list | `[]` |  |
| ingress.annotations | object | `{}` |  |
| ingress.enabled | bool | `false` |  |
| ingress.hosts[0].host | string | `"paperless.local"` |  |
| ingress.hosts[0].paths[0].path | string | `"/"` |  |
| ingress.hosts[0].paths[0].pathType | string | `"Prefix"` |  |
| ingress.ingressClassName | string | `""` |  |
| ingress.tls | list | `[]` |  |
| livenessProbe.failureThreshold | int | `3` |  |
| livenessProbe.httpGet.path | string | `"/"` |  |
| livenessProbe.httpGet.port | string | `"http"` |  |
| livenessProbe.periodSeconds | int | `10` |  |
| livenessProbe.timeoutSeconds | int | `5` |  |
| monitoring | object | `{"enabled":false,"interval":"30s","kubectl":{"pullPolicy":"IfNotPresent","registry":"","repository":"alpine/kubectl","tag":""},"labels":{},"namespace":"","paperlessExporter":{"affinity":{},"collectors":[],"enabled":true,"existingSecret":"","image":{"pullPolicy":"IfNotPresent","registry":"","repository":"hansmi/prometheus-paperless-exporter","tag":"v0.0.9"},"nodeSelector":{},"port":8081,"resources":{},"secretKey":"api-token","tolerations":[]},"path":"/metrics","scrapeTimeout":"10s","type":"ServiceMonitor","valkeyExporter":{"affinity":{},"enabled":true,"image":{"pullPolicy":"IfNotPresent","registry":"","repository":"oliver006/redis_exporter","tag":"v1.80.1"},"nodeSelector":{},"port":9121,"resources":{},"tolerations":[]}}` | Monitoring configuration |
| monitoring.kubectl | object | `{"pullPolicy":"IfNotPresent","registry":"","repository":"alpine/kubectl","tag":""}` | kubectl image for init containers and jobs |
| monitoring.kubectl.registry | string | `""` | Registry (falls back to global.imageRegistry, then to docker.io) |
| monitoring.kubectl.tag | string | `""` | Tag (empty = auto-detect from cluster version) |
| monitoring.paperlessExporter | object | `{"affinity":{},"collectors":[],"enabled":true,"existingSecret":"","image":{"pullPolicy":"IfNotPresent","registry":"","repository":"hansmi/prometheus-paperless-exporter","tag":"v0.0.9"},"nodeSelector":{},"port":8081,"resources":{},"secretKey":"api-token","tolerations":[]}` | Paperless exporter (prometheus-paperless-exporter) Exports metrics from Paperless-ngx via REST API Token is automatically created via post-install Job (creates "monitoring" user) |
| monitoring.paperlessExporter.collectors | list | `[]` | Collectors to enable (empty = all). Options: tag, correspondent, document_type, storage_path, task, log, group, user, document, status, statistics, remote_version |
| monitoring.paperlessExporter.existingSecret | string | `""` | Existing secret with API token (if set, disables auto-creation) |
| monitoring.paperlessExporter.image.registry | string | `""` | Registry (falls back to global.imageRegistry, then to ghcr.io) |
| monitoring.paperlessExporter.secretKey | string | `"api-token"` | Key in the secret containing the API token |
| monitoring.type | string | `"ServiceMonitor"` | Type of service monitor: ServiceMonitor (Prometheus) or VMServiceScrape (VictoriaMetrics) |
| monitoring.valkeyExporter | object | `{"affinity":{},"enabled":true,"image":{"pullPolicy":"IfNotPresent","registry":"","repository":"oliver006/redis_exporter","tag":"v1.80.1"},"nodeSelector":{},"port":9121,"resources":{},"tolerations":[]}` | Valkey/Redis exporter Exports Redis-compatible metrics from Valkey |
| monitoring.valkeyExporter.image.registry | string | `""` | Registry (falls back to global.imageRegistry, then to docker.io) |
| nameOverride | string | `""` |  |
| nodeSelector | object | `{}` |  |
| paperlessAi.addProcessedTag | bool | `true` |  |
| paperlessAi.affinity | object | `{}` |  |
| paperlessAi.custom.apiKey | string | `""` |  |
| paperlessAi.custom.existingSecret | string | `""` |  |
| paperlessAi.custom.model | string | `""` |  |
| paperlessAi.custom.secretKey | string | `"api-key"` |  |
| paperlessAi.custom.url | string | `""` |  |
| paperlessAi.enabled | bool | `false` |  |
| paperlessAi.image.pullPolicy | string | `"IfNotPresent"` |  |
| paperlessAi.image.registry | string | `""` | Registry (falls back to global.imageRegistry) |
| paperlessAi.image.repository | string | `"clusterzx/paperless-ai"` |  |
| paperlessAi.image.tag | string | `"3.0.9"` |  |
| paperlessAi.ingress.annotations | object | `{}` |  |
| paperlessAi.ingress.enabled | bool | `false` |  |
| paperlessAi.ingress.host | string | `"paperless-ai.local"` |  |
| paperlessAi.ingress.ingressClassName | string | `""` |  |
| paperlessAi.ingress.tls | list | `[]` |  |
| paperlessAi.nodeSelector | object | `{}` |  |
| paperlessAi.ollama.model | string | `"llama3.2"` |  |
| paperlessAi.ollama.url | string | `"http://ollama:11434"` |  |
| paperlessAi.openai.apiKey | string | `""` |  |
| paperlessAi.openai.existingSecret | string | `""` |  |
| paperlessAi.openai.model | string | `"gpt-4o-mini"` |  |
| paperlessAi.openai.secretKey | string | `"api-key"` |  |
| paperlessAi.paperless.apiToken | string | `""` | API token (if not using existingSecret or useSharedToken) |
| paperlessAi.paperless.existingSecret | string | `""` | Existing secret with API token (overrides useSharedToken) |
| paperlessAi.paperless.secretKey | string | `"api-token"` |  |
| paperlessAi.paperless.useSharedToken | bool | `true` | Use shared API token from monitoring (created automatically) |
| paperlessAi.persistence.enabled | bool | `true` |  |
| paperlessAi.persistence.existingClaim | string | `""` |  |
| paperlessAi.persistence.size | string | `"1Gi"` |  |
| paperlessAi.persistence.storageClass | string | `""` |  |
| paperlessAi.processExistingDocuments | bool | `false` |  |
| paperlessAi.processedTagName | string | `"ai-processed"` |  |
| paperlessAi.provider | string | `"openai"` |  |
| paperlessAi.resources | object | `{}` |  |
| paperlessAi.scanInterval | string | `"*/30 * * * *"` |  |
| paperlessAi.strategy | object | `{}` | Strategy (falls back to global.strategy) |
| paperlessAi.tolerations | list | `[]` |  |
| persistence | object | `{"accessModes":["ReadWriteOnce"],"annotations":{},"enabled":true,"existingClaim":"","size":"20Gi","storageClass":""}` | Persistence configuration (single PVC with subPaths) |
| podAnnotations | object | `{}` |  |
| podLabels | object | `{}` |  |
| podSecurityContext.fsGroup | int | `1000` |  |
| podSecurityContext.fsGroupChangePolicy | string | `"OnRootMismatch"` |  |
| readinessProbe.failureThreshold | int | `3` |  |
| readinessProbe.httpGet.path | string | `"/"` |  |
| readinessProbe.httpGet.port | string | `"http"` |  |
| readinessProbe.periodSeconds | int | `10` |  |
| readinessProbe.timeoutSeconds | int | `5` |  |
| resources | object | `{}` |  |
| route | object | `{"annotations":{},"enabled":false,"hostnames":["paperless.local"],"labels":{},"parentRefs":[{"name":"gateway","namespace":"gateway-system"}]}` | Gateway API HTTPRoute |
| securityContext | object | `{}` |  |
| service.annotations | object | `{}` |  |
| service.port | int | `8000` |  |
| service.type | string | `"ClusterIP"` |  |
| serviceAccount.annotations | object | `{}` |  |
| serviceAccount.automount | bool | `true` |  |
| serviceAccount.create | bool | `true` |  |
| serviceAccount.name | string | `""` |  |
| startupProbe.failureThreshold | int | `30` |  |
| startupProbe.httpGet.path | string | `"/"` |  |
| startupProbe.httpGet.port | string | `"http"` |  |
| startupProbe.initialDelaySeconds | int | `10` |  |
| startupProbe.periodSeconds | int | `10` |  |
| startupProbe.timeoutSeconds | int | `5` |  |
| strategy | object | `{}` | Deployment strategy (falls back to global.strategy) |
| tika | object | `{"affinity":{},"enabled":false,"image":{"pullPolicy":"IfNotPresent","registry":"","repository":"apache/tika","tag":"3.2.3.0"},"nodeSelector":{},"port":9998,"resources":{},"strategy":{},"tolerations":[]}` | Tika server for advanced document parsing |
| tika.image.registry | string | `""` | Registry (falls back to global.imageRegistry) |
| tika.strategy | object | `{}` | Strategy (falls back to global.strategy) |
| tolerations | list | `[]` |  |
| valkey | object | `{}` |  |
| volumeMounts | list | `[]` |  |
| volumes | list | `[]` |  |

----------------------------------------------
Autogenerated from chart metadata using [helm-docs v1.14.2](https://github.com/norwoodj/helm-docs/releases/v1.14.2)
