#!/bin/bash
log_files_path="/home/wwwlogs/"
log_files_dir=${log_files_path}$(date -d "yesterday" +"%Y")/$(date -d "yesterday" +"%m")

log_files_name=(nginx_error access)

nginx_sbin="/usr/local/nginx/sbin/nginx"

save_days=30
############################################
#Please do not modify the following script #
############################################
mkdir -p $log_files_dir
log_files_num=${#log_files_name[@]}
#cut nginx log files
for((i=0;i<$log_files_num;i++));do
mv ${log_files_path}${log_files_name[i]}.log ${log_files_dir}/${log_files_name[i]}_$(date -d "yesterday" +"%Y%m%d").log
done
#delete 30 days ago nginx log files
find $log_files_path -mtime +$save_days -exec rm -rf {} \;
$nginx_sbin -s reload
