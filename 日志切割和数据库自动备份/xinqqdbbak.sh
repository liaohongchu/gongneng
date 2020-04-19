#!/bin/bash
#power by liao
#2013-12-16

#========备份数据及删除函数开始=========================================
back_db(){ 
        dbname=xinqq163db
        dbuser=root
        dbpassword=qq163ok!zaq123x
        #备份位置
        backuppath=/home/dbbak/back_db/
        #数据备份
        /usr/local/mysql/bin/mysqldump -u$dbuser -p$dbpassword $dbname > $backuppath$dbname'_'$(date +%Y%m%d).sql
        #删除3天前的数据
        delete_file=$dbname'_'$(date -d "-3 day" "+%Y%m%d")'.sql'
        rm $backuppath$delete_file
}
#========备份数据及删除函数结束========================================
#调用上面的函数
back_db
