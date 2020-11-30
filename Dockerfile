#################################################################################
## ContainerOne | Point of Origin for Deploy & Development 
FROM quay.io/cloudctl/konductor:latest

WORKDIR /root/dictum-cli
USER root

#################################################################################
## Set static environment variables
ARG dictum_version="v0.0.0.2"
ARG kubectl_version="v1.19.4"

#ARG dictum_version=${dictum_version}
#ARG kubectl_version=${kubectl_version}

ENV dictum_version=${dictum_version}
ENV kubectl_version=${kubectl_version}

ARG EKS_VPC_FILES="https://raw.githubusercontent.com/Dictum-SM/demo/main/terraform/eks-vpc/files.txt"
ARG URL_IAM_AUTHENTICATOR="https://amazon-eks.s3.us-west-2.amazonaws.com/1.18.9/2020-11-02/bin/linux/amd64/aws-iam-authenticator"
ARG URL_KUBECTL="https://storage.googleapis.com/kubernetes-release/release/${kubectl_version}/bin/linux/amd64/kubectl"
ENV PATH="/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/root/platform/bin"
ARG RPM_LIST="\
              tar \
              wget \
             "


#################################################################################
## Load local artifacts
COPY ./dictum-cli /usr/bin/dictum-cli

#################################################################################
## Run build
RUN set -ex \
      && dnf install -y --allowerasing --nobest                                 \
             ${RPM_LIST}                                                        \
      && dnf clean all                                                          \
      && curl -o /usr/bin/kubectl                                               \
              -L ${URL_KUBECTL}                                                 \
      && curl -o /usr/bin/aws-iam-authenticator                                 \
              -L ${URL_IAM_AUTHENTICATOR}                                       \
      && mkdir -p {terraform/eks-vpc,kubernetes/{metrics-server,dashboard}}     \
      && rm -rf                                                                 \
              /var/cache                                                        \
              /var/log/dnf*                                                     \
              /var/log/yum.*                                                    \
      && wget -P terraform/eks-vpc/ -i ${EKS_VPC_FILES}                         \
      && chmod +x                                                               \
              /usr/bin/kubectl                                                  \
              /usr/bin/dictum-cli                                               \
              /usr/bin/aws-iam-authenticator                                    \
      && kubectl version --client                                               \
      && echo

#################################################################################
ENTRYPOINT ["/bin/entrypoint"]
USER root
