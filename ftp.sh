#!/bin/bash
remote_server="10.10.4.16"
ftp_local_directory="/u02/cbscdr"
ftp_remote_directory="/u02/reporter/cbscdr"
yesterday=`date +%Y%m%d --date=yesterday`
data_file=data${yesterday}*
ftp -i -v -n $remote_server << FTP
user reporter reporter
lcd $ftp_local_directory
cd $ftp_remote_directory
mget $data_file
quit
FTP
