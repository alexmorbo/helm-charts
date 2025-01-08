
# esphome

![Version: 1.0.0](https://img.shields.io/badge/Version-1.0.0-informational?style=flat-square) ![Type: application](https://img.shields.io/badge/Type-application-informational?style=flat-square) ![AppVersion: 2024.12.2](https://img.shields.io/badge/AppVersion-2024.12.2-informational?style=flat-square)

Esphome helm chart for Kubernetes

[![Artifact Hub](https://img.shields.io/endpoint?url=https://artifacthub.io/badge/repository/esphome)](https://artifacthub.io/packages/search?repo=esphome)

**Homepage:** <https://github.com/alexmorbo/helm-charts>

## Maintainers

| Name | Email | Url |
| ---- | ------ | --- |
| AlexMorbo | <alex@morbo.ru> |  |

## Source Code

* <https://github.com/alexmorbo/helm-charts/tree/master/charts/esphome>

## Requirements

Kubernetes: `>=1.23.0-0`

## Install
```console
helm install esphome oci://ghcr.io/alexmorbo/helm-charts/esphome
```

## Values

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| affinity | object | `{}` | https://kubernetes.io/docs/concepts/scheduling-eviction/assign-pod-node |
| env | object | `{}` | https://kubernetes.io/docs/tasks/inject-data-application/define-environment-variable-container |
| extraEnv | list | `[]` | https://kubernetes.io/docs/tasks/inject-data-application/define-environment-variable-container |
| extraEnvFrom | list | `[]` | https://kubernetes.io/docs/tasks/inject-data-application/define-environment-variable-container |
| extraInitContainers | list | `[]` | https://kubernetes.io/docs/concepts/workloads/pods/init-containers |
| extraVolumeMounts | list | `[]` | https://kubernetes.io/docs/concepts/storage/volumes |
| extraVolumes | list | `[]` | https://kubernetes.io/docs/concepts/storage/volumes |
| fullnameOverride | string | `""` | If this is set, release name will be used as the chart name |
| image | object | `{"pullPolicy":"IfNotPresent","registry":"docker.io","repository":"esphome/esphome","sha":"","tag":""}` | Image |
| image.tag | string | `""` | Overrides the image tag whose default is the chart appVersion. |
| imagePullSecrets | list | `[]` | https://kubernetes.io/docs/concepts/containers/images/#specifying-imagepullsecrets-on-a-pod |
| ingress | object | `{"annotations":{},"enabled":false,"hosts":[{"host":"chart-example.local","paths":[{"path":"/","pathType":"ImplementationSpecific"}]}],"ingressClassName":"","tls":[]}` | https://kubernetes.io/docs/concepts/services-networking/ingress |
| ingress.annotations | object | `{}` | Annotations |
| ingress.enabled | bool | `false` | If true, an ingress will be created |
| ingress.hosts | list | `[{"host":"chart-example.local","paths":[{"path":"/","pathType":"ImplementationSpecific"}]}]` | Hosts |
| ingress.ingressClassName | string | `""` | Ingress class |
| ingress.tls | list | `[]` | TLS |
| livenessProbe | object | `{}` | https://kubernetes.io/docs/concepts/workloads/pods/pod-lifecycle |
| nameOverride | string | `""` | If this is set, release name will be used as the chart name |
| nodeSelector | object | `{}` | https://kubernetes.io/docs/concepts/scheduling-eviction/assign-pod-node |
| persistence | object | `{"config":{"accessModes":["ReadWriteOnce"],"annotations":{},"enabled":true,"name":"","size":"5Gi","storageClass":"","volumeName":""}}` | https://kubernetes.io/docs/concepts/storage/persistent-volumes |
| persistence.config.accessModes | list | `["ReadWriteOnce"]` | Access modes of persistent disk |
| persistence.config.annotations | object | `{}` | Annotations for PVCs |
| persistence.config.enabled | bool | `true` | Specifies whether a persistent volume should be created |
| persistence.config.name | string | `""` | PVC name |
| persistence.config.size | string | `"5Gi"` | Size of persistent disk |
| persistence.config.storageClass | string | `""` | Name of the storage class |
| persistence.config.volumeName | string | `""` | Name of the permanent volume to reference in the claim. Can be used to bind to existing volumes. |
| podAnnotations | object | `{}` | https://kubernetes.io/docs/concepts/overview/working-with-objects/annotations |
| podLabels | object | `{}` | https://kubernetes.io/docs/concepts/overview/working-with-objects/labels |
| podSecurityContext | object | `{"fsGroup":1000,"fsGroupChangePolicy":"OnRootMismatch"}` | https://kubernetes.io/docs/tasks/configure-pod-container/security-context/ |
| readinessProbe | object | `{}` | https://kubernetes.io/docs/concepts/workloads/pods/pod-lifecycle |
| replicaCount | int | `1` | https://kubernetes.io/docs/concepts/workloads/controllers/replicationcontroller/ |
| resources | object | `{}` | https://kubernetes.io/docs/concepts/configuration/manage-resources-containers |
| securityContext | object | `{"allowPrivilegeEscalation":false,"capabilities":{"drop":["ALL"]},"privileged":false,"readOnlyRootFilesystem":false,"runAsGroup":1000,"runAsNonRoot":true,"runAsUser":1000,"seccompProfile":{"type":"RuntimeDefault"}}` | https://kubernetes.io/docs/tasks/configure-pod-container/security-context/ |
| service | object | `{"annotations":{},"containerPort":6052,"port":6052,"type":"ClusterIP"}` | https://kubernetes.io/docs/concepts/services-networking/service |
| service.annotations | object | `{}` | Annotations |
| serviceAccount | object | `{"annotations":{},"automount":true,"create":true,"name":""}` | https://kubernetes.io/docs/tasks/configure-pod-container/configure-service-account |
| serviceAccount.annotations | object | `{}` | Annotations to add to the service account |
| serviceAccount.automount | bool | `true` | Automatically mount a ServiceAccount's API credentials? |
| serviceAccount.create | bool | `true` | Specifies whether a service account should be created |
| serviceAccount.name | string | `""` | If not set and create is true, a name is generated using the fullname template |
| tolerations | list | `[]` | https://kubernetes.io/docs/concepts/scheduling-eviction/taint-and-toleration |
| updateStrategy | object | `{"type":"RollingUpdate"}` | Deployment strategy |
