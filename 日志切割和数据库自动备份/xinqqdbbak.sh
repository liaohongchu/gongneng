#!/bin/bash
#power by liao
#2013-12-16

#========�������ݼ�ɾ��������ʼ=========================================
back_db(){ 
        dbname=xinqq163db
        dbuser=root
        dbpassword=qq163ok!zaq123x
        #����λ��
        backuppath=/home/dbbak/back_db/
        #���ݱ���
        /usr/local/mysql/bin/mysqldump -u$dbuser -p$dbpassword $dbname > $backuppath$dbname'_'$(date +%Y%m%d).sql
        #ɾ��3��ǰ������
        delete_file=$dbname'_'$(date -d "-3 day" "+%Y%m%d")'.sql'
        rm $backuppath$delete_file
}
#========�������ݼ�ɾ����������========================================
#��������ĺ���
back_db
