#!/bin/bash
perl -p -e 's/\$\{([^}]+)\}/defined $ENV{$1} ? $ENV{$1} : $&/eg' fonts.conf.tpl > fonts.conf
cd $(dirname $0)/..
LANG=C FONTCONFIG_FILE=$(readlink -f fonts.conf) phantomjs/bin/phantomjs js/hello.js
