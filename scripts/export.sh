rm bin -r
mkdir bin

cd autowire
mvn install
cd ..

cd core
mvn clean install
cd ..


cd rest-api
mvn clean package
cp target/*.war ../bin/rest-api-war.jar
cd ..

cd webpage
mvn clean package
cp target/*.war ../bin/ROOT.war
cd ..

cd service-worker
mvn clean  package -P "Jar With Dependencies"
cp target/*-dependencies.jar ../bin/sw.jar
cd ..
