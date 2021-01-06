docker-compose down
rm -r logs bin docker/db
echo Build Project
./scripts/export.sh
echo Restart
docker-compose up --scale installer=0
rm bin -r
rm logs -r
rm docker/db -r
