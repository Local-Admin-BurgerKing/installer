cd media-framework
git pull
mvn clean install
cd ..

cd core
git checkout empty
git pull
mvn clean install
git checkout master
git pull
mvn clean install
cd ..

cd autowire
git pull
mvn clean install
cd ..
