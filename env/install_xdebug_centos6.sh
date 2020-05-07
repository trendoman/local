#! /bin/bash
set -e

PHP_VER="php72" # <file.sh> -p php56
while getopts 'p:' x
do
  case $x in
    p) PHP_VER=$OPTARG ;;
  esac
done

IP="10.0.2.2" # Or run $ /sbin/ip route|awk '/default/ { print $3 }' which should output something like 10.0.2.2 when inside a virtual machine
URL_PHP_INI="/etc/php.ini"
URL_XDEBUG_INI="/etc/php.d/20-xdebug.ini"
URL_XDEBUG_SO="/opt/remi/$PHP_VER/root/usr/lib64/php/modules/xdebug.so"

PHP_PKG="php72-php-pecl-xdebug.x86_64"
if [ "php56" == $PHP_VER ]; then
  PHP_PKG="php56-php-pecl-xdebug.x86_64"
fi
sudo yum -y install $PHP_PKG

sudo tee -a $URL_PHP_INI <<EOF
implicit_flush=On
[XDebug]
zend_extension=$URL_XDEBUG_SO
xdebug.default_enable=1
xdebug.remote_enable=1
xdebug.remote_autostart=1
xdebug.remote_handler=dbgp
xdebug.remote_port=9000
xdebug.remote_host=127.0.0.1
EOF

sudo tee -a $URL_XDEBUG_INI <<EOF
xdebug.remote_enable=1
xdebug.remote_autostart=1
xdebug.remote_host=$IP
xdebug.remote_port=9000
xdebug.var_display_max_data=-1
EOF

sudo service httpd restart && sudo kill -USR2 1 # Restart Nginx and PHP

echo "Confirm xdebug was installed"
php -m | grep xdebug && php -i | less | grep xdebug | sort # Should output something like: /etc/php.d/20-xdebug.ini, ... $URL_XDEBUG_INI ... xdebug.auto_trace
php -v # PHP 7.2.25 (cli) ... with Xdebug v2.9.2

cat <<EOF
Install VSCode extension: PHP Debug (felixfbecker.php-debug).
Add to your debug configuration in VSCode, like so:
{
  "version": "0.2.0",
  "configurations": [
    {
      "name": "deb",
      "type": "php",
      "request": "launch",
      "port": 9000,
      "pathMappings": {
        "/var/www/html": "${workspaceFolder}",
      },
      "xdebugSettings": {
        "max_data": -1,
        "max_children": -1
      }
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
        "max_children": -1
      }
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

echo "Done"
