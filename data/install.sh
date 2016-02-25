#!/bin/sh

echo "Running install.sh for $1"

echo "Cloning shopware5 repo"
git clone --branch $1 --depth 1 https://github.com/shopware/shopware.git /www

echo "Installing composer packages"
cd  /www \
    && composer.phar self-update \
    && composer.phar install --ignore-platform-reqs


echo "Setting filesystem permissions"
chown -R www-data /www
chgrp -R www-data /www

echo "Installation completed"