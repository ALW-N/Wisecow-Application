# Step 1: Use lightweight Ubuntu base
FROM ubuntu:22.04

# Step 2: Metadata
LABEL maintainer="ALW-N <officialalwintomy@gmail.com>"
LABEL description="Wisecow - Cow wisdom web server"

# Step 3: Install dependencies
RUN apt-get update && \
    DEBIAN_FRONTEND=noninteractive apt-get install -y \
        bash \
        curl \
        fortune-mod \
        cowsay \
        net-tools \
        netcat && \
    ln -s /usr/games/fortune /usr/bin/fortune && \
    ln -s /usr/games/cowsay /usr/bin/cowsay && \
    rm -rf /var/lib/apt/lists/*

# Step 4: Set working directory
WORKDIR /app

# Step 5: Copy Wisecow app
COPY wisecow.sh /app/wisecow.sh

# Step 6: Make script executable
RUN chmod +x /app/wisecow.sh

# Step 7: Expose port 4499
EXPOSE 4499

# Step 8: Default command
CMD ["/app/wisecow.sh"]
