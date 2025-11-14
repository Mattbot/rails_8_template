# Rails 8 Template

[![CI](https://github.com/Mattbot/rails_8_template/workflows/CI/badge.svg)](https://github.com/Mattbot/rails_8_template/actions/workflows/ci.yml)
[![Code Quality](https://github.com/Mattbot/rails_8_template/workflows/Code%20Quality/badge.svg)](https://github.com/Mattbot/rails_8_template/actions/workflows/quality.yml)
[![Version Bump](https://github.com/Mattbot/rails_8_template/workflows/Auto%20Version%20Bump/badge.svg)](https://github.com/Mattbot/rails_8_template/actions/workflows/version-bump.yml)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)
[![Ruby](https://img.shields.io/badge/ruby-3.4.6-red.svg)](https://www.ruby-lang.org/)
[![Rails](https://img.shields.io/badge/rails-8.0.3-red.svg)](https://rubyonrails.org/)

**A modern, production-ready Rails 8 template for rapid application development.**

This template provides a fully configured Rails 8 application with modern development tools, comprehensive testing, security features, and automated CI/CD workflows.

## 🚀 Quick Start with Template

### Use as GitHub Template (Recommended)

1. **[Click "Use this template"](https://github.com/Mattbot/rails_8_template/generate)** on GitHub
2. **Create your repository** with your desired name
3. **Clone and setup**:
   ```bash
   git clone https://github.com/YOUR_USERNAME/YOUR_PROJECT_NAME.git
   cd YOUR_PROJECT_NAME
   ./bin/template-setup YOUR_PROJECT_NAME
   ```

### Manual Clone

```bash
git clone https://github.com/Mattbot/rails_8_template.git my_new_app
cd my_new_app
./bin/template-setup my_new_app
```

The setup script automatically configures your new application and removes template-specific files.

📚 **For detailed usage instructions, see [TEMPLATE_USAGE.md](TEMPLATE_USAGE.md)**

## Quick Start

### Prerequisites

- **Linux/Dev Container Environment**: This application is designed to run in a Linux environment or dev container
- **Node.js**: Required for JavaScript bundling with esbuild
- **Ruby**: Rails 8 requires Ruby 3.1+

### Setup Instructions

#### Option 1: Dev Container (Recommended - Zero Setup Required)

This is the easiest way to get started. The Dev Container is fully configured to automatically handle all setup steps.

**Prerequisites:**

- Docker Desktop
- VS Code with the "Dev Containers" extension

**Steps:**

1. **Clone the repository**

   ```bash
   git clone <repository-url>
   cd rails_8_template
   ```

2. **Open in Dev Container**

   - Open the project in VS Code
   - Press `Ctrl+Shift+P` (or `Cmd+Shift+P` on Mac)
   - Select "Dev Containers: Reopen in Container"
   - Wait for the container to build and setup to complete (first time only)

3. **Start developing**
   ```bash
   ./bin/dev
   ```

**What happens automatically:**

- ✅ Ruby and Node.js installation
- ✅ Gem dependencies (`bundle install`)
- ✅ JavaScript dependencies (`npm install`)
- ✅ Database creation and migration
- ✅ JavaScript asset building
- ✅ Security vulnerability scanning
- ✅ Automated semantic versioning with GitHub Actions
- ✅ Continuous integration with automated testing
- ✅ VS Code extensions (Slim, Ruby LSP, etc.)
- ✅ Environment configuration

#### Option 2: Manual Linux Environment Setup

For manual Linux setup instructions, see [LINUX_SETUP.md](LINUX_SETUP.md).

## Technology Stack

### JavaScript Bundling

This application uses **esbuild** instead of the default Rails 8 importmap setup for:

- Faster build times
- Modern JavaScript bundling
- Better development experience with hot reloading
- Support for npm packages

**Key differences from default Rails 8:**

- Uses `jsbundling-rails` gem instead of `importmap-rails`
- JavaScript files are bundled from `app/javascript/` to `app/assets/builds/`
- Development uses `./bin/dev` to run both Rails and esbuild concurrently

### Template Engine

- **Slim**: All view templates use Slim instead of ERB for cleaner, more readable templates

## Description

This a full default install of Rails 8 with modern development enhancements.

## Additional Features

The following additional features have been added to the Rails 8 base install:

### Gems

- **slim**: Clean, minimal templating language
- **slim_lint**: Linting for Slim templates
- **jsbundling-rails**: JavaScript bundling with esbuild
- **bundler-audit**: Security vulnerability scanner for gems
- **rspec-rails**: Testing framework (if added)

### Development Tools

- **esbuild**: Fast JavaScript bundler replacing importmap
- **Dev Container**: Containerized development environment
- **Direnv**: Environment variable management
- **bundler-audit**: Automatic security vulnerability scanning

## Configuration

### Development Commands

**Start development server with esbuild:**

```bash
./bin/dev
```

**Run Rails server only:**

```bash
rails server
```

**Build JavaScript assets:**

```bash
npm run build
# or
yarn build
```

**Run tests:**

```bash
bundle exec rspec
```

**Code quality checks:**

```bash
# Run linter (RuboCop)
bundle exec rubocop

# Auto-fix lint issues
bundle exec rubocop -A

# Run Slim template linter
bundle exec slim-lint app/views/
```

**Git hooks (automatic):**

```bash
# Install git hooks (done automatically in dev container)
bin/install-hooks

# Pre-push hook automatically runs linter before each push
git push # Will run linter first
```

**Security scanning:**

```bash
# Update vulnerability database and check
rake security:check

# Just update the database
rake security:update
```

### Dev Containers

This Rails application includes a fully configured Dev Container that automatically handles all setup requirements. The configuration includes:

**Automatic Setup Features:**

- **Base Image**: Rails-optimized Ruby 3.4.6 container
- **Node.js**: Latest LTS version installed via dev container features
- **Dependencies**: Automatic installation of Ruby gems and npm packages
- **Database**: SQLite setup with automatic migrations
- **Assets**: JavaScript bundling with esbuild
- **VS Code Extensions**: Pre-installed Slim, Ruby LSP, and development tools

**Configuration Files:**

- `.devcontainer/devcontainer.json` - Main configuration
- `.devcontainer/Dockerfile` - Custom container setup with Node.js
- `.devcontainer/setup.sh` - Automated setup script
- `.devcontainer/compose.yaml` - Multi-container setup with Selenium

**First-Time Setup Process:**

1. Container builds with Ruby + Node.js pre-installed
2. VS Code extensions auto-install
3. Setup script runs automatically:
   - `bundle install` (Ruby dependencies)
   - `npm install` (JavaScript dependencies)
   - `rails db:setup` (Database initialization)
   - `npm run build` (Initial asset compilation)
   - Environment file setup (if `.envrc.example` exists)

**Benefits:**

- ✅ **Zero manual setup** - everything works immediately
- ✅ **Consistent environment** across all developers
- ✅ **Isolated dependencies** - no conflicts with host system
- ✅ **Pre-configured tools** - linting, formatting, debugging ready
- ✅ **One-click start** - just run `./bin/dev`

[Getting Started with Dev Containers](https://guides.rubyonrails.org/getting_started_with_devcontainer.html)

#### Direnv Integration

The Dev Container includes automatic direnv setup for environment variable management:

**Automatic Configuration:**

- ✅ **Direnv installed**: Pre-installed via dev container features
- ✅ **Bash hook configured**: Automatically added to `~/.bashrc` for the vscode user
- ✅ **Environment loading**: `.envrc` files are automatically allowed and loaded
- ✅ **Zero setup required**: Works immediately when container starts

**Usage:**

```bash
# .envrc file is automatically created from .envrc.example (if present)
# Environment variables are loaded automatically when you cd into the project
# No manual direnv allow needed - handled during container setup
```

**Benefits:**

- 🔄 **Automatic loading**: Environment variables load when entering the project directory
- 🔒 **Secure**: Per-project environment isolation
- 🚀 **Development ready**: Database URLs, API keys, and other secrets properly managed
- 🔧 **Container optimized**: Works seamlessly with dev container lifecycle

### Environment Setup

For Linux environment setup without Dev Containers, see [LINUX_SETUP.md](LINUX_SETUP.md).

## Version Management

This application follows [Semantic Versioning (SemVer)](https://semver.org/) principles with automated version management tools.

### Current Version

The current version is stored in the `VERSION` file and accessible throughout the application:

```bash
# Show current version
rake version:show

# Access in Rails console
APP_VERSION            # => "1.0.0"
AppVersion.current     # => "1.0.0"
AppVersion.major       # => 1
AppVersion.minor       # => 0
AppVersion.patch       # => 0
```

### Version Endpoints

**Health Check Endpoint:**

- `GET /version` - Returns JSON with current version and timestamp
- Useful for monitoring, debugging, and deployment verification

```bash
curl http://localhost:3000/version
# => {"version":"1.0.0","timestamp":"2025-11-04 19:47:17 UTC"}
```

### Version Bumping

Use rake tasks to bump versions automatically:

```bash
# Bump patch version (1.0.0 → 1.0.1)
rake version:patch

# Bump minor version (1.0.0 → 1.1.0)
rake version:minor

# Bump major version (1.0.0 → 2.0.0)
rake version:major
```

**What happens automatically:**

- ✅ Updates `VERSION` file
- ✅ Updates `package.json` version field
- ✅ Provides git commands for committing and tagging
- ✅ Maintains version consistency across the project

**Recommended Workflow:**

1. Make your changes
2. Choose appropriate version bump level:
   - **Patch**: Bug fixes, security updates
   - **Minor**: New features, backward-compatible changes
   - **Major**: Breaking changes, API changes
3. Run the version bump command
4. Follow the suggested git commands to commit and tag

```bash
# Example workflow
rake version:patch
# => 📦 Updated VERSION file: 1.0.0 → 1.0.1
# => 📦 Updated package.json: 1.0.0 → 1.0.1
# => ✅ Version bumped to 1.0.1
# => 💡 Don't forget to commit and tag this version:
# =>    git add VERSION package.json
# =>    git commit -m "Bump version to 1.0.1"
# =>    git tag -a v1.0.1 -m "Version 1.0.1"

git add VERSION package.json
git commit -m "Bump version to 1.0.1"
git tag -a v1.0.1 -m "Version 1.0.1"
git push && git push --tags
```

### 🤖 Automated Version Management

**GitHub Actions automatically handle versioning when you push to the main branch!**

#### Conventional Commits

Use [Conventional Commits](https://www.conventionalcommits.org/) format for automatic version bumping:

```bash
# Patch version bump (1.0.0 → 1.0.1)
git commit -m "fix: resolve authentication issue"
git commit -m "chore: update dependencies"
git commit -m "docs: improve setup instructions"

# Minor version bump (1.0.0 → 1.1.0)
git commit -m "feat: add user dashboard"
git commit -m "feat: implement email notifications"

# Major version bump (1.0.0 → 2.0.0)
git commit -m "feat!: redesign authentication system"
git commit -m "fix!: remove deprecated API endpoints"
git commit -m "feat: new API

BREAKING CHANGE: authentication now requires API key"
```

#### Automation Features

**🔄 Automatic Version Bumping:**

- Analyzes commit messages on push to main/master
- Bumps version according to conventional commit rules
- Updates `VERSION` file and `package.json`
- Creates git tags automatically
- Generates GitHub releases with changelogs

**📋 Quality Checks:**

- Runs security audit before releasing
- Executes test suite to ensure quality
- Only releases if all checks pass

**🎛️ Manual Control:**

- Manual workflow dispatch available in GitHub Actions tab
- Choose version bump type (patch/minor/major)
- Add custom release notes
- Skip automation with `[skip version]` in commit message

#### Workflow Triggers

1. **Automatic (Recommended):**

   ```bash
   # Make your changes
   git add .
   git commit -m "feat: add amazing new feature"
   git push origin main
   # 🤖 GitHub Actions automatically:
   # ✅ Bumps version to 1.1.0
   # ✅ Creates tag v1.1.0
   # ✅ Generates release with changelog
   ```

2. **Manual Trigger:**

   - Go to GitHub → Actions → "Manual Version Bump"
   - Click "Run workflow"
   - Select version type and add notes
   - 🤖 Automated version bump and release

3. **Skip Automation:**
   ```bash
   git commit -m "docs: update README [skip version]"
   # No version bump occurs
   ```

#### Benefits

- 🚀 **Zero-friction releases**: Just commit with conventional format
- 📊 **Consistent versioning**: No manual version management needed
- 📝 **Automatic changelogs**: Generated from commit history
- 🔍 **Quality gates**: Security and test validation before release
- 🏷️ **Proper tagging**: Semantic version tags created automatically
- 📦 **GitHub releases**: Professional release pages with notes

## Continuous Integration & Testing

This repository includes comprehensive CI/CD automation with GitHub Actions to ensure code quality and reliability.

### 🧪 Test Automation

**Automatic Testing on Every Push/PR:**

- ✅ **RSpec test suite** - Full application testing
- ✅ **System tests** - End-to-end browser testing
- ✅ **Matrix testing** - Multiple Ruby (3.4.6, 3.3.0) and Node.js (20, 22) versions
- ✅ **Database setup** - Automated test database creation and schema loading
- ✅ **Asset compilation** - JavaScript bundling with esbuild

### 🔍 Code Quality Checks

**Automated Quality Assurance:**

- ✅ **RuboCop** - Ruby code style and best practices
- ✅ **Slim Lint** - Template validation for Slim files
- ✅ **Brakeman** - Static security analysis for Rails
- ✅ **Bundle Audit** - Gem dependency vulnerability scanning
- ✅ **Quality reports** - Automated PR comments with results

### 🚀 Workflow Overview

1. **CI Workflow** (`.github/workflows/ci.yml`)

   - Runs on: Push to main, Pull Requests
   - Duration: ~5-10 minutes
   - Tests: RSpec, System tests, Security scans
   - Matrix: Multiple Ruby/Node.js versions

2. **Code Quality** (`.github/workflows/quality.yml`)

   - Runs on: Push to main, Pull Requests
   - Duration: ~2-3 minutes
   - Checks: RuboCop, Slim Lint, Brakeman, Bundle Audit
   - Reports: Automated PR comments with results

3. **Version Management** (Multiple workflows)
   - Automatic version bumping based on commit messages
   - Release creation with changelogs
   - Manual version control when needed

### 📊 Status Monitoring

Monitor the health of your repository with status badges:

- **CI Status**: Shows if tests are passing
- **Code Quality**: Indicates linting and security status
- **Version Automation**: Tracks automated releases
- **License & Dependencies**: Project metadata

### 🔧 Local Testing

For detailed testing commands and troubleshooting, see [LINUX_SETUP.md](LINUX_SETUP.md).

### 🎯 PR Workflow

When you create a pull request:

1. **Automated testing** runs across multiple Ruby/Node versions
2. **Code quality** analysis provides detailed feedback
3. **Security scanning** identifies potential vulnerabilities
4. **Quality summary** posted as PR comment
5. **Status checks** must pass before merging

This ensures every change maintains the high quality and security standards of the Rails 8 template.

## Security

This application includes automated security vulnerability scanning using `bundler-audit`:

### Automatic Security Scanning

**During Development:**

- Security check runs automatically when starting `./bin/dev`
- Vulnerability database is updated and checked during Dev Container setup
- Continuous monitoring alerts you to new vulnerabilities

**Available Commands:**

```bash
# Full security check with database update
rake security:check

# Update vulnerability database only
rake security:update

# Direct bundle-audit commands
bundle exec bundle-audit update
bundle exec bundle-audit check
```

**What it Checks:**

- Known security vulnerabilities in your gem dependencies
- Outdated gems with security patches available
- Advisory database maintained by the Ruby security community

**Integration Points:**

- ✅ **Dev Container setup**: Automatic vulnerability check on first run
- ✅ **Development server**: Continuous monitoring via `./bin/dev`
- ✅ **Rake tasks**: Easy manual testing and CI/CD integration
- ✅ **CI/CD ready**: Exit codes for automated pipeline failures

## Deployment

This application is configured for deployment with:

- Kamal (Rails 8 default)
- Docker containers
- Automatic asset building in production

For production deployment, JavaScript assets will be automatically built during the deployment process.

## Troubleshooting

### Dev Container Issues

**Container won't start:**

- Ensure Docker Desktop is running
- Try rebuilding: `Ctrl+Shift+P` → "Dev Containers: Rebuild Container"

**Setup script fails:**

- Check the setup log in VS Code terminal
- Manually run: `.devcontainer/setup.sh`
- Verify Node.js is available: `node --version`

**JavaScript assets not building:**

- Run manually: `npm run build`
- Check `package.json` scripts section
- Verify esbuild is installed: `npm list esbuild`

### Linux Setup Issues

For Linux-specific troubleshooting, see [LINUX_SETUP.md](LINUX_SETUP.md).
