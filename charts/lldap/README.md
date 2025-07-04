
# lldap

![Version: 1.0.7](https://img.shields.io/badge/Version-1.0.7-informational?style=flat-square) ![Type: application](https://img.shields.io/badge/Type-application-informational?style=flat-square) ![AppVersion: 0.6.1](https://img.shields.io/badge/AppVersion-0.6.1-informational?style=flat-square)

LLDAP helm chart for Kubernetes

[![Artifact Hub](https://img.shields.io/endpoint?url=https://artifacthub.io/badge/repository/lldap)](https://artifacthub.io/packages/search?repo=lldap)

**Homepage:** <https://github.com/alexmorbo/helm-charts>

## Maintainers

| Name | Email | Url |
| ---- | ------ | --- |
| AlexMorbo | <alex@morbo.ru> |  |

## Source Code

* <https://github.com/alexmorbo/helm-charts/tree/master/charts/lldap>

## Requirements

Kubernetes: `>=1.23.0-0`

## Install
```console
helm install lldap oci://ghcr.io/alexmorbo/helm-charts/lldap
```

## Values

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| affinity | object | `{}` |  |
| env.GID | string | `"1000"` |  |
| env.TZ | string | `"UTC"` |  |
| env.UID | string | `"1000"` |  |
| extraEnv | list | `[]` | Environment variables to add to the lldap pods |
| extraEnvFrom | list | `[]` | Environment variables from secrets or configmaps to add to the lldap pods |
| extraInitContainers | list | `[]` |  |
| fullnameOverride | string | `""` |  |
| image.pullPolicy | string | `"IfNotPresent"` |  |
| image.registry | string | `"ghcr.io"` |  |
| image.repository | string | `"lldap/lldap"` |  |
| image.sha | string | `""` |  |
| image.tag | string | `"2025-05-19-alpine"` | Overrides the image tag whose default is the chart appVersion. |
| imagePullSecrets | list | `[]` |  |
| ingress.annotations | object | `{}` |  |
| ingress.enabled | bool | `false` |  |
| ingress.hosts[0].host | string | `"chart-example.local"` |  |
| ingress.hosts[0].paths[0].path | string | `"/"` |  |
| ingress.hosts[0].paths[0].pathType | string | `"ImplementationSpecific"` |  |
| ingress.ingressClassName | string | `""` |  |
| ingress.tls | list | `[]` |  |
| nameOverride | string | `""` |  |
| nodeSelector | object | `{}` |  |
| persistence.accessModes | list | `["ReadWriteOnce"]` | Access modes of persistent disk |
| persistence.annotations | object | `{}` | Annotations for PVCs |
| persistence.enabled | bool | `true` |  |
| persistence.size | string | `"100Mi"` | Size of persistent disk |
| persistence.storageClass | string | `""` |  |
| persistence.volumeName | string | `""` | Name of the permanent volume to reference in the claim. Can be used to bind to existing volumes. |
| podAnnotations | object | `{}` |  |
| podSecurityContext.fsGroup | int | `1000` |  |
| podSecurityContext.fsGroupChangePolicy | string | `"OnRootMismatch"` |  |
| replicaCount | int | `1` |  |
| resources | object | `{}` |  |
| secret.annotations | object | `{}` |  |
| secret.create | bool | `true` |  |
| secret.lldapBaseDn | string | `"dc=homelab,dc=local"` |  |
| secret.lldapJwtSecret | string | `"wobY6RK/Dc0vL21zFiIZs9iyVy0NQ3ldijYPQ4HLWTc="` |  |
| secret.lldapUserPass | string | `"admiistrator123456"` |  |
| securityContext.allowPrivilegeEscalation | bool | `false` |  |
| securityContext.capabilities.drop[0] | string | `"ALL"` |  |
| securityContext.privileged | bool | `false` |  |
| securityContext.readOnlyRootFilesystem | bool | `true` |  |
| securityContext.runAsGroup | int | `1000` |  |
| securityContext.runAsNonRoot | bool | `true` |  |
| securityContext.runAsUser | int | `1000` |  |
| securityContext.seccompProfile.type | string | `"RuntimeDefault"` |  |
| service.annotations | object | `{}` |  |
| service.http_port | int | `17170` |  |
| service.ldap_port | int | `3890` |  |
| service.ldaps_enabled | bool | `false` |  |
| service.ldaps_port | int | `6360` |  |
| service.type | string | `"ClusterIP"` |  |
| serviceAccount.annotations | object | `{}` | Annotations to add to the service account |
| serviceAccount.automount | bool | `true` | Automatically mount a ServiceAccount's API credentials? |
| serviceAccount.create | bool | `true` | Specifies whether a service account should be created |
| serviceAccount.name | string | `""` | If not set and create is true, a name is generated using the fullname template |
| tolerations | list | `[]` |  |
| updateStrategy | object | `{"type":"RollingUpdate"}` | Deployment strategy |
