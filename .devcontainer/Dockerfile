# Make sure RUBY_VERSION matches the Ruby version in .ruby-version
ARG RUBY_VERSION=3.4.6
FROM ghcr.io/rails/devcontainer/images/ruby:$RUBY_VERSION

# Install Node.js using fnm (Fast Node Manager)
USER vscode

# Install fnm and Node.js LTS in a single RUN command with proper PATH setup
RUN curl -fsSL https://fnm.vercel.app/install | bash \
    && export PATH="/home/vscode/.local/share/fnm:$PATH" \
    && eval "$(fnm env)" \
    && fnm install --lts \
    && fnm use lts-latest \
    && echo 'export PATH="/home/vscode/.local/share/fnm:$PATH"' >> ~/.bashrc \
    && echo 'eval "$(fnm env --use-on-cd)"' >> ~/.bashrc

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
