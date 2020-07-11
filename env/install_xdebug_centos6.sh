#! /bin/bash
set -e

# Usage: <file.sh> -p php56

PHP_VER="php72" 
ENV="Vagrantfile" # <file.sh> ... -e Vagrantfile, <file.sh> ... -e Dockerfile
while getopts 'p:e:' x
do
  case $x in
    p) PHP_VER=$OPTARG ;;
    e) ENV=$OPTARG ;;
  esac
done

IP=$(/sbin/ip route | awk '/default/ { print $3 }') # Alternatively: netstat -nr | grep '^0\.0\.0\.0' | awk '{print $2}'; Should output something like 10.0.2.2 when inside a virtual machine and 192.168.5.1 inside Docker containers with custom network with gateway equal to 192.168.5.1
URL_PHP_INI="/etc/php.ini"

URL_XDEBUG_INI="/etc/php.d/20-xdebug.ini"
URL_XDEBUG_SO="/opt/remi/$PHP_VER/root/usr/lib64/php/modules/xdebug.so"
if [ $PHP_VER = "php53" ] || [ $PHP_VER = "php54" ] || [ $PHP_VER = "php55" ]; then
  URL_XDEBUG_SO="/usr/lib64/php/modules/xdebug.so"
fi

PHP_PKG="php72-php-pecl-xdebug.x86_64"
if [ $PHP_VER = "php53" ] || [ $PHP_VER = "php54" ] || [ $PHP_VER = "php55" ]; then
  PHP_PKG="php-pecl-xdebug.x86_64"
fi
if [ "$PHP_VER" = "php56" ]; then
  PHP_PKG="php56-php-pecl-xdebug.x86_64"
fi

yum -y install $PHP_PKG

tee -a $URL_XDEBUG_INI <<EOF
; The following configuration works under Docker environment with CentOS

implicit_flush=On

; Enable xdebug extension module
zend_extension=$URL_XDEBUG_SO

[XDebug]

xdebug.idekey="XDEBUG_IDE"
xdebug.remote_log=/tmp/xdebug.log
xdebug.var_display_max_data=-1
xdebug.default_enable=1
xdebug.remote_enable=1
xdebug.remote_mode=req
xdebug.remote_port=9000

; Recommended to use "remote_autostart" because it just works on Linux
xdebug.remote_autostart=1
xdebug.remote_connect_back=1

; Send all debug requests to given IP address, remote_connect_back should be turned off
; xdebug.remote_host=192.168.5.1 .................. Y
; xdebug.remote_host=10.254.254.254 ............... N
; xdebug.remote_host=192.168.5.30 ................. N

; Enable profiling and log
; xdebug.profiler_enable= 1
; xdebug.profiler_output_dir="C:\xampp\tmp"
; xdebug.remote_log ="C:\xampp\tmp\xdebug.log"
EOF

service httpd restart && kill -USR2 1 # Restart Nginx and PHP

echo -e "Look for similar output to confirm xdebug was installed:\n=> /etc/php.d/20-xdebug.ini, ... $URL_XDEBUG_INI ... xdebug.auto_trace\n=> PHP 7.2.25 (cli) ... with Xdebug v2.9.2"
php -m | grep xdebug && php -i | less | grep xdebug | sort && php -v

cat <<EOF
Install VSCode extension - PHP Debug (felixfbecker.php-debug) - and add your debug configuration in VSCode, like so:
{
  "version": "0.2.0",
  "configurations": [
    {
      "name": "deb",
      "type": "php",
      "request": "launch",
      "port": 9000,
      "pathMappings": {
        "path/in/guest": "path/in/host",
        "/var/www/html": "${workspaceFolder}"
      },
      "xdebugSettings": {
        "max_data": -1,
        "overload_var_dump": 2
      },
      "ignore": [
          "**/vendor/**/*.php"
      ]
    },
    {
      "name": "wrc",
      "type": "php",
      "request": "launch",
      "port": 9000,
      "pathMappings": {
        "/var/www/html/sptms-wirecard": "${workspaceFolder}",
      },
      "xdebugSettings": {
        "max_data": -1,
        "overload_var_dump": 2
      },
      "ignore": [
          "**/vendor/**/*.php"
      ]
    },
    {
      "name": "Launch currently open script",
      "type": "php",
      "request": "launch",
      "program": "${file}",
      "cwd": "${fileDirname}",
      "port": 9000
    }
  ]
}
EOF

echo -e "Run '# service httpd restart && kill -USR2 1' to restart Apache and PHP"
echo -e "Done"
