#!/bin/bash
cd $(dirname $0)/..
perl -p -e 's/\$\{([^}]+)\}/defined $ENV{$1} ? $ENV{$1} : $&/eg' fonts.conf.tpl > fonts.conf
LANG=C FONTCONFIG_FILE=$(readlink -f fonts.conf) phantomjs/bin/phantomjs js/hello.js
