#! /bin/bash

read -p "Please input your group's name: " GRP_NAME
read -p "Please input project's name: " PRJ_NAME
read -p "Please input project's description: " PRJ_DESC

mkdir $PRJ_NAME
cp -r requirement/rootproj/* $PRJ_NAME/
sed -i "s/template/$PRJ_NAME/g" $PRJ_NAME/README.md
sed -i "s/description/$PRJ_DESC/g" $PRJ_NAME/README.md
sed -i "s/gname/$GRP_NAME/g" $PRJ_NAME/*.gradle
sed -i "s/template/$PRJ_NAME/g" $PRJ_NAME/*.gradle

mkdir $PRJ_NAME/$PRJ_NAME-client
cp -r requirement/subproj/* $PRJ_NAME/$PRJ_NAME-client
sed -i "s/gname/$GRP_NAME/g" $PRJ_NAME/$PRJ_NAME-client/*.gradle
sed -i "s/template/$PRJ_NAME-client/g" $PRJ_NAME/$PRJ_NAME-client/*.gradle

mkdir $PRJ_NAME/$PRJ_NAME-common
cp -r requirement/subproj/* $PRJ_NAME/$PRJ_NAME-common
sed -i "s/gname/$GRP_NAME/g" $PRJ_NAME/$PRJ_NAME-common/*.gradle
sed -i "s/template/$PRJ_NAME-common/g" $PRJ_NAME/$PRJ_NAME-common/*.gradle

mkdir $PRJ_NAME/$PRJ_NAME-dto
cp -r requirement/subproj/* $PRJ_NAME/$PRJ_NAME-dto
sed -i "s/gname/$GRP_NAME/g" $PRJ_NAME/$PRJ_NAME-dto/*.gradle
sed -i "s/template/$PRJ_NAME-dto/g" $PRJ_NAME/$PRJ_NAME-dto/*.gradle

mkdir $PRJ_NAME/$PRJ_NAME-server
cp -r requirement/subproj/* $PRJ_NAME/$PRJ_NAME-server
sed -i "s/gname/$GRP_NAME/g" $PRJ_NAME/$PRJ_NAME-server/*.gradle
sed -i "s/template/$PRJ_NAME-server/g" $PRJ_NAME/$PRJ_NAME-server/*.gradle
rm -f $PRJ_NAME/$PRJ_NAME-server/src/main/resources/.gitkeep
cp requirement/env/* $PRJ_NAME/$PRJ_NAME-server/src/main/resources/
sed -i "s/template/$PRJ_NAME/g" $PRJ_NAME/$PRJ_NAME-server/src/main/resources/application.yml