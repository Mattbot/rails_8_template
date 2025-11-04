# Rails 8 Template

This is a Rails 8 application template configured for modern development with dev containers and esbuild.

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
- ✅ VS Code extensions (Slim, Ruby LSP, etc.)
- ✅ Environment configuration

#### Option 2: Manual Linux Environment Setup

If you prefer to set up the environment manually or aren't using Dev Containers:
   
   **Install Node.js (using fnm - Fast Node Manager)**
   ```bash
   curl -fsSL https://fnm.vercel.app/install | bash
   source ~/.bashrc
   fnm install --lts
   fnm use lts-latest
   ```

   **Install Ruby dependencies**
   ```bash
   bundle install
   ```

   **Install JavaScript dependencies**
   ```bash
   npm install
   # or
   yarn install
   ```

4. **Database Setup**
   ```bash
   rails db:create
   rails db:migrate
   rails db:seed
   ```

5. **Start the Development Server**
   ```bash
   ./bin/dev
   ```
   This starts both the Rails server and esbuild in watch mode.

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

### Direnv (Optional)

Several environment variables necessary to run this project in Docker can be loaded via 
Direnv. Direnv allows you to dynamically load environment variables into your shell environment
relative to your current path. If you change to a directory with a `.envrc`,
direnv will load those variables into your shell and remove them when you change
directories out of that directory's path.

**Installation:**

*Linux/Ubuntu:*
```bash 
sudo apt install direnv
```

*macOS:*
```bash 
brew install direnv
``` 

*Windows WSL2:*
```bash
sudo apt install direnv
```

**Setup:**
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