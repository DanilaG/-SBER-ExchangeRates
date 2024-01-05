#!/bin/sh

INSTAL_TITLE='🗜 Install'

echo -e "${INSTAL_TITLE} SwiftyMocky"
brew install mint
mint install krzysztofzablocki/Sourcery@1.9.2
mkdir temp && cd temp
git clone https://github.com/MakeAWishFoundation/SwiftyMocky
cd ./SwiftyMocky
make install
cd ../../ && rm -rf temp