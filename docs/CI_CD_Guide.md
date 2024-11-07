# 🛠 CI/CD Guide for FrekiFerð

This document provides an overview of the CI/CD setup for FrekiFerð. It explains the workflows, their purposes, and how to work with them effectively.

---

> **Back to main README**: [FrekiFerð README](../README.md)

---

## 🎯 Purpose of CI/CD in FrekiFerð

The CI/CD pipeline automates the following tasks:
1. **Version Management**: Automatically increments the version number based on the impact level of changes.
2. **Changelog Generation**: Updates `CHANGELOG.md` with details of new features, fixes, and improvements.
3. **Release Management**: Keeps the `develop` branch up-to-date with the latest version and changelog entries, and prepares the `main` branch for production releases.

---

## 🌿 Branching Model

- **`main`**: Production-ready branch, containing stable releases.
- **`develop`**: Staging/qualification branch, where new features and fixes are merged for final testing.
- **Feature Branches**: Created off `develop`, used for implementing new features or bug fixes.

> **Note**: Only maintainers can merge to `main`. PRs should be opened against `develop` for all changes.

---

## 🚀 CI/CD Workflows

### 1. Versioning and Changelog Update

**Location**: `.github/workflows/versioning.yml`  
**Triggered by**: Merging a PR into the `develop` branch

This workflow automates version bumping and changelog updates based on Conventional Commits. It’s triggered when a pull request (PR) is merged into `develop`. Here’s how it works:

1. **Check Labels**: The CI/CD pipeline reads the PR labels (`major`, `minor`, or `patch`) to determine the type of version bump:
   - **major**: For breaking changes
   - **minor**: For new features without breaking changes
   - **patch**: For bug fixes or minor changes

2. **Version Bump**:
   - The workflow uses `npm version` to update the version number in `package.json` and automatically tags the commit with the new version.

3. **Generate Changelog**:
   - Using `conventional-changelog`, it generates a structured `CHANGELOG.md` entry, appending changes based on commit messages.

4. **Commit and Push**:
   - The updated `CHANGELOG.md` and version files are committed back to the `develop` branch.

### 2. Production Release Workflow

**Location**: `.github/workflows/release.yml`  
**Triggered by**: Merging `develop` into `main`

Once the `develop` branch is ready for production, the final changes are merged into `main`. This workflow updates the production `CHANGELOG.md` and finalizes the release.

1. **Generate Production Changelog**:
   - The workflow adds any remaining changelog entries specific to the production release.

2. **Commit and Push**:
   - The changelog is committed and pushed to `main`, ensuring `main` is updated with the latest changes.

---

## 👤 How to Use the CI/CD Workflows

1. **Developing a New Feature or Fix**:
   - Create a feature branch from `develop`, e.g., `feature/my-new-feature`.
   - Make changes and commit them using [Conventional Commit messages](https://www.conventionalcommits.org/).
   - Once complete, open a pull request to `develop`.

2. **Setting the Version Bump**:
   - When opening the PR, add a label to determine the impact:
     - **`major`**: Breaking changes
     - **`minor`**: New features without breaking changes
     - **`patch`**: Bug fixes or small changes

3. **Merging to `develop`**:
   - When the PR is merged into `develop`, the `versioning.yml` workflow is triggered.
   - This workflow:
     - Updates the version based on the label.
     - Appends relevant changes to `CHANGELOG.md`.
     - Commits the changes back to `develop`.

4. **Preparing a Production Release**:
   - Once `develop` is ready for production, open a PR to merge `develop` into `main`.
   - When this PR is merged, the `release.yml` workflow runs, updating the production changelog and finalizing the release.

---

## 📝 Summary

The CI/CD setup for FrekiFerð allows for an automated, structured release process:

1. **Versioning and Changelog**:
   - Automatic versioning and changelog updates on `develop` based on PR labels.

2. **Production Releases**:
   - Controlled merging from `develop` to `main` ensures stable, production-ready releases.

3. **Commit Standards**:
   - Follow Conventional Commit standards to ensure consistent changelog entries.

This CI/CD process streamlines development, minimizes manual tasks, and keeps both `develop` and `main` branches organized and up-to-date.

---

Feel free to reach out for any clarifications or if you need help using the CI/CD workflows!

