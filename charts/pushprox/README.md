
# pushprox

![Version: 1.0.0](https://img.shields.io/badge/Version-1.0.0-informational?style=flat-square) ![Type: application](https://img.shields.io/badge/Type-application-informational?style=flat-square) ![AppVersion: 0.2.0](https://img.shields.io/badge/AppVersion-0.2.0-informational?style=flat-square)

PushProx helm chart for Kubernetes

[![Artifact Hub](https://img.shields.io/endpoint?url=https://artifacthub.io/badge/repository/pushprox)](https://artifacthub.io/packages/search?repo=pushprox)

**Homepage:** <https://github.com/alexmorbo/helm-charts>

## Maintainers

| Name | Email | Url |
| ---- | ------ | --- |
| AlexMorbo | <alex@morbo.ru> |  |

## Source Code

* <https://github.com/alexmorbo/helm-charts/tree/master/charts/pushprox>

## Requirements

Kubernetes: `>=1.23.0-0`

## Install
```console
helm install pushprox oci://ghcr.io/alexmorbo/helm-charts/pushprox
```

## Values

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| fullnameOverride | string | `""` | If this is set, release name will be used as the chart name |
| ingress | object | `{"annotations":{},"enabled":false,"hosts":[{"host":"chart-example.local","paths":[{"path":"/","pathType":"ImplementationSpecific"}]}],"ingressClassName":"","tls":[]}` | https://kubernetes.io/docs/concepts/services-networking/ingress |
| ingress.annotations | object | `{}` | Annotations |
| ingress.enabled | bool | `false` | If true, an ingress will be created |
| ingress.hosts | list | `[{"host":"chart-example.local","paths":[{"path":"/","pathType":"ImplementationSpecific"}]}]` | Hosts |
| ingress.ingressClassName | string | `""` | Ingress class |
| ingress.tls | list | `[]` | TLS |
| nameOverride | string | `""` |  |
| proxy.affinity | object | `{}` | https://kubernetes.io/docs/concepts/scheduling-eviction/assign-pod-node |
| proxy.command[0] | string | `"/app/pushprox-proxy"` |  |
| proxy.enabled | bool | `true` |  |
| proxy.env | object | `{}` | https://kubernetes.io/docs/tasks/inject-data-application/define-environment-variable-container |
| proxy.extraEnv | list | `[]` | https://kubernetes.io/docs/tasks/inject-data-application/define-environment-variable-container |
| proxy.extraEnvFrom | list | `[]` | https://kubernetes.io/docs/tasks/inject-data-application/define-environment-variable-container |
| proxy.extraInitContainers | list | `[]` | https://kubernetes.io/docs/concepts/workloads/pods/init-containers |
| proxy.extraVolumeMounts | list | `[]` | https://kubernetes.io/docs/concepts/storage/volumes |
| proxy.extraVolumes | list | `[]` | https://kubernetes.io/docs/concepts/storage/volumes |
| proxy.image | object | `{"pullPolicy":"IfNotPresent","registry":"docker.io","repository":"prometheuscommunity/pushprox","sha":"","tag":""}` | Image |
| proxy.image.tag | string | `""` | Overrides the image tag whose default is the chart appVersion. |
| proxy.imagePullSecrets | list | `[]` | https://kubernetes.io/docs/concepts/containers/images/#specifying-imagepullsecrets-on-a-pod |
| proxy.livenessProbe | object | `{}` | https://kubernetes.io/docs/concepts/workloads/pods/pod-lifecycle |
| proxy.nodeSelector | object | `{}` | https://kubernetes.io/docs/concepts/scheduling-eviction/assign-pod-node |
| proxy.podAnnotations | object | `{}` | https://kubernetes.io/docs/concepts/overview/working-with-objects/annotations |
| proxy.podLabels | object | `{}` | https://kubernetes.io/docs/concepts/overview/working-with-objects/labels |
| proxy.podSecurityContext | object | `{"fsGroup":1000,"fsGroupChangePolicy":"OnRootMismatch"}` | https://kubernetes.io/docs/tasks/configure-pod-container/security-context/ |
| proxy.readinessProbe | object | `{}` | https://kubernetes.io/docs/concepts/workloads/pods/pod-lifecycle |
| proxy.replicaCount | int | `1` | https://kubernetes.io/docs/concepts/workloads/controllers/replicationcontroller/ |
| proxy.resources | object | `{}` | https://kubernetes.io/docs/concepts/configuration/manage-resources-containers |
| proxy.securityContext | object | `{"allowPrivilegeEscalation":false,"capabilities":{"drop":["ALL"]},"privileged":false,"readOnlyRootFilesystem":false,"runAsGroup":1000,"runAsNonRoot":true,"runAsUser":1000,"seccompProfile":{"type":"RuntimeDefault"}}` | https://kubernetes.io/docs/tasks/configure-pod-container/security-context/ |
| proxy.service | object | `{"annotations":{},"containerPort":8080,"port":8080,"type":"ClusterIP"}` | https://kubernetes.io/docs/concepts/services-networking/service |
| proxy.service.annotations | object | `{}` | Annotations |
| proxy.tolerations | list | `[]` | https://kubernetes.io/docs/concepts/scheduling-eviction/taint-and-toleration |
| proxy.updateStrategy | object | `{"type":"RollingUpdate"}` | Deployment strategy |
| serviceAccount | object | `{"annotations":{},"automount":true,"create":true,"name":""}` | https://kubernetes.io/docs/tasks/configure-pod-container/configure-service-account |
| serviceAccount.annotations | object | `{}` | Annotations to add to the service account |
| serviceAccount.automount | bool | `true` | Automatically mount a ServiceAccount's API credentials? |
| serviceAccount.create | bool | `true` | Specifies whether a service account should be created |
| serviceAccount.name | string | `""` | If not set and create is true, a name is generated using the fullname template |
