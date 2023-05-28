#!/bin/sh

zot=mi_unidad:SALVADOR/doctorado/biblioteca/zotero
localzot=~/Documentos/zotero 

rclone check $zot $localzot --missing-on-dst missing

python3 -c \
"
print('ASODNAOSDNAOSIDN')
print('$a')
"