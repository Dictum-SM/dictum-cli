#!/bin/bash

# Link from tempdir to .state dir
ln -s ${TEMPDIR}/state ${DIR}/.state/

# I dont think that DSM will discover the initialized workspace like this... 