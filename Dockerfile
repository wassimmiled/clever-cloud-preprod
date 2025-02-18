FROM quay.io/keycloak/keycloak:22.0.0

# Enable HTTP mode (required for Clever Cloud)
ENV KC_HTTP_ENABLED=true

# Set admin credentials
ENV KEYCLOAK_ADMIN=admin
ENV KEYCLOAK_ADMIN_PASSWORD=admin

# Configure database (PostgreSQL)
ENV KC_DB=postgres
ENV KC_DB_URL=jdbc:postgresql://byxzjccrrz3ksetpinim-postgresql.services.clever-cloud.com:50013/byxzjccrrz3ksetpinim
ENV KC_DB_USERNAME=ui8t7ojiq8dgscjddipc
ENV KC_DB_PASSWORD=yVj0TYwwAHOtQOo8uUP78NiuQ8V3Vl
ENV KC_DB_SCHEMA=public

# Set correct hostname for Keycloak
ENV KC_HOSTNAME_STRICT=false
ENV KC_HOSTNAME_STRICT_HTTPS=false

# Enable proxy mode for Clever Cloud
ENV KC_PROXY=edge
ENV KC_PROXY_ADDRESS_FORWARDING=true


# Copy the custom Keycloakify theme JAR
COPY keycloakify-starter-keycloak-theme-4.8.2.jar /opt/keycloak/providers/

# Build Keycloak with the custom theme
RUN /opt/keycloak/bin/kc.sh build

# Ensure Keycloak runs in development mode
ENTRYPOINT ["/opt/keycloak/bin/kc.sh", "start-dev"]