#!/bin/bash

echo "============================================================"
echo "BOWSER RNG Verification"
echo "============================================================"

echo ""
echo "Checking for vulnerable code patterns..."

VULN_COUNT=0

if grep -q 'esp_fill_random' wallet/400_helpers.ino 2>/dev/null; then
    echo "⚠️  Found: esp_fill_random() used"
    VULN_COUNT=$((VULN_COUNT+1))
fi

if grep -q 'generateStrongerMnemonic' wallet/700_commands.ino 2>/dev/null; then
    echo "⚠️  Found: generateStrongerMnemonic() used"
    VULN_COUNT=$((VULN_COUNT+1))
fi

if grep -q 'initHww(password, "", "", true)' wallet/716_cmd_wipe_hww.ino 2>/dev/null; then
    echo "⚠️  Found: /wipe command pattern"
    VULN_COUNT=$((VULN_COUNT+1))
fi

echo ""
echo "============================================================"
echo "Results: $VULN_COUNT vulnerable patterns found"
echo "============================================================"
