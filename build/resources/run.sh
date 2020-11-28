#!/bin/bash

# Copy over the state-machine
cp -R ${TMPDIR}/state ${WORKSPACE}/.state/

# Run state machine
chmod +x ${WORKSPACE}/.state/state/state.sh
${WORKSPACE}/.state/state/state.sh

# Delete State machine after run

rm -Rf ${WORKSPACE}/.state/state