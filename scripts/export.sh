#!/bin/bash
RUNTIMES=runtimes/* 
for rt in $RUNTIMES 
do
    mkdir $rt/bin
    rm $rt/bin/* -r
done

cd dependencies

cd object-mapper
mvn install
cd ..

cd login-secure
mvn install
cd ..


cd ../modules
cd core
pwd
mvn clean install
cd ..


cd rest-api
mvn clean package
for rt in ../../$RUNTIMES
do
    cp target/*.war $rt/bin/rest-api-war.jar
done
cd ..

cd webpage
mvn clean package
for rt in ../../$RUNTIMES
do
    cp target/*.war $rt/bin/webapp.war
done

cd ..

cd service-worker
mvn clean  package -P "Jar With Dependencies"
for rt in ../../$RUNTIMES
do
    cp target/*-dependencies.jar $rt/bin/sw.jar
done

