
# immich

![Version: 0.1.1](https://img.shields.io/badge/Version-0.1.1-informational?style=flat-square) ![Type: application](https://img.shields.io/badge/Type-application-informational?style=flat-square) ![AppVersion: v3.1.0](https://img.shields.io/badge/AppVersion-v3.1.0-informational?style=flat-square)

[![Artifact Hub](https://img.shields.io/endpoint?url=https://artifacthub.io/badge/repository/immich)](https://artifacthub.io/packages/search?repo=immich)

Immich helm chart for Kubernetes - self-hosted photo and video backup solution

**Homepage:** <https://github.com/alexmorbo/helm-charts>

## Maintainers

| Name | Email | Url |
| ---- | ------ | --- |
| AlexMorbo | <alex@morbo.ru> |  |

## Source Code

* <https://github.com/alexmorbo/helm-charts/tree/master/charts/immich>

## Requirements

Kubernetes: `>=1.23.0-0`

| Repository | Name | Version |
|------------|------|---------|
| https://valkey.io/valkey-helm/ | valkey | 0.x.x |

## Install
```console
helm install immich oci://ghcr.io/alexmorbo/helm-charts/immich
```

## Values

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| affinity | object | `{}` |  |
| app.database | object | `{"existingSecret":"","host":"","name":"immich","password":"","port":5432,"secretKeys":{"database":"database","host":"host","password":"password","port":"port","username":"username"},"username":"immich","vectorExtension":""}` | Database configuration. PostgreSQL with the vector extension is required and is expected to be provisioned outside of this chart. |
| app.database.existingSecret | string | `""` | Existing secret holding the connection details. When set, every DB_* variable is read from it and no secret is created by this chart. |
| app.database.host | string | `""` | Plain values, used only when existingSecret is empty. The chart then renders them into its own secret. |
| app.database.vectorExtension | string | `""` | Vector extension to use, e.g. vectorchord or pgvector. Left empty the server keeps its own default. |
| app.redis | object | `{"dbIndex":"","existingSecret":"","existingSecretKey":"password","host":"","password":"","port":6379}` | Redis / Valkey configuration. When the bundled valkey subchart is enabled the host is resolved automatically. |
| app.redis.dbIndex | string | `""` | Redis database index |
| app.redis.password | string | `""` | Password, used only when existingSecret is empty |
| app.timeZone | string | `""` | Timezone (e.g., Europe/Moscow, UTC) |
| enableServiceLinks | bool | `false` | Inject the legacy docker-link environment variables of every Service in the namespace into the server pod. MUST stay false: the server Service is named after the release, so Kubernetes injects IMMICH_PORT=tcp://<clusterIP>:2283 - and immich reads IMMICH_PORT as its own listen port, which makes the container crash on startup with "[IMMICH_PORT] Invalid input: expected number, received NaN". The chart also sets IMMICH_PORT explicitly, which shadows the injected value, but there is no reason to turn this on. |
| extraEnv | list | `[]` | Environment variables to add to the pods |
| extraEnvFrom | list | `[]` | Environment variables from secrets or configmaps to add to the pods |
| extraInitContainers | list | `[]` | Additional init containers |
| fullnameOverride | string | `""` |  |
| global.imageRegistry | string | `""` | Global image registry (used as fallback for all components) |
| global.strategy | object | `{"type":"Recreate"}` | Global deployment strategy (used as fallback for all components). Recreate is the default on purpose: the library lives on ReadWriteOnce block storage and a RollingUpdate would deadlock on the volume attachment. |
| hwaccel | object | `{"enabled":false,"hostPath":"/dev/dri","mountPath":"/dev/dri","privileged":true}` | Hardware accelerated transcoding for the server container. Exposes the render devices of the node into the container. |
| hwaccel.hostPath | string | `"/dev/dri"` | Host path of the DRI render devices |
| hwaccel.mountPath | string | `"/dev/dri"` | Mount path inside the container |
| hwaccel.privileged | bool | `true` | Run the container privileged (usually required to access /dev/dri) |
| image.pullPolicy | string | `"IfNotPresent"` |  |
| image.registry | string | `""` | Image registry (falls back to global.imageRegistry, then to ghcr.io) |
| image.repository | string | `"immich-app/immich-server"` |  |
| image.tag | string | `""` | Overrides the image tag whose default is the chart appVersion. |
| imagePullSecrets | list | `[]` |  |
| ingress.annotations | object | `{}` |  |
| ingress.enabled | bool | `false` |  |
| ingress.hosts[0].host | string | `"immich.local"` |  |
| ingress.hosts[0].paths[0].path | string | `"/"` |  |
| ingress.hosts[0].paths[0].pathType | string | `"Prefix"` |  |
| ingress.ingressClassName | string | `""` |  |
| ingress.tls | list | `[]` |  |
| livenessProbe.failureThreshold | int | `3` |  |
| livenessProbe.httpGet.path | string | `"/api/server/ping"` |  |
| livenessProbe.httpGet.port | string | `"http"` |  |
| livenessProbe.periodSeconds | int | `10` |  |
| livenessProbe.timeoutSeconds | int | `5` |  |
| machineLearning.affinity | object | `{}` |  |
| machineLearning.enableServiceLinks | bool | `false` | Same as the top level enableServiceLinks, for the machine learning pod. MUST stay false: the injected IMMICH_PORT=tcp://<clusterIP>:2283 of the server Service is read by immich_ml as its own listen port and crashes the container with a pydantic int_parsing ValidationError. |
| machineLearning.enabled | bool | `true` |  |
| machineLearning.extraEnv | list | `[]` | Environment variables to add to the machine learning pod |
| machineLearning.extraEnvFrom | list | `[]` | Environment variables from secrets or configmaps |
| machineLearning.hwaccel | object | `{"enabled":false,"hostPath":"/dev/dri","mountPath":"/dev/dri","privileged":false}` | Hardware acceleration for the machine learning container (required by the OpenVINO image flavour) |
| machineLearning.image.pullPolicy | string | `"IfNotPresent"` |  |
| machineLearning.image.registry | string | `""` | Registry (falls back to global.imageRegistry, then to ghcr.io) |
| machineLearning.image.repository | string | `"immich-app/immich-machine-learning"` |  |
| machineLearning.image.tag | string | `""` | Overrides the image tag whose default is the chart appVersion. Use a hardware flavour suffix to switch backends, e.g. "v3.1.0-openvino". |
| machineLearning.livenessProbe.failureThreshold | int | `3` |  |
| machineLearning.livenessProbe.httpGet.path | string | `"/ping"` |  |
| machineLearning.livenessProbe.httpGet.port | string | `"http"` |  |
| machineLearning.livenessProbe.periodSeconds | int | `30` |  |
| machineLearning.livenessProbe.timeoutSeconds | int | `5` |  |
| machineLearning.nodeSelector | object | `{}` |  |
| machineLearning.podAnnotations | object | `{}` |  |
| machineLearning.podLabels | object | `{}` |  |
| machineLearning.podSecurityContext | object | `{}` |  |
| machineLearning.readinessProbe.failureThreshold | int | `3` |  |
| machineLearning.readinessProbe.httpGet.path | string | `"/ping"` |  |
| machineLearning.readinessProbe.httpGet.port | string | `"http"` |  |
| machineLearning.readinessProbe.periodSeconds | int | `10` |  |
| machineLearning.readinessProbe.timeoutSeconds | int | `5` |  |
| machineLearning.resources | object | `{}` |  |
| machineLearning.securityContext | object | `{}` |  |
| machineLearning.service.annotations | object | `{}` |  |
| machineLearning.service.labels | object | `{}` |  |
| machineLearning.service.port | int | `3003` |  |
| machineLearning.service.type | string | `"ClusterIP"` |  |
| machineLearning.startupProbe | object | `{"failureThreshold":60,"httpGet":{"path":"/ping","port":"http"},"initialDelaySeconds":10,"periodSeconds":10,"timeoutSeconds":5}` | Startup probe. The first start downloads the ML models, the defaults therefore allow ~610s before the container is restarted. |
| machineLearning.strategy | object | `{}` | Strategy (falls back to global.strategy) |
| machineLearning.tolerations | list | `[]` |  |
| machineLearning.volumeMounts | list | `[]` |  |
| machineLearning.volumes | list | `[]` |  |
| monitoring.enabled | bool | `false` |  |
| monitoring.interval | string | `"30s"` |  |
| monitoring.labels | object | `{}` |  |
| monitoring.namespace | string | `""` |  |
| monitoring.path | string | `"/metrics"` |  |
| monitoring.port | int | `8081` | Metrics port exposed by the server once telemetry is enabled |
| monitoring.scrapeTimeout | string | `"10s"` |  |
| monitoring.telemetryInclude | string | `"all"` | Value of IMMICH_TELEMETRY_INCLUDE (all, host, api, io, repo, job) |
| monitoring.type | string | `"ServiceMonitor"` | Type of service monitor: ServiceMonitor (Prometheus) or VMServiceScrape (VictoriaMetrics) |
| nameOverride | string | `""` |  |
| nodeSelector | object | `{}` |  |
| persistence.cache | object | `{"accessModes":["ReadWriteOnce"],"annotations":{},"enabled":true,"existingClaim":"","mountPath":"/cache","size":"10Gi","storageClass":""}` | Machine learning model cache. Created by this chart. |
| persistence.cache.annotations | object | `{}` | Annotations for the cache PVC, e.g. helm.sh/resource-policy: keep |
| persistence.library | object | `{"enabled":true,"existingClaim":"","mountPath":"/data","subPath":""}` | Immich library (originals, thumbnails, encoded video, profile). This chart never creates or deletes this PVC: it holds the photo archive and is owned by the platform (e.g. Terraform with prevent_destroy). |
| persistence.library.existingClaim | string | `""` | Name of the pre-existing PVC to mount. Required when enabled. |
| podAnnotations | object | `{}` |  |
| podLabels | object | `{}` |  |
| podSecurityContext | object | `{}` |  |
| readinessProbe.failureThreshold | int | `3` |  |
| readinessProbe.httpGet.path | string | `"/api/server/ping"` |  |
| readinessProbe.httpGet.port | string | `"http"` |  |
| readinessProbe.periodSeconds | int | `10` |  |
| readinessProbe.timeoutSeconds | int | `5` |  |
| resources | object | `{}` |  |
| securityContext | object | `{}` |  |
| service.annotations | object | `{}` |  |
| service.labels | object | `{}` |  |
| service.port | int | `2283` |  |
| service.type | string | `"ClusterIP"` |  |
| serviceAccount.annotations | object | `{}` |  |
| serviceAccount.automount | bool | `true` |  |
| serviceAccount.create | bool | `true` |  |
| serviceAccount.name | string | `""` |  |
| startupProbe | object | `{"failureThreshold":30,"httpGet":{"path":"/api/server/ping","port":"http"},"initialDelaySeconds":10,"periodSeconds":10,"timeoutSeconds":5}` | Startup probe. The first start runs the database schema migrations, the defaults therefore allow ~310s before the container is restarted. |
| strategy | object | `{}` | Deployment strategy (falls back to global.strategy) |
| tolerations | list | `[]` |  |
| valkey.affinity | object | `{}` |  |
| valkey.dataStorage.enabled | bool | `false` |  |
| valkey.enabled | bool | `true` |  |
| valkey.nodeSelector | object | `{}` |  |
| valkey.tolerations | list | `[]` |  |
| volumeMounts | list | `[]` |  |
| volumes | list | `[]` |  |
