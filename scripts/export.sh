rm exportet -r
mkdir exportet

cd core
mvn install
cd ..
cd rest-api
mvn clean package
cp target/*.war ../exportet/rest-api-war.jar
cd ..

cd webpage
mvn package
cp target/*.war ../exportet/webpage.war
cp target/*.war ../exportet/ROOT.war
cd ..

cd service-worker
mvn package
cp target/*-dependencies.jar ../exportet/ws.jar
cd ..
