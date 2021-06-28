cd runtime/test
docker-compose down
rm -r logs bin data
echo Build Project
./scripts/export.sh
echo Restart
docker-compose up --scale installer=0
echo clean
rm bin -r
rm logs -r
rm data -r
