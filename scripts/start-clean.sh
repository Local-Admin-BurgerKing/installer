cd runtimes/test
docker-compose down
rm -r logs data bin
echo Build Project
./scripts/export.sh
echo Restart
docker-compose up --scale installer=0
