# Local Admin

# Installation

> This guide is only for the server/API and the default frontend. This components require to run on *Linux*. While it would be wise and also easy to also create your website to be used in the docker-compose it is theoretically possible to run a website on any OS

### Debian/Ubuntu

On Debian and Ubuntu the installation is easy.

* Click on [releases](https://github.com/Local-Admin-BurgerKing/core/releases) at Github
* Download the latest `.deb` 
* install it using `dpkg -i *.deb`

The deb includes

* Service
* Auto start
* The application itself
* command/aliases

### Linux General

* install `docker-compose`
* `git clone <this repo> local-admin`
* create a folder for the application to be stored at *(from now on being referenced as `<installfolder>`)*
* run the scripts
  * `./scripts/install-tools.sh` <- this is likely to fail as it uses APT and you system doesn't has apt, you will need to download the software manually (eg. yum)
  * `./scripts/init.sh` 
  * `./scripts/export.sh`
* `cp docker-compose.yml <installfolder>`
* `cp -r exportet/* <installfolder>/exportet/`
* `cp -r docker/* <installfolder>/docker/`
* `rm -r <installfolder>/docker/db/*`
* `cp installer-data/run.sh <installfolder>/start.sh` (replace the path at the `cd` with `<installfolder>` )
* `cp installer-data/stop.sh <installfolder>/stop.sh` do the same as before
* `sed -i 's|/mysql.cnf|./docker/mysql.cnf|' <installfolder>/docker-compose.yml`