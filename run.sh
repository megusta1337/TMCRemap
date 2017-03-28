#!/bin/ksh
sdcard=`ls /mnt|grep sdcard.*t`
dstPath=/mnt/$sdcard
runtstamp=`date +"%m/%d/%Y ""%T"`
mount -uw $dstPath
mount -uw /mnt/efs-persist
mount -uw /mnt/efs-extended

cp -r -v /mnt/efs-persist/*.CVA $dstPath/CVA/
cp -r -v /mnt/efs-extended/backup $dstPath/backup/

rm -f /mnt/efs-persist/*.CVA;
rm -f -R /mnt/efs-extended/backup;
echo -ne "$runtstamp - TMC: TMC data inserted successfully. Rebooting MMI. \r\n" >> $dstPath/install.log
slay -9 `pidin | grep -i 'navcore'`

