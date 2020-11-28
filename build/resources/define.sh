#!/bin/bash

# Test for initialization issues
if [[ ! -d ${DIR}/.state ]]
then
  echo "There is a problem with this workspace"
  echo "Run "dictum-cli init" to initialize this workspace."
  exit 1
else
  if [[ ! -f ${DIR}/.state/.state ]]
  then
    echo "No state file found."
    echo "There is a problem with this workspace."
    exit 1
  fi
fi

vi ${DIR}/.state/.state