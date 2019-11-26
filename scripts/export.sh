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
cd ..

