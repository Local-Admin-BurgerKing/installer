docker-compose down
echo Build Project
./scripts/export.sh
echo Restart
docker-compose up -d --scale installer=0
