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
  else
    if [[ ! -f ${DIR}/.state/.state.del ]]
    then
      echo "No teardown prep detected. No changes made."
      exit 1
    fi
  fi
fi

# Reset from deletion workspace
mv ${DIR}/.state/.state.del ${DIR}/.state/.state

