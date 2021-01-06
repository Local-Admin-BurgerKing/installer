docker-compose down
rm -r logs docker/db bin
echo Build Project
./scripts/export.sh
echo Restart
docker-compose up --scale installer=0
