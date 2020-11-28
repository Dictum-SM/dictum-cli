#!/bin/bash
# This script simpily populates a target workspace with a prescriptive
# directory structure and README's to aid users when getting started wit DSM.

mkdir -p ${DIR}/{ .state,ansible/{roles,playbooks},kubernetes,terraform,utilities/{scripts/secrets}}
cp -n ${TEMPDIR}/state-ns.yaml ${DIR}/.state/.state-ns.yaml
cp -n ${TEMPDIR}/state.yaml ${DIR}/.state/.state
cp -n ${TEMPDIR}/docs/ansible-README.md ${DIR}/ansible/README.md
cp -n ${TEMPDIR}/docs/kubernetes-README.md ${DIR}/kubernetes/README.md
cp -n ${TEMPDIR}/docs/terraform-README.md ${DIR}/terraform/README.md
cp -n ${TEMPDIR}/docs/utils-README.md ${DIR}/utilities/README.md
