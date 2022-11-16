#!/bin/bash

IPMI_USER=admin
IPMI_PASS=password
IPMI_HOST=10.1.20.118
IPMI_ARGS="power status"

ipmitool_cmd(){

ARGS=${@:-${IPMI_ARGS}}
echo "EXAMPLE:
  ipmitool_cmd chassis bootdev pxe"

echo "IPMITOOL:
  ipmitool -I lanplus -U [IPMI_USER] -P [IPMI_PASS] -H [IPMI_HOST] -p [PORT] [ARGS]"

echo ARGS: ${ARGS}

for i in {0..6}
do
  echo ${IPMI_HOST}:624${i}
  ipmitool \
    -I lanplus \
    -U ${IPMI_USER} \
    -P ${IPMI_PASS} \
    -H ${IPMI_HOST} \
    -p 624${i} \
    ${ARGS}
done
}

