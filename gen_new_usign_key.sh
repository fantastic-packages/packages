#!/bin/bash
USIGN="./.host/x86_64/bin/usign"

#$USIGN -G -p >(cat) -s >(cat)
$USIGN -G -p keys/usign/usign.pub -s keys/usign/usign.sec -c "Public usign key for fantastic-packages builds"
mv keys/usign/usign.pub keys/usign/$($USIGN -F -p keys/usign/usign.pub|tr 'a-z' 'A-Z').pub
mv keys/usign/usign.sec keys/usign/$($USIGN -F -s keys/usign/usign.sec|tr 'a-z' 'A-Z').sec
