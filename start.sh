#!/bin/sh
# This is a comment!
echo Hello World

echo $PRIMARY_SITE

CANCERDIR="data/counts/cancer"
mkdir -p $CANCERDIR
HEALTHYDIR="data/counts/healthy"
mkdir -p $HEALTHYDIR
LOGSDIR="data/logs"
mkdir -p $LOGSDIR

gdc-client download -d $CANCERDIR -m manifests/${PRIMARY_SITE}.cancer.short.txt --log-file ${LOGSDIR}/${PRIMARY_SITE}.cancer.log
gdc-client download -d $HEALTHYDIR -m manifests/${PRIMARY_SITE}.healthy.short.txt --log-file ${LOGSDIR}/${PRIMARY_SITE}.healthy.log

find $CANCERDIR -name '*.gz' -exec mv '{}' $CANCERDIR \;
find $HEALTHYDIR -name '*.gz' -exec mv '{}' $HEALTHYDIR \;

find . -type d -empty -delete
find . -name '*.gz' -exec gunzip '{}' \;
