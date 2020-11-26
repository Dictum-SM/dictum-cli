#!/bin/bash

mkdir ${DIR}/{ .state,ansible/{roles,playbooks},kubernetes,terraform,utilities/{scripts/secrets}}
cp ${TEMPDIR}/state-ns.yaml ${DIR}/.state/
cp ${TEMPDIR}/state.yaml ${DIR}/.state/
cp ${TEMPDIR}/docs/ansible-README.md ${DIR}/ansible/README.md
cp ${TEMPDIR}/docs/kubernetes-README.md ${DIR}/kubernetes/README.md
cp ${TEMPDIR}/docs/terraform-README.md ${DIR}/terraform/README.md
cp ${TEMPDIR}/docs/utils-README.md ${DIR}/utilities/README.md
