```
$ docker run -e USR=`whoami` \
             -v `pwd`/src/main/proto:/work/in \
             -v `pwd`/target/generated-sources/proto:/work/out \
             -t podbox/protoc --java_out=/work/out
```
