# Make sure RUBY_VERSION matches the Ruby version in .ruby-version
ARG RUBY_VERSION=3.4.6
FROM ghcr.io/rails/devcontainer/images/ruby:$RUBY_VERSION

# Install Node.js using fnm (Fast Node Manager)
USER vscode

RUN curl -fsSL https://fnm.vercel.app/install | bash \
    && echo 'eval "$(fnm env --use-on-cd)"' >> ~/.bashrc \
    && bash -c "source ~/.bashrc && fnm install --lts && fnm use lts-latest"

# Add fnm to PATH for all shells
ENV PATH="/home/vscode/.local/share/fnm:$PATH"

# Switch back to root for system-level installations if needed
USER root

# Install additional system dependencies if needed
# RUN apt-get update && apt-get install -y \
#     your-additional-packages \
#     && rm -rf /var/lib/apt/lists/*

# Switch back to vscode user
USER vscode
