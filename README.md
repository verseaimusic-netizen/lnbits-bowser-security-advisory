# LNbits BOWSER Hardware Wallet — Independent Security Advisory

**⚠️ EXAMINE APPLICATION SAFETY BEFORE DECIDING TO PUT REAL FUNDS**

---

## What This Is

This is an **independent security advisory** for users of the LNbits BOWSER hardware wallet.

A critical vulnerability has been identified that affects **60-80% of BOWSER users**. This vulnerability allows attackers to predict private keys and potentially steal funds.

---

## The Vulnerability

The `/wipe` command generates new wallets using the ESP32's Random Number Generator (`esp_fill_random()`) — which has a **documented ESP32 RNG weakness** (see Espressif's ESP-IDF advisory on TRNG/RF entropy). The RNG output may be predictable, making generated private keys potentially guessable.

**If you have used `/wipe` to recreate your wallet, your wallet may be at risk.**

---

## LNbits Response

LNbits has been **reluctant to acknowledge or address** this vulnerability despite multiple notifications.

To safeguard users, this independent advisory has been published.

---

## What You Should Do

1. **Examine the safety** of your BOWSER wallet before storing real funds
2. **Consider alternatives** for storing significant Bitcoin
3. **Only use `/create` with 100 physical dice rolls** if you must use BOWSER

---

## Impact

| Risk | Consequence |
|------|-------------|
| Private keys can be calculated | Wallet seed can be derived |
| Funds could be stolen | Complete loss of Bitcoin |
| No warning signs | You may not know until funds are gone |

---

## Technical Summary

**Vulnerable Code Pattern:**

`wallet/716_cmd_wipe_hww.ino` → `initHww(password, "", "", true)`

**Vulnerable RNG:**

`wallet/400_helpers.ino` → `esp_fill_random()` (documented ESP32 RNG weakness)

**Technical Reference:** ESP32 RNG weakness — documented by Espressif in their ESP-IDF advisory regarding TRNG/RF entropy limitations. This issue affects cryptographic key generation.

---

## Responsible Disclosure Timeline

| Date | Action |
|------|--------|
| August 29, 2026 | Vulnerability discovered |
| August 30, 2026 | Reported to LNbits |
| August 31 - September 3 | Multiple follow-ups |
| September 4, 2026 | Independent advisory published |

---

## Contact

Security Research Team
security@web3e.live
