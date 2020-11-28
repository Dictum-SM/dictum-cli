#!/bin/bash
# This script simpily populates a target workspace with a prescriptive
# directory structure and README's to aid users when getting started wit DSM.

mkdir -p ${DIR}/{.state,ansible/{roles,playbooks},kubernetes,terraform,utilities/{scripts/secrets}}
cp -n ${TMPDIR}/state-ns.yaml ${DIR}/.state/.state-ns.yaml
cp -n ${TMPDIR}/state.yaml ${DIR}/.state/.state
cp -n ${TMPDIR}/docs/ansible-README.md ${DIR}/ansible/README.md
cp -n ${TMPDIR}/docs/kubernetes-README.md ${DIR}/kubernetes/README.md
cp -n ${TMPDIR}/docs/terraform-README.md ${DIR}/terraform/README.md
cp -n ${TMPDIR}/docs/utils-README.md ${DIR}/utilities/README.md
