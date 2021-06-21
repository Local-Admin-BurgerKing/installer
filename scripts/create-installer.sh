##!/bin/bash
if (( $# == 2 )) && (( "$2" == "-e" || "$2" == "-d" ))
    then
        RUNTIME="export"
        RTF="runtimes/$RUNTIME"
        INSTALL_FOLDER="/opt/local-admin"
        NAME=localadmin_$1-1
        ./scripts/export.sh
        rm -r $NAME
        rm $NAME.deb
        mkdir -p $NAME$INSTALL_FOLDER/
        
        cp -r $RTF/* $NAME$INSTALL_FOLDER/
	
        rm -r $NAME$INSTALL_FOLDER/data/*
	if [ "$2" = "-e" ]
		then
			rm -r $NAME$INSTALL_FOLDER/data/*
	fi

        mkdir $NAME/usr/bin -p
        cp installer-data/run.sh $NAME/usr/bin/start-local-admin
        cp installer-data/stop.sh $NAME/usr/bin/stop-local-admin
	sudo chmod 777 $NAME/usr/bin/*
        mkdir $NAME/etc/init.d/ -p
        cp installer-data/run.sh $NAME/etc/init.d/localadmin


        sudo mkdir -p $NAME/DEBIAN
        sudo cp installer-data/INSTALLER.meta $NAME/DEBIAN/control
        sudo mkdir -p $NAME/opt/systemd/system
	sudo cp installer-data/local-admin.service $NAME/opt/systemd/system/local-admin.service
        sudo sed -i "s|{V}|$1|" $NAME/DEBIAN/control
        sudo chmod 755 $NAME
        sudo dpkg-deb --build $NAME
    else
        echo "Wrong syntax create-installer.sh <version> <-e/-c/-d>"
		echo " -e    Empty Database: Exports no database"
		echo " -d    Dump: Copies you local database"
fi
