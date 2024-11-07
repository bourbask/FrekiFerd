# Contributing to FrekiFerð

Thank you for your interest in contributing to FrekiFerð! Your help is appreciated, whether you're fixing a bug, suggesting improvements, or adding new features. Please follow these guidelines to ensure smooth collaboration.

---

> **Back to main README**: [FrekiFerð README](../README.md)

---

## 🐛 Issues

If you find a bug or have a feature request, please [open an issue](https://github.com/bourbask/FrekiFerd/issues). Make sure to include:
- A clear description of the problem or feature.
- Steps to reproduce (if reporting a bug).
- Any relevant screenshots or logs.

---

## 🔧 Pull Requests

To submit a pull request:
1. **Fork** the repository and create your branch:
   - Branch names should be descriptive, e.g., `fix/readme-typo` or `feature/setup-enhancement`.
2. Make your changes, ensuring the code is well-documented and tested where possible.
3. **Commit** your changes following the Conventional Commits standard (details below).
4. **Submit** the pull request, and include a description of the changes and any related issue numbers.

---

## 🚧 Development Process

To maintain a stable codebase and ensure smooth collaboration, we use a **branching model** with strict rules for merging and pushing. Below is the workflow for developing and contributing to FrekiFerð.

### Branch Structure

- **`main`**: The production branch containing the stable, public release. No direct pushes or merge requests (MRs) are allowed on `main`.
- **`develop`**: The staging/qualification branch where new features and fixes are integrated for testing. All feature branches are merged here.

> **Note**: Only maintainers can merge `develop` into `main`, and only after careful testing and validation.

### Step-by-Step Development Workflow

1. **Clone `develop` for New Features or Fixes**
   - To start working on a new feature or bug fix, first clone the `develop` branch:
     ```bash
     git clone -b develop https://github.com/yourusername/FrekiFerd.git
     ```
   - Create a new branch off `develop` with a descriptive name, for example:
     ```bash
     git checkout -b feature/my-new-feature
     ```

2. **Implement Changes and Use Conventional Commits**
   - Make your changes on the feature branch.
   - Commit changes using [Conventional Commit messages](https://www.conventionalcommits.org/) to ensure consistency and enable automated changelog generation.

3. **Open a Pull Request to `develop`**
   - Once your changes are ready, open a **pull request (PR)** from your feature branch to `develop`. Make sure to:
     - Add a descriptive title and explanation of your changes.
     - Apply a **label** to the PR to indicate the level of impact:
       - **`major`**: For breaking changes or significant features
       - **`minor`**: For new features without breaking changes
       - **`patch`**: For bug fixes or minor improvements

4. **Merge into `develop`**
   - When the PR is reviewed and approved, it will be merged into `develop`.
   - **CI/CD Workflow on `develop`**:
     - Merging into `develop` triggers an automated workflow to:
       - Update the version number based on the PR label.
       - Append changes to the `CHANGELOG.md` file.
       - Commit the updated changelog and version back to `develop`.

5. **Preparing for Production Release**
   - Once `develop` is stable and all features/fixes have been tested, maintainers will open a **pull request from `develop` to `main`**.
   - This merge into `main` is restricted to maintainers only and triggers a **production release workflow** to finalize the changelog on `main`.

### Summary of Branch Rules

| Branch   | Description                            | Push Access      | Merge Requests  |
|----------|----------------------------------------|------------------|-----------------|
| `main`   | Production branch, stable releases     | Restricted       | Not allowed     |
| `develop`| Staging branch for new features/fixes  | Maintainers only | Allowed         |
| Feature  | Feature-specific branches off `develop`| Developers       | Merged to `develop` |

This process ensures that only well-tested, stable code reaches `main`, while `develop` serves as the integration branch for new development. By following this workflow, we can maintain a stable production release and track version changes effectively.

---

## 📋 Commit Message Guidelines

We follow the [Conventional Commits](https://github.com/conventional-changelog/commitlint/tree/master/%40commitlint/config-conventional) standard for commit messages. This convention helps us maintain a readable history and automatically generate changelogs.

### Format

Use the following format for commit messages:

```bash
<type>[optional scope]: <description>

[optional body]

[optional footer(s)]
```

### Examples

- **feat**: feat: add setup command for backup directory
- **fix**: fix: resolve error in restore function
- **docs**: docs: update README with usage examples
- **style**: style: adjust header alignment in helper function

### Common Commit Types

- **feat**: A new feature
- **fix**: A bug fix
- **docs**: Documentation only changes
- **style**: Changes that do not affect the meaning of the code (white-space, formatting, missing semi-colons, etc.)
- **refactor**: A code change that neither fixes a bug nor adds a feature
- **perf**: A code change that improves performance
- **test**: Adding missing tests or correcting existing tests
- **chore**: Changes to the build process or auxiliary tools and libraries

### Why Commit Standards?

Following these guidelines helps us:
- Maintain a clean commit history.
- Auto-generate changelogs.
- Easily identify the nature of changes in each commit.

---

## 🌟 Coding Standards

- Write clear, concise, and self-explanatory code.
- Add comments to explain complex logic or functions.
- Follow the general style and structure of the codebase.

---

## 💬 Code of Conduct

Please adhere to our [Code of Conduct](CODE_OF_CONDUCT.md) to foster a welcoming and collaborative environment.

---

Thank you for your contributions and for helping improve FrekiFerð! 🐺✨

