## Description

* We have two modules.

* One depends on another (`B` imports `A`).

* We modify timestamps in `./output` directory.

* Purs recompiles `B` module.

* When `B` doesn't import `A` nothing is recompiled after timestamp modification.

## Test script

Test script (./test.sh):

```bash
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
```

