##!/bin/bash
if (( $# == 2 )) && (( "$2" == "-e" || "$2" == "-c" || "$2" == "-d" ))
    then
        ./scripts/export.sh
        rm -r localadmin_$1-1
        rm localadmin_$1-1.deb
        mkdir localadmin_$1-1
        mkdir -p localadmin_$1-1/opt/local-admin/docker
        mkdir -p localadmin_$1-1/opt/local-admin/bin
        
        cp local-admin.cfg localadmin_$1-1/opt/local-admin/local-admin.cfg
        cp docker-compose.yml localadmin_$1-1/opt/local-admin/
        cp -r bin/* localadmin_$1-1/opt/local-admin/bin/
		cp -r docker/* localadmin_$1-1/opt/local-admin/docker/
	
	if [ "$2" = "-e" ]
		then
			rm -r localadmin_$1-1/opt/local-admin/docker/db/*
	fi
	if [ "$2" = "-c" ]
		then
			rm -r localadmin_$1-1/opt/local-admin/docker/db/*
			cp -r base-db/* localadmin_$1-1/opt/local-admin/docker/db
	fi


        mkdir localadmin_$1-1/usr/bin -p
        cp installer-data/run.sh localadmin_$1-1/usr/bin/start-local-admin
        cp installer-data/stop.sh localadmin_$1-1/usr/bin/stop-local-admin
		chmod 777 locacadmin_$1-1/usr/bin/*
        mkdir localadmin_$1-1/etc/init.d/ -p
        cp installer-data/run.sh localadmin_$1-1/etc/init.d/localadmin

        #sed -i 's|/mysql.cnf|/docker/mysql.cnf|' localadmin_$1-1/opt/local-admin/docker-compose.yml

        mkdir -p localadmin_$1-1/DEBIAN
        cp installer-data/INSTALLER.meta localadmin_$1-1/DEBIAN/control
        mkdir -p localadmin_$1-1/opt/systemd/system
		cp installer-data/local-admin.service localadmin_$1-1/opt/systemd/system/local-admin.service
        sed -i "s|{V}|$1|" localadmin_$1-1/DEBIAN/control
        sudo chmod 755 localadmin_$1-1
	chmod 775 locacadmin_$1-1
	dpkg-deb --build localadmin_$1-1
    else
        echo "Wrong syntax create-installer.sh <version> <-e/-c/-d>"
		echo " -e    Empty Database: Exports no database"
		echo " -c    Custom: Copys the base-db folder as data"
		echo " -d    Dump: Copies you local database"
fi
