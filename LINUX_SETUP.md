# Linux Environment Setup Guide

This guide covers manual setup for Linux environments when not using Dev Containers.

## Prerequisites

- **Linux Environment**: Ubuntu, Debian, or similar distribution
- **Node.js**: Required for JavaScript bundling with esbuild
- **Ruby**: Rails 8 requires Ruby 3.1+

## Manual Linux Environment Setup

If you prefer to set up the environment manually or aren't using Dev Containers:

### Install Node.js (using fnm - Fast Node Manager)
```bash
curl -fsSL https://fnm.vercel.app/install | bash
source ~/.bashrc
fnm install --lts
fnm use lts-latest
```

### Install Ruby dependencies
```bash
bundle install
```

### Install JavaScript dependencies
```bash
npm install
# or
yarn install
```

### Database Setup
```bash
rails db:create
rails db:migrate
rails db:seed
```

### Start the Development Server
```bash
./bin/dev
```
This starts both the Rails server and esbuild in watch mode.

## Direnv Setup (Optional)

Several environment variables necessary to run this project in Docker can be loaded via 
Direnv. Direnv allows you to dynamically load environment variables into your shell environment
relative to your current path. If you change to a directory with a `.envrc`,
direnv will load those variables into your shell and remove them when you change
directories out of that directory's path.

### Installation

**Linux/Ubuntu:**
```bash 
sudo apt install direnv
```

**Windows WSL2:**
```bash
sudo apt install direnv
```

### Setup
1. Copy the example file:
   ```bash 
   cp .envrc.example .envrc
   ```

2. Add the direnv hook to your shell:
   ```bash 
   echo 'eval "$(direnv hook bash)"' >> ~/.bashrc
   source ~/.bashrc
   ```

3. Edit `.envrc` with your values and activate:
   ```bash
   direnv allow
   ```

## Troubleshooting

### Manual Setup Issues

**Node.js not found:**
```bash
# Reload shell configuration
source ~/.bashrc
# Or reinstall fnm
curl -fsSL https://fnm.vercel.app/install | bash
```

**Bundle install fails:**
```bash
# Update RubyGems
gem update --system
# Clean and retry
bundle clean --force && bundle install
```

**Database issues:**
```bash
# Reset database
rails db:drop db:create db:migrate db:seed
```

### Security Scanning Issues

**Bundle-audit not found:**
```bash
# Reinstall the gem
bundle install
# Or install directly
gem install bundler-audit
```

**Outdated vulnerability database:**
```bash
# Update the advisory database
bundle exec bundle-audit update
```

**Security vulnerabilities found:**
- Review the vulnerability details in the output
- Update affected gems: `bundle update gem_name`
- Check for patches or alternative gems
- Consider temporary workarounds if no fix is available

## Local Testing

Run the same checks locally before pushing:

```bash
# Run full test suite
bundle exec rspec

# Run specific test types
bundle exec rspec spec/models/
bundle exec rspec spec/system/

# Code quality checks
bundle exec rubocop
bundle exec slim-lint app/views/
bundle exec brakeman
bundle exec bundle-audit check

# Security updates
rake security:audit
rake security:update
```