#!/bin/bash

SOURCE="${BASH_SOURCE[0]}"
while [ -h "$SOURCE" ]; do
  DIR="$( cd -P "$( dirname "$SOURCE" )" >/dev/null 2>&1 && pwd )"
  SOURCE="$(readlink "$SOURCE")"
  [[ $SOURCE != /* ]] && SOURCE="$DIR/$SOURCE"
done
export DIR="$( cd -P "$( dirname "$SOURCE" )" >/dev/null 2>&1 && pwd )"

function init {

  echo ""
  echo "Self Extracting Installer"
  echo ""

  export TMPDIR=`mktemp -d ./selfextract.XXXXXX`

  ARCHIVE=`awk '/^__ARCHIVE_BELOW__/ {print NR + 1; exit 0; }' $0`

  tail -n+$ARCHIVE $0 | tar xzv -C $TMPDIR

  CDIR=`pwd`
  cd $TMPDIR
  chmod +x installer
  ./init.sh

  cd $CDIR
  rm -rf $TMPDIR

  exit 0
}

function extract {
  echo ""
  echo "Extracting..."
  echo ""

  mkdir ./kubeadm-omnibus

  ARCHIVE=`awk '/^__ARCHIVE_BELOW__/ {print NR + 1; exit 0; }' $0`

  tail -n+$ARCHIVE $0 | tar xzv -C kubeadm-omnibus

  exit 0
}

if [ $# -eq 0 ]; then
    echo "No arguments provided"
    exit 1
fi

"$@"

__ARCHIVE_BELOW__ 