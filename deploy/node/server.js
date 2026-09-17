/**
 * Production Static Express Server for Vinit Enterprise Flutter Web
 * Supports SPA fallback, Gzip compression, and security headers
 */
const express = require('express');
const compression = require('compression');
const path = require('path');

const app = express();
const PORT = process.env.PORT || 3000;
const BUILD_DIR = path.resolve(__dirname, '../../build/web');

// Enable gzip compression
app.use(compression());

// Security headers middleware
app.use((req, res, next) => {
  res.setHeader('X-Content-Type-Options', 'nosniff');
  res.setHeader('X-Frame-Options', 'SAMEORIGIN');
  res.setHeader('Referrer-Policy', 'strict-origin-when-cross-origin');
  next();
});

// Serve static assets with caching
app.use(express.static(BUILD_DIR, {
  maxAge: '1y',
  immutable: true,
  setHeaders: (res, filePath) => {
    // WASM MIME type
    if (filePath.endsWith('.wasm')) {
      res.setHeader('Content-Type', 'application/wasm');
    }
    // Never cache entry files
    if (filePath.endsWith('index.html') || filePath.endsWith('flutter_service_worker.js') || filePath.endsWith('version.json')) {
      res.setHeader('Cache-Control', 'no-cache, no-store, must-revalidate');
    }
  }
}));

// SPA Fallback: Any route not matching a file returns index.html
app.get('*', (req, res) => {
  res.sendFile(path.join(BUILD_DIR, 'index.html'));
});

app.listen(PORT, () => {
  console.log(`[Vinit Enterprise] Production web server running on port ${PORT}`);
  console.log(`Serving files from: ${BUILD_DIR}`);
});
