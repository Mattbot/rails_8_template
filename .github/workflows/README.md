# GitHub Actions Workflows

This repository includes several automated workflows for CI/CD, testing, and release management:

## 🧪 CI (Continuous Integration)
- **Trigger**: Push to main/master, Pull Requests
- **Purpose**: Runs comprehensive test suite and security checks
- **Duration**: ~5-10 minutes
- **Matrix**: Ruby 3.4.6 & 3.3.0, Node.js 20 & 22
- **Badge**: ![CI](https://github.com/Mattbot/rails_8_template/workflows/CI/badge.svg)

**What it does:**
- Runs RSpec test suite
- Executes system tests with Chrome
- Performs security scans (Brakeman, Bundle Audit)
- Builds JavaScript assets with esbuild
- Tests across multiple Ruby/Node.js versions

## 🔍 Code Quality
- **Trigger**: Push to main/master, Pull Requests  
- **Purpose**: Automated code quality and style checking
- **Duration**: ~2-3 minutes
- **Badge**: ![Code Quality](https://github.com/Mattbot/rails_8_template/workflows/Code%20Quality/badge.svg)

**What it does:**
- RuboCop style and best practice checking
- Slim template linting
- Brakeman security analysis
- Bundle Audit vulnerability scanning
- Posts quality summary to PRs

## 🔄 Auto Version Bump
- **Trigger**: Push to main/master branch
- **Purpose**: Automatically bumps version based on conventional commits
- **Badge**: ![Version Bump](https://github.com/Mattbot/rails_8_template/workflows/Auto%20Version%20Bump/badge.svg)

## 🚀 Create Release  
- **Trigger**: Push of version tags (v*.*.*)
- **Purpose**: Creates GitHub releases with changelogs
- **Badge**: ![Create Release](https://github.com/Mattbot/rails_8_template/workflows/Create%20Release/badge.svg)

## 🎛️ Manual Version Bump
- **Trigger**: Manual workflow dispatch
- **Purpose**: On-demand version bumping with custom notes
- **Badge**: ![Manual Version Bump](https://github.com/Mattbot/rails_8_template/workflows/Manual%20Version%20Bump/badge.svg)

## Workflow Files

- `.github/workflows/ci.yml` - Comprehensive CI with testing and security
- `.github/workflows/quality.yml` - Fast code quality checks  
- `.github/workflows/version-bump.yml` - Automatic version bumping
- `.github/workflows/release.yml` - Release creation and changelog generation  
- `.github/workflows/manual-version-bump.yml` - Manual version management