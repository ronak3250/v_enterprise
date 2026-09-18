# GoDaddy Deployment Instructions for Vinit Enterprise

A production build has been generated and packaged for GoDaddy in:
- **`godaddy_deployment.zip`** (also mirrored in **`web_release.zip`**)

Both configuration files (`web.config` for Windows/Plesk and `.htaccess` for Linux/cPanel) are **already pre-installed in the root of the zip**.

---

## 1. If your GoDaddy plan is Linux / cPanel (Most Common)

1. Log in to your **GoDaddy Account** -> Open **cPanel**.
2. Go to **File Manager**.
3. Open your web root folder:
   - For primary domain: **`public_html/`**
   - For an addon domain/subdomain: **`public_html/your_folder/`**
4. Click **Upload** in the top bar.
5. Select and upload [`godaddy_deployment.zip`](godaddy_deployment.zip).
6. Right-click [`godaddy_deployment.zip`](godaddy_deployment.zip) in File Manager and select **Extract**.
7. Ensure `.htaccess` is present (enable *"Show Hidden Files (dotfiles)"* in cPanel File Manager Settings if you do not see it).
8. Done! Your website and all PDF brochure downloads are live.

---

## 2. If your GoDaddy plan is Windows Hosting / Plesk (IIS)

1. Log in to your **GoDaddy Account** -> Open **Plesk / Windows Hosting Manager**.
2. Go to **File Manager**.
3. Open your web root directory:
   - Typically **`httpdocs/`**
4. Click **Upload Files** and upload [`godaddy_deployment.zip`](godaddy_deployment.zip).
5. Click **Extract Files** directly into `httpdocs/`.
6. Ensure [`web.config`](build/web/web.config) is present in `httpdocs/`. It includes:
   - `.pdf`, `.wasm`, `.json`, font MIME types
   - `allowDoubleEscaping="true"` for asset URL compatibility
   - SPA URL Rewrite rules pointing to `index.html`
   - Cache control and security headers
7. Done!

---

## Key Configurations Included in this Build

| Configuration | File | Purpose |
|---|---|---|
| **IIS / Plesk (Windows)** | `web.config` | Enables `.pdf`, `.wasm`, `.mjs`, URL Rewriting to `index.html`, and `allowDoubleEscaping="true"` |
| **Apache / cPanel (Linux)** | `.htaccess` | Enables MIME types, Gzip compression, SPA route rewrite, and 1-year asset caching |
| **Brochures Included** | `assets/assets/brochures/` | 13-page Corporate Catalog + 10 dedicated 3-page standalone product PDFs |
