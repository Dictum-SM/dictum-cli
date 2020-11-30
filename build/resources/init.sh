#!/bin/bash
# This script simpily populates a target workspace with a prescriptive
# directory structure and README's to aid users when getting started wit DSM.

mkdir -p ${WORKSPACE}/{.state,ansible/{roles,playbooks},kubernetes,terraform,utilities/{scripts,secrets}}
cp -n ${TMPDIR}/state-ns.yaml ${WORKSPACE}/.state/.state-ns
cp -n ${TMPDIR}/state.yaml ${WORKSPACE}/.state/.state
cp -n ${TMPDIR}/docs/ansible-README.md ${WORKSPACE}/ansible/README.md
cp -n ${TMPDIR}/docs/kubernetes-README.md ${WORKSPACE}/kubernetes/README.md
cp -n ${TMPDIR}/docs/terraform-README.md ${WORKSPACE}/terraform/README.md
cp -n ${TMPDIR}/docs/utils-README.md ${WORKSPACE}/utilities/README.md
