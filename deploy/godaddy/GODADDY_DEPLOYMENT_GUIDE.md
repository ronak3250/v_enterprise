# GoDaddy Deployment Guide for Vinit Enterprise

This guide walks you through deploying your Flutter Web application to **GoDaddy Web Hosting** (cPanel / Linux or Windows Plesk).

---

## ⚡ Quick 3-Step Summary

1. Log in to your **GoDaddy Account** → Go to **My Products** → Click **Manage** on your Web Hosting (cPanel).
2. Open **File Manager** → Go to `public_html/`.
3. Upload [`web_release.zip`](file:///c:/Users/DELL/vinit_enterprise/web_release.zip), click **Extract**, and make sure `.htaccess` is present!

---

## 📋 Detailed Step-by-Step Instructions (GoDaddy cPanel - Most Common)

### Step 1: Log in to GoDaddy cPanel
1. Go to [godaddy.com](https://www.godaddy.com) and sign in.
2. In the **My Products** page, scroll down to **Web Hosting** (or **Web Hosting Plus**).
3. Click the **Manage** button next to your hosting account, then click **cPanel Admin**.

### Step 2: Open File Manager and Enable "Show Hidden Files"
> **CRITICAL STEP FOR GODADDY:** GoDaddy hides files starting with a dot (like `.htaccess`) by default.
1. In cPanel, click on **File Manager** (under the **Files** section).
2. Click on the **Settings** button in the top-right corner of File Manager.
3. Check the box that says:
   ✅ **Show Hidden Files (dotfiles)**
4. Click **Save**.

### Step 3: Navigate to Your Domain Folder
- **For your Primary Domain** (`vinitenterprise.in`):
  - Double-click to open the **`public_html`** directory.
- **For an Addon Domain or Subdomain**:
  - Open the specific folder for that domain (e.g., `public_html/vinit_enterprise/` or `subdomain.domain.com/`).
- *(Optional: If there are old default files like `default.html` or old website files, delete them or move them to a backup folder).*

### Step 4: Upload and Extract `web_release.zip`
1. Click the **Upload** button in the top menu of File Manager.
2. Select or drag-and-drop the [`web_release.zip`](file:///c:/Users/DELL/vinit_enterprise/web_release.zip) file from your computer.
3. Once the upload bar turns green (100%), close the upload tab and click **Reload** in File Manager.
4. Right-click on `web_release.zip` in File Manager and select **Extract**.
5. Extract destination: confirm it is `public_html/` (or your domain folder) and click **Extract Files**.
6. (Optional) You can delete the `web_release.zip` file after extracting to save hosting space.

### Step 5: Verify the Files in `public_html/`
Your `public_html` folder should now have these files directly inside it:
- ✅ `.htaccess` *(Crucial: Handles routing & WASM)*
- ✅ `index.html`
- ✅ `flutter.js`
- ✅ `flutter_bootstrap.js`
- ✅ `flutter_service_worker.js`
- ✅ `main.dart.js`
- ✅ `manifest.json`
- ✅ `version.json`
- ✅ `assets/` (folder)
- ✅ `canvaskit/` (folder)
- ✅ `icons/` (folder)

---

## 🔒 Step 6: Enable Free SSL / HTTPS on GoDaddy

1. In cPanel, search for **SSL/TLS Status** or **AutoSSL**.
2. Select your domain (`vinitenterprise.in`) and click **Run AutoSSL**.
3. Once the green lock icon appears, HTTPS is active.
4. The included `.htaccess` file automatically redirects all HTTP visitors to HTTPS (`https://vinitenterprise.in`).

---

## 🛠️ Troubleshooting GoDaddy Common Issues

### Issue 1: Page shows a Blank/White Screen or Loading Spinner never stops
- **Cause**: GoDaddy Apache didn't recognize `.wasm` (WebAssembly) MIME type, or `.htaccess` is missing.
- **Fix**: Check if `.htaccess` exists in `public_html`. If missing, create a new file named `.htaccess` and paste the contents from [`deploy/godaddy/.htaccess`](file:///c:/Users/DELL/vinit_enterprise/deploy/godaddy/.htaccess).

### Issue 2: Refreshing a page (or visiting `/products`, `/contact`) gives 404 Not Found
- **Cause**: SPA rewrite rules are missing.
- **Fix**: The included `.htaccess` solves this with:
  ```apache
  RewriteCond %{REQUEST_FILENAME} !-f
  RewriteCond %{REQUEST_FILENAME} !-d
  RewriteRule . /index.html [L]
  ```

### Issue 3: If you have GoDaddy Windows Hosting (Plesk / IIS) instead of Linux
- If your hosting control panel is **Plesk** (Windows Server), use the provided [`deploy/godaddy/web.config`](file:///c:/Users/DELL/vinit_enterprise/deploy/godaddy/web.config) inside `httpdocs/` instead of `.htaccess`.
