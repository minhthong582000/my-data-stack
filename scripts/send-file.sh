#!/bin/bash

curl -iL -X PUT -T ./sample/test.json "http://hadoop:50070/webhdfs/v1/test/user.json?op=CREATE&namenoderpcaddress=hadoop:9000&createflag=&createparent=true&overwrite=false&user.name=root"