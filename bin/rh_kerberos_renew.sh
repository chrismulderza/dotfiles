#!/usr/bin/env bash

PASSCMD=$(which pass)
PASS_ENTRY_KRB=Identities/Redhat/Redhat-Corp-Kerberos
trap 'rm -f "$KRB_TMPFILE"' EXIT

echo -e "Renewing Kerberos ticket"
KRB_TMPFILE=$(mktemp) || exit 1

${PASSCMD} ${PASS_ENTRY_KRB} | head -1 > ${KRB_TMPFILE}

TKT=$(cat ${KRB_TMPFILE})

#echo "${TKT}" | kinit -V cmulder@IPA.REDHAT.COM
echo "${TKT}" | kinit -V cmulder@REDHAT.COM
