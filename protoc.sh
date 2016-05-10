#!/bin/sh

CMD='cd /work/in && LD_LIBRARY_PATH=/usr/local/lib find . -name "*.proto" -exec protoc {} '
for arg in $*; do CMD="$CMD $arg"; done
CMD="$CMD \;"

if [ -n "$USR" ]; then
  useradd --create-home $USR
  su -l $USR -c "$CMD"
else
  bash -c "$CMD"
fi
