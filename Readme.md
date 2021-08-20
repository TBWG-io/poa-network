# Deploy TBWG Blockchain POA (Signer)
> networkid 35

> bootstrabnodes "enode://f17da7e240aabea9297e84396a564f092345a551bfdf38ea1f558559b6874ed6d04a6b4b04ee153e2c30dd011f302a41093239399f95b8dfe5d845b63e63f745@103.27.203.74:30555,enode://a286a1972ca88a98a7762a32f9203459757cde23f3021866f0fb27db7d4ccc37d09528d906bb9642e9b7081e648c16d4a2ca579eecc64e3a9d7cec9d7e4c1588@103.27.203.74:30333,enode://2bc587783dc443950ca957ae8260bb3da07b3fe9a266d8dccc35a4f6ebbc514748d582b57008c45b9122f827fa17b08cfd93357888e0b81757ff1b2c202fd59a@52.237.108.90:30333,enode://f6b81f0b9f6535a8013c75d8b15b488a3b0c13eb37ed49e0b67e34fc52a4c06443d4660b26ae9a5962715b52a63ce2702808b4f1ba64da865fadedc2a9860585@210.1.62.206:30333"

# รายละเอียด System Requirements
|VM Spec  | Descriptions     |
|---------|------------------|
|OS       | Ubuntu 20.04 LTS |
|CPU      |vCPU 8 Cores      |
|RAM      |16 GB             |
|DISK SSD | 200 GB           |

# รายละเอียด Software Requirements
| Software      | Version           |
|---------------|-------------------|
|docker         | 20.10.6 or higher |
|docker-compose | 1.29.1 or higher  |
|geth  | ethereum/client-go:v1.10.3 |

# Install docker and docker-compose
```
# curl https://get.docker.com | sh

# curl -L "https://github.com/docker/compose/releases/download/1.29.2/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
# chmod +x /usr/local/bin/docker-compose
```
## 0. clone project xchain
```
# git clone https://github.com/TBWG-io/poa-network.git xchain
# cd xhain
```

## 1. set password to password.txt file
```
# head -1 /dev/urandom | base64 | md5sum
```

## 2. create new account
copy Public address of the key ใส่ใน docker-compose.yaml ในบรรทัด unlock
```
# ./new-account.sh
```

## 3. init-genesis
```
# ./init-genesis.sh
```

## 4. copy static-nodes.json to node/geth
```
# cp static-nodes.json node/geth
```

## 5. deploy
```
# docker-compose up -d
# docker-compose logs -f
```

## 6. JavaScript Console

> https://geth.ethereum.org/docs/rpc/server

```
# docker exec -it TBWG-NODE-00 sh
# geth --datadir /poa/node attach
```

|                   |                   Command                                             |
|-------------------|-----------------------------------------------------------------------|
|Get Signer         | > clique.getSigners()                                                 |
|Check Peers Count  | > net.peerCount                                                       |
|Check IP Peers     | > admin.peers                                                         |
|Add Peers Static   | > admin.addPeer("enode://a979fb575495b8d6db44f75@52.16.188.185:30303")|
|Check NodeInfo     | > admin.nodeInfo                                                      |
|Add Singer         | > clique.propose("0xd881234E73223d1623E0d56789942eA1c0B67890", true)  |
|Remoce Signer      | > clique.propose("0xd881234E73223d1623E0d56789942eA1c0B67890", false) |

1 command-line
```
# docker exec -it TBWG-NODE-00 geth --datadir /poa/node attach --exec 'admin.nodeInfo'
```
# หากต้องการ reset data เพื่อทำการ join ใหม่
## 7. removedb
```
# ./remove-db.sh
```
และให้ทำการ init genesis ใหม่อีกครั้งก่อนการ deploy
```
# ./init-genesis.sh
```


## How to connect RPC X-Chain Mainnet
```
RPC url : https://rpc.xchain.asia
WS url  : wss://ws.xchain.asia
EXP url : https://exp.xchain.asia
Chain ID: 35
```


