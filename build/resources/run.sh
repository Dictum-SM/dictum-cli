#!/bin/bash

# Copy over the state-machine
cp -R ${TMPDIR}/state ${DIR}/.state/

# Run state machine
chmod +x ${DIR}/.state/state/state.sh
./${DIR}/.state/state/state.sh

# Delete State machine after run

rm -Rf ${DIR}/.state/state