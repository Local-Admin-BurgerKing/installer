echo "Download Niton Media Framework"
git clone https://github.com/nbrugger-tgm/Niton-Media-Framework.git media-framework --progress
echo "Install ..."
cd media-framework
mvn clean install
cd ..

echo "Download Object Mapper"
git clone https://github.com/nbrugger-tgm/ObjectMapper.git autowire --progress
cd autowire
echo "Install"
mvn clean install
cd ..

echo "------[Dependencies completed]-------"

echo "Download core"
git clone https://github.com/Local-Admin-BurgerKing/core.git core --progress
cd core
git checkout old
git pull
echo "Install acient core"
mvn install
git checkout empty
git pull
echo "Install dummy core"
mvn install
cd ..
echo "--------[Core installed]-------"

echo "Download REST-API"
git clone https://github.com/Local-Admin-BurgerKing/rest-api.git rest-api --progress
cd rest-api
echo "Build rest-api"
mvn package
mvn clean
cd ..
echo "-------[REST installed]--------"

echo "Download Webpage"
git clone https://github.com/Local-Admin-BurgerKing/main-server.git webpage --progress
cd webpage
mvn package
mvn clean
cd ..
echo "------[Webpage installed]-------"

