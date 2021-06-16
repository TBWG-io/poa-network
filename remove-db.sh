#!/bin/bash
docker run --rm -it -v $PWD:/poa -w /poa ethereum/client-go --datadir /poa/node --nousb --password password.txt removedb
