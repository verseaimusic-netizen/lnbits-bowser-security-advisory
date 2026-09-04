# Evidence — Code Snippets

## Symbolic Code Patterns

### Pattern 1: /wipe Command

**File:** `wallet/716_cmd_wipe_hww.ino`

```cpp
// Calls wallet initialization with empty mnemonic
// This triggers automated wallet generation
initHww(password, "", "", true);
```

### Pattern 2: Vulnerable RNG

**File:** `wallet/400_helpers.ino`

```cpp
// Uses ESP32 hardware RNG
// Vulnerable to documented ESP32 RNG weakness — predictable output
esp_fill_random(samples, sizeof(samples));
```

### Pattern 3: Vulnerable Entry Point

**File:** `wallet/700_commands.ino`

```cpp
// When mnemonic is empty, generates a new one
// Uses vulnerable RNG path
generateStrongerMnemonic(24);
```

### Technical Reference

- **ESP32 RNG weakness** — documented by Espressif in their ESP-IDF advisory regarding TRNG/RF entropy limitations
- **Impact:** Predictable RNG output leading to potential cryptographic key compromise
