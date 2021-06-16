#!/bin/bash
docker run --rm -it -v $PWD:/poa -w /poa ethereum/client-go --datadir /poa/node --password password.txt  account new
