rm exportet -r
mkdir exportet

cd media-framework
mvn install
cd ..

cd autowire
mvn install
cd ..

cd core
mvn clean install
cd ..


cd rest-api
mvn clean package
cp target/*.war ../exportet/rest-api-war.jar
cd ..

cd webpage
mvn clean package
cp target/*.war ../exportet/webpage.war
cp target/*.war ../exportet/ROOT.war
cd ..

cd service-worker
mvn clean  package -P "Jar With Dependencies"
cp target/*-dependencies.jar ../exportet/sw.jar
cd ..
