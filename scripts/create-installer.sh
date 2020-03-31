#!/bin/bash
if [ $# -eq 1 ]
    then
        ./scripts/export.sh
        rm -r localadmin_$1-1
        rm localadmin_$1-1.deb
        mkdir localadmin_$1-1
        mkdir -p localadmin_$1-1/opt/local-admin/docker
        mkdir -p localadmin_$1-1/opt/local-admin/exportet

        cp docker-compose.yml localadmin_$1-1/opt/local-admin/
        cp -r exportet/* localadmin_$1-1/opt/local-admin/exportet/
        cp -r docker/* localadmin_$1-1/opt/local-admin/docker/
        rm -r localadmin_$1-1/opt/local-admin/docker/db/*
        cp -r base-db/* localadmin_$1-1/opt/local-admin/docker/db


        mkdir localadmin_$1-1/usr/bin -p
        cp run.sh localadmin_$1-1/usr/bin/start-local-admin
        cp stop.sh localadmin_$1-1/usr/bin/stop-local-admin

        mkdir localadmin_$1-1/etc/init.d/ -p
        cp run.sh localadmin_$1-1/etc/init.d/localadmin

        sed -i 's|/mysql.cnf|./docker/mysql.cnf|' localadmin_$1-1/opt/local-admin/docker-compose.yml

        mkdir -p localadmin_$1-1/DEBIAN
        cp INSTALLER.meta localadmin_$1-1/DEBIAN/control
        sed -i "s|{V}|$1|" localadmin_$1-1/DEBIAN/control
        dpkg-deb --build localadmin_$1-1
    else
        echo "You have to add a version !"
fi
