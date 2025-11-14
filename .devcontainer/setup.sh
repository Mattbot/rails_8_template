#!/bin/bash
set -e

echo "🚀 Starting Rails 8 + esbuild Dev Container setup..."

# Fix SSH directory ownership if it exists (mounted SSH keys create root-owned directories)
# This is necessary because Docker mount operations create parent directories as root
if [ -d "$HOME/.ssh" ]; then
    echo "🔐 Fixing SSH directory ownership..."
    sudo chown -R vscode:vscode "$HOME/.ssh"
    chmod 700 "$HOME/.ssh"
    if [ -f "$HOME/.ssh/id_ed25519" ]; then
        chmod 600 "$HOME/.ssh/id_ed25519"
    fi
    if [ -f "$HOME/.ssh/id_rsa" ]; then
        chmod 600 "$HOME/.ssh/id_rsa"
    fi
    # Generate public key if missing
    if [ -f "$HOME/.ssh/id_ed25519" ] && [ ! -f "$HOME/.ssh/id_ed25519.pub" ]; then
        ssh-keygen -y -f "$HOME/.ssh/id_ed25519" > "$HOME/.ssh/id_ed25519.pub"
        chmod 644 "$HOME/.ssh/id_ed25519.pub"
    fi
    if [ -f "$HOME/.ssh/id_rsa" ] && [ ! -f "$HOME/.ssh/id_rsa.pub" ]; then
        ssh-keygen -y -f "$HOME/.ssh/id_rsa" > "$HOME/.ssh/id_rsa.pub"
        chmod 644 "$HOME/.ssh/id_rsa.pub"
    fi
    # Add GitHub to known_hosts if not already there
    if [ ! -f "$HOME/.ssh/known_hosts" ] || ! grep -q "github.com" "$HOME/.ssh/known_hosts"; then
        ssh-keyscan github.com >> "$HOME/.ssh/known_hosts" 2>/dev/null
    fi
fi

# Run the standard Rails setup (without starting server)
echo "📦 Running Rails setup..."
bin/setup --skip-server

# Install git hooks for linting and other checks
echo "🪝 Installing git hooks..."
bin/install-hooks

# Install JavaScript dependencies if package.json exists
if [ -f "package.json" ]; then
    echo "📦 Installing JavaScript dependencies..."
    npm install
    
    # Build JavaScript assets once
    echo "🔨 Building JavaScript assets..."
    npm run build
else
    echo "⚠️  No package.json found, skipping npm install"
fi

# Setup direnv if .envrc.example exists
if [ -f ".envrc.example" ]; then
    echo "🔧 Setting up environment variables..."
    if [ ! -f ".envrc" ]; then
        cp .envrc.example .envrc
        echo "📝 Copied .envrc.example to .envrc - please update with your values"
    fi
    
    # Configure direnv hook for vscode user
    echo "🔧 Configuring direnv hook for bash..."
    if ! grep -q 'eval "$(direnv hook bash)"' "$HOME/.bashrc"; then
        echo 'eval "$(direnv hook bash)"' >> "$HOME/.bashrc"
        echo "✅ Added direnv hook to ~/.bashrc"
    fi
    
    # Allow the .envrc file if it exists
    if [ -f ".envrc" ]; then
        echo "🔓 Allowing .envrc file..."
        direnv allow .
    fi
fi

# Install additional gems if needed (for development)
echo "💎 Installing any additional gems..."
bundle install

# Update bundle-audit database and run security check
echo "🔒 Updating security vulnerability database..."
bundle exec bundle-audit update

echo "🔍 Running security audit..."
bundle exec bundle-audit check
if [ $? -eq 0 ]; then
    echo "✅ No security vulnerabilities found!"
else
    echo "⚠️  Security vulnerabilities detected. Check the output above."
    echo "   Run 'rake security:update' to update the vulnerability database"
    echo "   Run 'bundle update' to fix vulnerable gems"
fi

# Precompile assets for the first time
echo "🎨 Precompiling assets..."
bundle exec rails assets:precompile RAILS_ENV=development || echo "Asset precompilation skipped"

# Setup database
echo "🗃️  Setting up database..."
bundle exec rails db:create db:migrate db:seed || echo "Database setup completed"

# Install VS Code extensions if in codespace/dev container
if [ "$CODESPACES" = "true" ] || [ "$REMOTE_CONTAINERS" = "true" ]; then
    echo "🔌 Installing recommended VS Code extensions..."
    
    # Install Slim extension
    code --install-extension sianglim.slim
    
    # Install other useful extensions for Rails development
    code --install-extension shopify.ruby-lsp
    code --install-extension bradlc.vscode-tailwindcss
    code --install-extension esbenp.prettier-vscode
fi

echo "✅ Dev Container setup complete!"
echo ""
echo "🎯 Quick commands:"
echo "   • Start development server: ./bin/dev"
echo "   • Run tests: bundle exec rspec"
echo "   • Rails console: rails console"
echo "   • Build JS assets: npm run build"
echo ""
echo "📚 Check the README.md for more information"