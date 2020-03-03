#!/usr/bin/env bash

rm -fr output*

echo "Just compiling"
purs compile 'A.purs' 'B.purs'

echo "Recompiling on original..."
purs compile 'A.purs' 'B.purs'

echo "Modifying output timestamps..."
find output -exec touch -m '{}' \;

echo "Recompiling on modified timestamps..."
purs compile 'A.purs' 'B.purs'
