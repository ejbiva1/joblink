INSERT INTO mysql.user (Host, User, Password) VALUES ('%', 'root', password('YOURPASSWORD'));
GRANT ALL ON *.* TO 'root'@'%' WITH GRANT OPTION;

mysqldump -uroot -p0oRUwpHQnnFV JOBLINK > /home/default/ROOT/dump.sql

mysqldump -uJONLINK -pJONLINK JOBLINK > /home/default/ROOT/dump.sql
mysql -uroot -p0oRUwpHQnnFV
select user,host,password from mysql.user;

GRANT ALL PRIVILEGES ON *.* TO 'JOBLINK'@'%' IDENTIFIED BY 'JOBLINK' WITH GRANT OPTION;
GRANT ALL PRIVILEGES ON *.* TO 'JOBLINK'@'127.0.0.1' IDENTIFIED BY 'JOBLINK' WITH GRANT OPTION;

------------------max_allowed_packet---------------------------
set global max_allowed_packet = 2*1024*1024*10
show VARIABLES like '%max_allowed_packet%';

vi /etc/my.cnf
------------------启动mysql-------------------------------------
1、使用 service 启动：service mysqld start
2、使用 mysqld 脚本启动：/etc/inint.d/mysqld start

1、使用 service 启动：service mysqld stop
2、使用 mysqld 脚本启动：/etc/inint.d/mysqld stop
3、mysqladmin shutdown

----------------查找文件---------------------------------------
find /etc -name '*srm*'  

8shd2934fjgkd8x9-93jd-2kdkmzkfgei