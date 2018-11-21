#!/usr/bin/env bash


# default backup base location
BACKUP_BASE="/var/www/project/.migrations"

# default project base location
PROJECT_BASE="/var/www/project/app/backend"

# TS will be appended to BACKUP_BASE
# resulting in a BACKUP looks like "/var/www/project/.migrations/20180815/1506"
TS="$(date +%Y%m%d)/$(date +%H%M%S)"
BACKUP=${BACKUP_BASE}/${TS}


function checkBackupLocation() {
    if [ -d ${BACKUP_BASE} ]; then
        echo ""
    else
        mkdir -p ${BACKUP_BASE}
        echo "- Created backup folder ${BACKUP_BASE}"
    fi
}


function findMigrations() {
    FILES=`find ${PROJECT_BASE} -path "**/migrations"`
}


function findBackupMigrations() {
    BACKUP_FILES=`find ${BACKUP} -path "**/migrations"`
}


# 
# Usage: backup /var/www/project/app/backend
#        backup `pwd`
# 
function backup() {
    if [ -n "$1" ]; then
        PROJECT_BASE=$1
    fi

    TS="$(date +%Y%m%d)/$(date +%H%M%S)"
    BACKUP=${BACKUP_BASE}/${TS}
    checkBackupLocation

    # --------------------------
    echo "- Backup to ${BACKUP}"

    findMigrations
    COUNT=0

    for file in ${FILES}
    do
        dest=`echo ${file} | sed "s:${PROJECT_BASE}::g"`
        echo "    > ${BACKUP}${dest}"
        [ -d ${BACKUP}/${dest} ] || mkdir -p ${BACKUP}/${dest}
        cp ${file}/* -r ${BACKUP}/${dest}

        ((COUNT++))
    done

    echo "- Backup finished"
    echo "- ${COUNT} migrations saved to: ${BACKUP}"
    echo "- You can access the folder using env: BACKUP"
    echo "-     or recover migrations using 'recover <TS> pwd'"
}

 
# 
# Usage: recover 20180815/150600 /var/www/project/app/backend
#        recover ${TS} `pwd`
#
function recover() {
    # check migrations backup location param
    if [ -n "$1" ]; then
        BACKUP=${BACKUP_BASE}/$1
        echo "- Recover migrations from ${BACKUP}"
    else
        echo "- Please rerun the command, input timestamp which looks like: 20180815/150600"
        return 0
    fi

    #
    if [ -n "$2" ]; then
        PROJECT_BASE=$2
    fi

    echo "- Recover migrations to ${PROJECT_BASE}"
    #

    # start to recover
    findBackupMigrations
    COUNT=0
    ts="$(date +%Y%m%d%H%M%S)"

    for file in ${BACKUP_FILES}
    do
        dest=`echo ${file} | sed "s:${BACKUP}::g"`
        echo "    > ${PROJECT_BASE}${dest}"
        if [ -d ${PROJECT_BASE}${dest} ]; then
            mkdir -p ${PROJECT_BASE}/mig_bak_${ts}_${COUNT}
            mv ${PROJECT_BASE}${dest}/* ${PROJECT_BASE}/mig_bak_${ts}_${COUNT}
        fi

        mkdir -p ${PROJECT_BASE}${dest}
        cp ${file}/* -r ${PROJECT_BASE}${dest}
        ((COUNT++))
    done

    echo "- Recover finished"
    echo "- ${COUNT} migrations saved to: ${PROJECT_BASE}"
    echo "- You can access the folder using env: PROJECT_BASE"
}






