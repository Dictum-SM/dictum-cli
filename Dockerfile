#################################################################################
## ContainerOne | Point of Origin for Deploy & Development 
FROM quay.io/cloudctl/konductor:latest

WORKDIR /root/dictum-cli
USER root

#################################################################################
## Set static environment variables
ARG dictum_version=${dictum_version}
ARG EKS_VPC_FILES="https://raw.githubusercontent.com/Dictum-SM/demo/main/terraform/eks-vpc/files.txt"
ARG URL_IAM_AUTHENTICATOR="https://amazon-eks.s3.us-west-2.amazonaws.com/1.18.9/2020-11-02/bin/linux/amd64/aws-iam-authenticator"

ARG RPM_LIST="\
              tar \
              wget \
             "

ENV dictum_version=${dictum_version}
ENV PATH="/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/root/platform/bin"

#################################################################################
## Load local artifacts
COPY ./dictum-cli /usr/bin/dictum-cli

#################################################################################
## Run build
RUN set -ex \
      && dnf install -y --allowerasing --nobest                                 \
             ${RPM_LIST}                                                        \
      && dnf clean all                                                          \
      && curl -o /usr/bin/aws-iam-authenticator                                 \
              -L ${URL_IAM_AUTHENTICATOR}                                       \
      && mkdir -p {terraform/eks-vpc,kubernetes/{metrics-server,dashboard}}     \
      && rm -rf                                                                 \
              /var/cache                                                        \
              /var/log/dnf*                                                     \
              /var/log/yum.*                                                    \
      && wget -P terraform/eks-vpc/ -i ${EKS_VPC_FILES}                         \
      && chmod +x                                                               \
              /usr/bin/dictum-cli                                               \
              /usr/bin/aws-iam-authenticator                                    \
      && echo

#################################################################################
ENTRYPOINT ["/bin/entrypoint"]
USER root
