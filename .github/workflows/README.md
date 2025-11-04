# GitHub Actions Workflows

This repository includes several automated workflows:

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

- `.github/workflows/version-bump.yml` - Automatic version bumping
- `.github/workflows/release.yml` - Release creation and changelog generation  
- `.github/workflows/manual-version-bump.yml` - Manual version management