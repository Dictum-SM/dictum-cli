#!/bin/bash


SOURCE="${BASH_SOURCE[0]}"
while [ -h "$SOURCE" ]; do
  DIR="$( cd -P "$( dirname "$SOURCE" )" >/dev/null 2>&1 && pwd )"
  SOURCE="$(readlink "$SOURCE")"
  [[ $SOURCE != /* ]] && SOURCE="$DIR/$SOURCE"
done
export DIR="$( cd -P "$( dirname "$SOURCE" )" >/dev/null 2>&1 && pwd )"

# Uses current directory as workspace root
function init {

  echo ""
  echo "Initializing DSM Workspace"
  echo ""

  cd $TMPDIR
  chmod +x init.sh
  ./init.sh

  cd $DIR
  rm -rf $TMPDIR

  exit 0
}

function define {

  
  cd $TMPDIR
  chmod +x define.sh
  ./define.sh

  cd $DIR
  rm -rf $TMPDIR

  exit 0

}

function run {

  cd $TMPDIR
  chmod +x run.sh
  ./run.sh

  cd $DIR
  rm -rf $TMPDIR

  exit 0
}

function prep-delete {

  cd $TMPDIR
  chmod +x prep-delete.sh
  ./prep-delete.sh

  cd $DIR
  rm -rf $TMPDIR

  exit 0

}

function reset {

  cd $TMPDIR
  chmod +x reset.sh
  ./reset.sh

  cd $DIR
  rm -rf $TMPDIR

  exit 0

}

function help {

  cd $TMPDIR
  chmod +x help.sh
  ./help.sh

  cd $DIR
  rm -rf $TMPDIR

  exit 0

}

FUNCTIONS=$(typeset -f | awk '/ \(\) $/ && !/^main / {print $1}')

if [ $# -eq 0 ]
then
  echo "No arguments provided"
  echo "Use "dictum-cli help" for more info"
  exit 1
else 
  if [[ ! $FUNCTIONS[$1] ]]
  then
    echo "$1 is not a supported option."
    echo "Use "dictum-cli help" for more info"
    echo "$FUNCTIONS"
    exit 1
  fi
fi

ARCHIVE=`awk '/^__ARCHIVE_BELOW__/ {print NR + 1; exit 0; }' $0`

export TMPDIR=`mktemp -d ${DIR}/dictum-cli.XXXXXX`

tail -n+$ARCHIVE $0 | tar xz -C $TMPDIR

"$@"

__ARCHIVE_BELOW__ 
