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

vi ${WORKSPACE}/.state/.state