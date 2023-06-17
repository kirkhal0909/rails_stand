#!/bin/sh

set -e

printf 'Y\ntemp@temp.com\ntemp@temp.com\n' | sentry upgrade
