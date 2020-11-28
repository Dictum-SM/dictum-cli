#!/bin/bash

# Test for initialization issues
if [[ ! -d ${WORKSPACE}/.state ]]
then
  echo "There is a problem with this workspace"
  echo "Run "dictum-cli init" to initialize this workspace."
  exit 1
else
  if [[ ! -f ${WORKSPACE}/.state/.state ]]
  then
    echo "No state file found."
    echo "There is a problem with this workspace."
    exit 1
  fi
fi

# Prep the workspace for deletions
mv ${WORKSPACE}/.state/.state ${WORKSPACE}/.state/.state.del
cp -n ${TMPDIR}/state-delete.yaml ${WORKSPACE}/.state/.state
