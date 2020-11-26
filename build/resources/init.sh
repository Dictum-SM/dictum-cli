#!/bin/bash

mkdir ${DIR}/{ .state,ansible/{roles,playbooks},kubernetes,terraform,utilities/{scripts/secrets}}
cp ${TEMPDIR}/state-ns.yaml ${DIR}/.state/
cp ${TEMPDIR}/state.yaml 