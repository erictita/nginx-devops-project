FROM nginx:stable-alpine

# Create a non-root user
RUN addgroup -S appgroup && adduser -S appuser -G appgroup

# Copy static site
COPY index.html /usr/share/nginx/html/index.html

# Add a HEALTHCHECK
HEALTHCHECK CMD wget -q -O /dev/null http://localhost || exit 1

# Switch to non-root user
USER appuser
