#!/bin/sh -e
#
# install mongodb

# MongoDB Server :

echo "MongoDB Server version:"
mongod --version

mongo yii2test --eval 'db.createUser({user: "travis", pwd: "test", roles: ["readWrite", "dbAdmin"]});'

# PHP Extension :

pecl install -f mongodb

echo "extension = mongodb.so" >> ~/.phpenv/versions/$(phpenv version-name)/etc/php.ini

echo "MongoDB PHP Extension version:"
php -i |grep mongodb -4 |grep -2 version

#cat /etc/mongodb.conf
