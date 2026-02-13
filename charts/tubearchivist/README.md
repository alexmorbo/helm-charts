
# tubearchivist

![Version: 0.1.0](https://img.shields.io/badge/Version-0.1.0-informational?style=flat-square) ![Type: application](https://img.shields.io/badge/Type-application-informational?style=flat-square) ![AppVersion: v0.5.9](https://img.shields.io/badge/AppVersion-v0.5.9-informational?style=flat-square)

[![Artifact Hub](https://img.shields.io/endpoint?url=https://artifacthub.io/badge/repository/tubearchivist)](https://artifacthub.io/packages/search?repo=tubearchivist)

A Helm chart for TubeArchivist - self-hosted YouTube media server

**Homepage:** <https://github.com/alexmorbo/helm-charts>

## Maintainers

| Name | Email | Url |
| ---- | ------ | --- |
| alexmorbo | <alex@morbo.ru> |  |

## Source Code

* <https://github.com/alexmorbo/helm-charts/tree/master/charts/tubearchivist>

## Requirements

Kubernetes: `>=1.23.0-0`

| Repository | Name | Version |
|------------|------|---------|
| https://valkey.io/valkey-helm/ | valkey | 0.9.3 |

## Install
```console
helm install tubearchivist oci://ghcr.io/alexmorbo/helm-charts/tubearchivist
```

## Values

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| affinity | object | `{}` |  |
| app.admin | object | `{"existingSecret":"","existingSecretPasswordKey":"password","existingSecretUsernameKey":"username","password":"","username":"admin"}` | Initial admin credentials (only used on first startup) |
| app.authMode | string | `"local"` | Authentication mode: local, ldap, forwardauth, ldap_local |
| app.disableStaticAuth | bool | `false` | Disable static file authentication (for reverse proxy setups) |
| app.djangoDebug | bool | `false` | Enable Django debug mode |
| app.elasticsearch | object | `{"affinity":{},"enabled":true,"existingSecret":"","existingSecretPasswordKey":"password","extraEnv":[],"image":{"pullPolicy":"IfNotPresent","registry":"","repository":"bbilly1/tubearchivist-es","tag":"8.19.0"},"javaOpts":"-Xms512m -Xmx512m","nodeSelector":{},"password":"","persistence":{"accessModes":["ReadWriteOnce"],"annotations":{},"enabled":true,"existingClaim":"","size":"30Gi","storageClass":""},"replicas":1,"resources":{},"tolerations":[]}` | Built-in Elasticsearch |
| app.elasticsearch.extraEnv | list | `[]` | Extra environment variables for Elasticsearch |
| app.elasticsearch.image.registry | string | `""` | Registry (falls back to global.imageRegistry, then to docker.io) |
| app.elasticsearch.javaOpts | string | `"-Xms512m -Xmx512m"` | Java heap options |
| app.elasticsearch.password | string | `""` | Elasticsearch password (auto-generated if empty) |
| app.elasticsearchExternal | object | `{"disableVerifySsl":false,"existingSecret":"","existingSecretPasswordKey":"password","password":"","url":"","username":"elastic"}` | External Elasticsearch (when app.elasticsearch.enabled=false) |
| app.elasticsearchExternal.disableVerifySsl | bool | `false` | Disable SSL certificate verification |
| app.forwardAuth | object | `{"enabled":false,"logoutUrl":"","usernameHeader":"HTTP_REMOTE_USER"}` | Forward auth (reverse proxy authentication) |
| app.host | string | `""` | Required: Server URL with protocol and port (e.g., http://tubearchivist.local:8000) |
| app.hostGid | int | `1000` | File ownership GID |
| app.hostUid | int | `1000` | File ownership UID |
| app.ldap | object | `{"attrMap":{"email":"mail","personalName":"givenName","surname":"sn","username":"uid"},"bindDn":"","bindPassword":"","disableCertCheck":false,"enabled":false,"existingSecret":"","existingSecretBindPasswordKey":"bind-password","promoteToStaff":"","promoteToSuperuser":"","serverUri":"","userBase":"","userFilter":"(objectClass=user)"}` | LDAP configuration |
| app.ldap.attrMap | object | `{"email":"mail","personalName":"givenName","surname":"sn","username":"uid"}` | Attribute mapping |
| app.ldap.disableCertCheck | bool | `false` | Disable certificate verification for LDAPS |
| app.ldap.promoteToStaff | string | `""` | Comma-separated usernames to promote to staff |
| app.ldap.promoteToSuperuser | string | `""` | Comma-separated usernames to promote to superuser |
| app.ldap.serverUri | string | `""` | LDAP server URI (ldap://server:389 or ldaps://server:636) |
| app.timezone | string | `"UTC"` | Timezone (e.g., Europe/Moscow, UTC) |
| app.valkey | object | `{"enabled":true,"prefix":""}` | Built-in Valkey (Redis-compatible) |
| app.valkey.prefix | string | `""` | Prefix for Redis keys |
| app.valkeyExternal | object | `{"existingSecret":"","existingSecretKey":"url","url":""}` | External Redis/Valkey (when app.valkey.enabled=false) |
| app.ytdlpAutoUpdate | string | `""` | yt-dlp auto-update: "" (disabled), "release", or "nightly" |
| extraEnv | list | `[]` | Environment variables to add to the pods |
| extraEnvFrom | list | `[]` | Environment variables from secrets or configmaps to add to the pods |
| fullnameOverride | string | `""` |  |
| global.affinity | object | `{}` |  |
| global.imageRegistry | string | `""` | Global image registry (used as fallback for all components) |
| global.nodeSelector | object | `{}` | Global scheduling parameters (used as fallback for all components) |
| global.strategy | object | `{"type":"Recreate"}` | Global deployment strategy (used as fallback for all components) |
| global.tolerations | list | `[]` |  |
| image.pullPolicy | string | `"IfNotPresent"` |  |
| image.registry | string | `""` | Image registry (falls back to global.imageRegistry, then to docker.io) |
| image.repository | string | `"bbilly1/tubearchivist"` |  |
| image.tag | string | `""` | Overrides the image tag whose default is the chart appVersion. |
| imagePullSecrets | list | `[]` |  |
| ingress.annotations | object | `{}` |  |
| ingress.enabled | bool | `false` |  |
| ingress.hosts[0].host | string | `"tubearchivist.local"` |  |
| ingress.hosts[0].paths[0].path | string | `"/"` |  |
| ingress.hosts[0].paths[0].pathType | string | `"Prefix"` |  |
| ingress.ingressClassName | string | `""` |  |
| ingress.tls | list | `[]` |  |
| livenessProbe.httpGet.httpHeaders[0].name | string | `"Host"` |  |
| livenessProbe.httpGet.httpHeaders[0].value | string | `"localhost"` |  |
| livenessProbe.httpGet.path | string | `"/api/health/"` |  |
| livenessProbe.httpGet.port | string | `"http"` |  |
| livenessProbe.periodSeconds | int | `120` |  |
| livenessProbe.timeoutSeconds | int | `10` |  |
| monitoring.enabled | bool | `false` |  |
| monitoring.interval | string | `"60s"` |  |
| monitoring.labels | object | `{}` |  |
| monitoring.namespace | string | `""` |  |
| monitoring.path | string | `"/api/health/"` |  |
| monitoring.scrapeTimeout | string | `"10s"` |  |
| monitoring.type | string | `"ServiceMonitor"` | Type of service monitor: ServiceMonitor (Prometheus) or VMServiceScrape (VictoriaMetrics) |
| nameOverride | string | `""` |  |
| nodeSelector | object | `{}` |  |
| persistence.cache | object | `{"accessModes":["ReadWriteOnce"],"annotations":{},"enabled":true,"existingClaim":"","size":"10Gi","storageClass":""}` | Cache storage for thumbnails and temporary files |
| persistence.media | object | `{"accessModes":["ReadWriteOnce"],"annotations":{},"enabled":true,"existingClaim":"","size":"100Gi","storageClass":""}` | Media storage for downloaded videos NOTE: Set enabled=false if using NFS via volumes/volumeMounts |
| podAnnotations | object | `{}` |  |
| podLabels | object | `{}` |  |
| podSecurityContext.fsGroup | int | `1000` |  |
| podSecurityContext.fsGroupChangePolicy | string | `"OnRootMismatch"` |  |
| readinessProbe.httpGet.httpHeaders[0].name | string | `"Host"` |  |
| readinessProbe.httpGet.httpHeaders[0].value | string | `"localhost"` |  |
| readinessProbe.httpGet.path | string | `"/api/health/"` |  |
| readinessProbe.httpGet.port | string | `"http"` |  |
| readinessProbe.periodSeconds | int | `30` |  |
| readinessProbe.timeoutSeconds | int | `10` |  |
| resources | object | `{}` |  |
| route | object | `{"annotations":{},"enabled":false,"hostnames":["tubearchivist.local"],"labels":{},"parentRefs":[{"name":"gateway","namespace":"gateway-system"}]}` | Gateway API HTTPRoute |
| securityContext | object | `{}` |  |
| service.annotations | object | `{}` |  |
| service.port | int | `8000` |  |
| service.type | string | `"ClusterIP"` |  |
| serviceAccount.annotations | object | `{}` |  |
| serviceAccount.automount | bool | `true` |  |
| serviceAccount.create | bool | `true` |  |
| serviceAccount.name | string | `""` |  |
| startupProbe.failureThreshold | int | `30` |  |
| startupProbe.httpGet.httpHeaders[0].name | string | `"Host"` |  |
| startupProbe.httpGet.httpHeaders[0].value | string | `"localhost"` |  |
| startupProbe.httpGet.path | string | `"/api/health/"` |  |
| startupProbe.httpGet.port | string | `"http"` |  |
| startupProbe.initialDelaySeconds | int | `30` |  |
| startupProbe.periodSeconds | int | `10` |  |
| strategy | object | `{}` | Deployment strategy (falls back to global.strategy) |
| tolerations | list | `[]` |  |
| valkey.architecture | string | `"standalone"` |  |
| valkey.auth.enabled | bool | `false` |  |
| valkey.enabled | bool | `true` |  |
| valkey.primary.persistence.enabled | bool | `true` |  |
| valkey.primary.persistence.size | string | `"1Gi"` |  |
| volumeMounts | list | `[]` | Additional volume mounts Example NFS mount for media (use instead of persistence.media): volumeMounts:   - name: media     mountPath: /youtube |
| volumes | list | `[]` | Additional volumes (e.g., NFS for media storage) Example NFS volume for media: volumes:   - name: media     nfs:       server: "nas.example.com"       path: "/volume1/youtube"       readOnly: false |
