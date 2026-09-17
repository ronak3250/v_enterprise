# =============================================================================
# Production Dockerfile for Vinit Enterprise Flutter Web
# Uses an ultra-lightweight, secure Nginx Alpine image
# =============================================================================
FROM nginx:alpine-slim

# Copy custom Nginx configuration
COPY deploy/nginx/nginx.conf /etc/nginx/nginx.conf

# Copy compiled Flutter web build artifacts
COPY build/web /usr/share/nginx/html

# Expose HTTP port
EXPOSE 80

# Healthcheck to verify web server status
HEALTHCHECK --interval=30s --timeout=3s --retries=3 \
  CMD wget --quiet --tries=1 --spider http://localhost/ || exit 1

# Start Nginx in foreground
CMD ["nginx", "-g", "daemon off;"]
