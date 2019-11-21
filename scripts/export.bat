cd ..
mkdir exportet

cd core
call mvn install
cd ..

cd rest-api
call mvn package
cd ..

cd webpage
call mvn package
cd ..



powershell copy rest-api\target\*.war exportet\rest-api.war
powershell copy rest-api\target\*.jar exportet\rest-api.jar
powershell copy rest-api\target\*.war exportet\rest-api-war.jar
powershell copy webpage\target\*.war exportet\webpage.war

cmd
