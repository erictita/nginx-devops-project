FROM nginx:alpine

# Create non-root user
RUN addgroup -S appgroup && adduser -S appuser -G appgroup

# Copy website
COPY index.html /usr/share/nginx/html/index.html

# Health check
HEALTHCHECK CMD wget -q -O /dev/null http://localhost || exit 1

# Switch to non-root user
USER appuser
