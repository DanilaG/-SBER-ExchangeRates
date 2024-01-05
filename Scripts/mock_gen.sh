#!/bin/sh

MODULES=$1

# Генерация Mock-ов
echo "🍾 SwiftyMocky Start 🛠"
for D in $MODULES/*/*/; do 
    if [ -f "$D/Mockfile" ]; then
        cd $D
        swiftymocky generate
        cd ../../../
    fi
done
echo "🍾 SwiftyMocky End 🛠"