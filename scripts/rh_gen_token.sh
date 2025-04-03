#!/usr/bin/env bash

PASSCMD=$(which pass)
PASS_ENTRY_OTP=Identities/Redhat/Redhat-Corp-OTP
PASS_ENTRY_KRB=Identities/Redhat/Redhat-Corp-Kerberos
trap 'rm -f "$PIN_TMPFILE" "$OTP_TMPFILE" "$KEY_TMPFILE" "$KRB_TMPFILE"' EXIT

echo -e "Copying Red Hat SSO Token to clipboard"
PIN_TMPFILE=$(mktemp) || exit 1
OTP_TMPFILE=$(mktemp) || exit 1
KEY_TMPFILE=$(mktemp) || exit 1
KRB_TMPFILE=$(mktemp) || exit 1

${PASSCMD} ${PASS_ENTRY_OTP} | head -1 > ${PIN_TMPFILE}
${PASSCMD} otp ${PASS_ENTRY_OTP} | tail -1 >> ${OTP_TMPFILE}
${PASSCMD} ${PASS_ENTRY_KRB} | head -1 > ${KRB_TMPFILE}

PIN=$(cat ${PIN_TMPFILE})
OTP=$(cat ${OTP_TMPFILE})
TKT=$(cat ${KRB_TMPFILE})

#echo -e "${PIN}${OTP}" | xclip -selection clipboard
echo -e "${PIN}${OTP}" | pbcopy
