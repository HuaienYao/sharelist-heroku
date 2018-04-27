apk add --update openssl

cd /app

wget https://github.com/reruin/sharelist/archive/master.zip -O sharelist.zip
unzip sharelist.zip

cd /app/sharelist-master
npm install

mkdir /app/sharelist-master/cache

if echo "$CONFIG" | grep -q -i "^http"; then
  wget --no-check-certificate $CONFIG_URL -O /app/sharelist-master/cache/config.json
else
  echo -e "$CONFIG" > /app/sharelist-master/cache/config.json
fi

npm start
