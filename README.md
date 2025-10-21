# 🧩 NixOS Undetected Chromedriver Development Template

This is a **template for undetected Chromedriver development on NixOS**.

I use an **`aarch64` laptop**, so using `webdriver-manager` was problematic.  
Additionally, I encountered **Chromium crashes when `TMPDIR` was not set**.

Maybe there are simpler approaches, I’ve found this setup to be best but feel free to contribute.

---

After cloning the repository, run:

```bash
nix develop
python3 main.py
```

You should see

```
This domain is for use in documentation examples without needing permission. Avoid use in operations.
Learn more
```
