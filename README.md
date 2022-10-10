# Overview
Docker image including Lantern (installed from the Debian packages)

# Usage docker cli
```bash
docker run -d --restart=unless-stopped --name=lantern -p 3128:3128 -p 8080:8080 sashaoshurkov/lantern
```

# Usage docker-compose
```bash
version: "2.1"
services:
  lantern:
    image: sashaoshurkov/lantern
    container_name: lantern
    ports:
      - 3128:3128
      - 8080:8080
    network_mode: "bridge"
    restart: unless-stopped
```

# Proxy settings
Set the following proxy server settings on your operating system:  HTTP(S) Proxy <i>127.0.0.1</i> Port <i>3128</i>

# Configure Lantern
Application web interface: http://127.0.0.1:8080/admin
