expect="\"ismaster\" : true"

check_mongo() {
    echo "rs.isMaster()" > ismaster
    echo "mongo \"$MONGO\" --ssl --sslAllowInvalidCertificates --username \"$MONGO_USERNAME\" --password \"$MONGO_PASSWORD\""
  actual=`mongo \"$MONGO\" --ssl --sslAllowInvalidCertificates --username \"$MONGO_USERNAME\" --password \"$MONGO_PASSWORD\" < ismaster`
  rm -f ismaster
}

next() {
    echo "waiting for mongod node to assume primary status..."
  sleep 2
  check_mongo
}

finish() {
  echo "connected to primary"
  echo "start running mongo-connector"
}

while true
do
  check_mongo
  if [ "${actual/$expect}" = "$actual" ] ; then
    next
  else
    finish
    break
  fi
done
sleep 1


  --oplog-ts=/data/oplog.ts \
