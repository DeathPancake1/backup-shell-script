#! /bin/bash
src=$1
dest=$2
secs=$3
max=$4
backups=0
echo '' > directory-info.last
ls -lR $src > directory-info.new
while true
do
    diff=$(diff directory-info.last directory-info.new)
    if [ "$diff" == "" ]
    then
        echo 'No changes Detected'
    else
        if [ $backups -lt $max ]
        then
            backups=$((backups+1))
        else
            rm -rf $2/$(ls -t $2 | tail -1)
        fi
        cp directory-info.new directory-info.last
        cd $2
        time=$(date +'%F-%H-%M-%S')
        mkdir "${time}"
        cd ..
        dest=`expr $2/$time`
        echo "backed up to: $dest"
        cp -RT $src $dest
    fi
    sleep $secs
    ls -lR $src > directory-info.new
done