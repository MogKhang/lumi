import json

def get_keys(data, prefix=''):
    keys = {}
    if isinstance(data, dict):
        for k, v in data.items():
            full_key = f"{prefix}.{k}" if prefix else k
            keys.update(get_keys(v, full_key))
    elif isinstance(data, list):
        # We don't usually care about list indices in slang keys
        pass
    else:
        # It's a leaf node (the translation string itself)
        # Extract placeholders
        import re
        placeholders = re.findall(r'\$\{([^}]+)\}', str(data))
        keys[prefix] = sorted(placeholders)
    return keys

with open('lib/i18n/en.i18n.json', 'r', encoding='utf-8') as f:
    en_data = json.load(f)
    en_keys = get_keys(en_data)

with open('lib/i18n/vi.i18n.json', 'r', encoding='utf-8') as f:
    vi_data = json.load(f)
    vi_keys = get_keys(vi_data)

print("Mismatched or missing keys in VI:")
for key, placeholders in en_keys.items():
    if key not in vi_keys:
        print(f"MISSING: {key}")
    elif vi_keys[key] != placeholders:
        print(f"PLACEHOLDER MISMATCH: {key} (EN: {placeholders}, VI: {vi_keys[key]})")

print("\nKeys in VI but not in EN:")
for key in vi_keys:
    if key not in en_keys:
        print(f"EXTRA: {key}")
