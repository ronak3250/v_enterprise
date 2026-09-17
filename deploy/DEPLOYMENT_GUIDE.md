# Vinit Enterprise - Production Deployment Guide

This guide explains how to deploy the production build of **Vinit Enterprise** across various hosting environments.

---

## 📁 Build Artifacts & Configuration Structure

- **`build/web/`**: The compiled production distribution directory.
- **`web_release.zip`**: Complete zipped release package ready for instant upload.
- **`deploy/`**: Pre-configured server configs for all major production platforms:
  - `nginx/`: Standalone Nginx (`nginx.conf`) & Site Virtual Host (`vinit_enterprise.conf`)
  - `apache/`: `.htaccess` with SPA rewriting, WASM MIME types, Gzip compression & caching
  - `iis/`: `web.config` for Windows Server / IIS with URL Rewrite and MIME types
  - `docker/`: Production `Dockerfile` and `docker-compose.yml`
  - `caddy/`: `Caddyfile` for automated HTTPS
  - `node/`: Express server (`server.js`) & PM2 cluster config (`ecosystem.config.js`)
  - `vercel/`: `vercel.json` for Vercel deployment
  - `netlify/`: `netlify.toml` and `_redirects` for Netlify deployment

---

## 1. Deploying to cPanel / Shared Hosting (Apache)

1. Open your cPanel File Manager.
2. Navigate to `public_html/` (or your subdomain directory).
3. Upload `web_release.zip` and extract it directly into `public_html/`.
4. Ensure `.htaccess` is present in `public_html/` (enable "Show Hidden Files" in cPanel settings if you do not see it).
5. The `.htaccess` file is pre-configured with:
   - Client-side SPA routing (`try_files` equivalent)
   - `.wasm`, `.json`, font MIME types
   - Gzip compression (`mod_deflate`)
   - Cache headers for speed (1-year immutable caching for assets, no-cache for index.html)

---

## 2. Deploying to Linux VPS / Cloud (Ubuntu / Debian + Nginx)

### Option A: Static Web Directory
1. Copy the contents of `build/web/` to `/var/www/vinit_enterprise/build/web`:
   ```bash
   mkdir -p /var/www/vinit_enterprise
   # Upload and unzip web_release.zip into /var/www/vinit_enterprise/build/web
   ```
2. Copy the Nginx site configuration:
   ```bash
   sudo cp deploy/nginx/vinit_enterprise.conf /etc/nginx/sites-available/vinit_enterprise.conf
   sudo ln -s /etc/nginx/sites-available/vinit_enterprise.conf /etc/nginx/sites-enabled/
   ```
3. Test and reload Nginx:
   ```bash
   sudo nginx -t
   sudo systemctl reload nginx
   ```
4. Obtain free SSL certificate with Let's Encrypt (Certbot):
   ```bash
   sudo certbot --nginx -d vinitenterprise.in -d www.vinitenterprise.in
   ```

---

## 3. Deploying with Docker & Docker Compose

1. Build and start the container in detached mode:
   ```bash
   docker compose -f deploy/docker/docker-compose.yml up -d --build
   ```
2. The application will be live at `http://localhost:8080`.
3. To stop the container:
   ```bash
   docker compose -f deploy/docker/docker-compose.yml down
   ```

---

## 4. Deploying to Windows Server (IIS)

1. Ensure the **URL Rewrite Module** is installed in IIS.
2. Place all files from `build/web/` into your IIS website root folder (e.g., `C:\inetpub\wwwroot\vinit_enterprise`).
3. Ensure `web.config` is present in that folder. It automatically configures all MIME types (including `.wasm`), caching headers, and SPA rewrite rules.

---

## 5. Deploying to Vercel

1. Install Vercel CLI (or connect your GitHub repository to Vercel):
   ```bash
   npm install -g vercel
   ```
2. In the project directory or inside `build/web/`:
   ```bash
   vercel --prod
   ```
   The `vercel.json` file handles all SPA redirects and caching automatically.

---

## 6. Deploying to Netlify

1. Drag-and-drop the `build/web/` folder directly onto the Netlify dashboard: [app.netlify.com/drop](https://app.netlify.com/drop).
2. The included `_redirects` and `netlify.toml` configure SPA routing and headers automatically.

---

## 7. Deploying with Node.js & PM2 (VPS / PaaS)

1. Navigate to `deploy/node`:
   ```bash
   cd deploy/node
   npm install
   ```
2. Start with PM2:
   ```bash
   npm install -g pm2
   pm2 start ecosystem.config.js
   pm2 save
   ```

---

## 8. Building Again in the Future

To generate a new release build at any time:
```bash
flutter build web --release --base-href "/"
```
*(If hosting on a subfolder such as GitHub Pages `user.github.io/v_enterprise/`, use `--base-href "/v_enterprise/"`)*
