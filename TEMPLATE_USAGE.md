# Template Usage Guide

This repository is designed as a **GitHub Template Repository** for quickly starting new Rails 8 applications.

## 🚀 Using This Template

### Method 1: GitHub Template (Recommended)
1. **Click "Use this template"** on the GitHub repository page
2. **Create your new repository** with your desired name
3. **Clone your new repository**:
   ```bash
   git clone https://github.com/YOUR_USERNAME/YOUR_PROJECT_NAME.git
   cd YOUR_PROJECT_NAME
   ```
4. **Run the setup script**:
   ```bash
   ./bin/template-setup YOUR_PROJECT_NAME
   ```

### Method 2: Manual Clone
1. **Clone this repository**:
   ```bash
   git clone https://github.com/Mattbot/rails_8_template.git YOUR_PROJECT_NAME
   cd YOUR_PROJECT_NAME
   ```
2. **Run the setup script**:
   ```bash
   ./bin/template-setup YOUR_PROJECT_NAME
   ```

## 🔧 What the Setup Script Does

The `./bin/template-setup` script automatically:

- ✅ **Renames the application** module in `config/application.rb`
- ✅ **Updates package.json** with your project name
- ✅ **Customizes README.md** title and references
- ✅ **Updates Docker configurations** with new project name
- ✅ **Resets version** to 1.0.0
- ✅ **Generates new Rails credentials** for security
- ✅ **Initializes fresh git history** 
- ✅ **Removes template setup script** (self-cleanup)

## 📦 What You Get

### 🛠️ **Modern Rails 8 Setup**
- **Rails 8.0.3** with latest features
- **Ruby 3.4.6** for optimal performance
- **esbuild** for fast JavaScript bundling
- **Slim templates** for clean HTML generation
- **SQLite** database (easily switchable)

### 🐳 **Development Environment**
- **Dev Container** with zero-config setup
- **Docker Compose** for production-like development
- **Direnv** for environment variable management
- **VS Code extensions** pre-configured

### 🧪 **Testing & Quality**
- **RSpec** test framework
- **RuboCop** with Rails Omakase styling
- **Brakeman** security scanner
- **Bundle Audit** for gem vulnerabilities
- **Slim Lint** for template validation

### 🚀 **CI/CD & Automation**
- **GitHub Actions** workflows for CI/CD
- **Automatic version bumping** with conventional commits
- **Security scanning** in CI pipeline
- **Quality checks** with automated PR comments

### 📊 **Version Management**
- **Semantic versioning** with rake tasks
- **Automated releases** via GitHub Actions
- **Version endpoints** for monitoring
- **Changelog generation** from commits

## 🎯 **Quick Start After Setup**

1. **Start development environment**:
   ```bash
   # Option 1: Dev Container (Recommended)
   # Open in VS Code → "Reopen in Container"
   
   # Option 2: Local development
   ./bin/dev
   ```

2. **Customize for your project**:
   - Update `README.md` with your project description
   - Modify `config/application.rb` settings as needed
   - Add your specific gems to `Gemfile`
   - Configure database if switching from SQLite

3. **Set up your repository**:
   ```bash
   git remote add origin https://github.com/YOUR_USERNAME/YOUR_PROJECT_NAME.git
   git push -u origin main
   ```

## 🔧 **Customization Points**

### **Database**
- **SQLite** (default) - Perfect for development and small apps
- **PostgreSQL** - Add `gem 'pg'` and update `database.yml`
- **MySQL** - Add `gem 'mysql2'` and update `database.yml`

### **Frontend**
- **esbuild** (included) - Fast JavaScript bundling
- **Tailwind CSS** - Add via `jsbundling-rails`
- **Bootstrap** - Traditional CSS framework option

### **Authentication**
- **Devise** - Popular Rails authentication
- **Omniauth** - OAuth provider integration
- **Custom** - Build your own authentication

### **Background Jobs**
- **Solid Queue** (Rails 8 default)
- **Sidekiq** - Redis-based job processing
- **Delayed Job** - Database-based jobs

## 📋 **Template Maintenance**

This template is regularly updated with:
- Latest Rails and Ruby versions
- Security patches and vulnerability fixes
- New development tools and best practices
- Enhanced CI/CD workflows

## 🆘 **Getting Help**

- **Issues**: Use GitHub Issues for bugs or feature requests
- **Discussions**: Use GitHub Discussions for questions
- **Documentation**: Check `LINUX_SETUP.md` for manual setup
- **Examples**: Look at commit history for usage patterns

## 📄 **License**

This template is available under the MIT License. Use it freely for your projects!