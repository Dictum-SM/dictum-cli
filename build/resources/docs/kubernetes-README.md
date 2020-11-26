# Kubernetes

DSM can currently manage kubernetes resources with the following executors:
- kubectl (-k/-f)
- kustomize build
- helm

# Helm

DSM can manage helm resources with a few caveats (Some of these limitations will be going away in subsequent DSM releases):

1. DSM natively only supports local charts
2. You must change the default namespace of the current user's kube context to the target namespace of the helm install prior to appling helm resources. This can be done by using the DSM bash executor prior to each helm execution.

3. When using variable resource paths, you'll have to set your vars file per variable resource location (dev/stage/prod) and then recreate the chart with symlinks (only excluding the vars.yaml). There are probably better ways to do this, but DSM doesnt allow for much cusomization when executing helm commands.
