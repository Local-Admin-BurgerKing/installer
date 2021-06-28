cd runtimes/test
docker-compose down
echo Build Project
./scripts/export.sh
echo Restart
docker-compose up --scale installer=0
