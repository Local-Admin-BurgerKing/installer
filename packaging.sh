# /bin/sh
# ./scripts/export.sh
rm -r localadmin_1.0-1

mkdir localadmin_1.0-1
mkdir -p localadmin_1.0-1/opt/local-admin/docker
mkdir -p localadmin_1.0-1/opt/local-admin/exportet

cp docker-compose.yml localadmin_1.0-1/opt/local-admin/
cp -r exportet/* localadmin_1.0-1/opt/local-admin/exportet/
cp -r docker/* localadmin_1.0-1/opt/local-admin/docker/

mkdir localadmin_1.0-1/usr/bin -p
cp run.sh localadmin_1.0-1/usr/bin/start-local-admin
cp stop.sh localadmin_1.0-1/usr/bin/stop-local-admin

mkdir localadmin_1.0-1/etc/init.d/ -p
cp run.sh localadmin_1.0-1/etc/init.d/localadmin

sed -i 's|/mysql.cnf|./docker/mysql.cnf|' localadmin_1.0-1/opt/local-admin/docker-compose.yml

mkdir -p localadmin_1.0-1/DEBIAN
cp INSTALLER.meta localadmin_1.0-1/DEBIAN/control
dpkg-deb --build localadmin_1.0-1
