# 🐺 FrekiFerð

*FrekiFerð* ([/ˈfreːki ˈfɛrθ/](https://www.ipachart.com/)) is your go-to solution for quickly transferring your custom Manjaro configurations and installed packages between systems. Lightweight and efficient, FrekiFerð makes it simple to keep your personalized setup consistent across devices. Enjoy a smooth setup experience that’s fast, reliable, and entirely free to use. 🌠

## ✨ Why FrekiFerð?

Have you ever set up your Manjaro OS with all the right tweaks, installed your favorite tools, only to dread the thought of redoing it all on a new computer? That’s where *FrekiFerð* comes in! It lets you:

- 📦 **Save** your installed packages and `.config` files.
- 💨 **Transfer** them to a new system, effortlessly.
- 🔄 **Restore** your configuration with just a few simple commands.

All without needing to clone the entire OS! Just your essential settings and installed software – nothing more, nothing less.

---

## 📄 Documentation Summary

For more detailed information about the CI/CD setup, contributing guidelines, and more, refer to the following documentation files in the `docs` folder:

- [CI/CD Guide](docs/CI_CD_Guide.md): Detailed explanation of the CI/CD workflows, versioning, and changelog generation process.
- [Contributing Guide](docs/CONTRIBUTING.md): Instructions for contributing to FrekiFerð, including commit message standards and PR guidelines.
- [Code of Conduct](docs/CODE_OF_CONDUCT.md): Community guidelines to ensure respectful and inclusive interactions.

These documents will help you get the most out of FrekiFerð, whether you're a user or a contributor!

---

## 🚀 Getting Started

### Installation

1. **Clone the repository**:  
   ```bash
   git clone https://github.com/yourusername/FrekiFerd.git  
   cd FrekiFerd  
   ```

2. **Make the script executable**:  
   ```bash
   chmod +x backup_script.sh  
   ```

3. You’re ready to use *FrekiFerð*! 🎉

---

## 🔧 How to Use FrekiFerð

The script has three main commands to keep things simple:

### 1. Save Your Configuration 📝
Save the current package list and `.config` folder from your Manjaro OS.

```bash
./backup_script.sh save  
```

This creates a `manjaro_backup` folder in your home directory with:
- A list of your installed packages (`package_list_<timestamp>.txt`)
- A compressed copy of your `.config` folder (`config_backup_<timestamp>.tar.gz`)

### 2. Setup a New Computer for Restore ⚙️
If you're setting up a new Manjaro system, run this command to prepare a `manjaro_backup` folder in a specific location (like `~/Downloads` by default).

```bash
./backup_script.sh setup [optional_path]  
```

This creates a `manjaro_backup` folder where you can place your saved configuration files.

### 3. Restore Configuration on the New System 🔄
Once your backup files are in place, you can restore the configuration and packages on the new machine:

```bash
cd [path_to_backup_folder]  
./backup_script.sh restore  
```

This will:
- Install packages from your saved package list.
- Restore your `.config` settings (with a prompt before overwriting any existing files).

---

## 🔍 Pros and Cons

| ✅ Pros                               | ❌ Cons                                         |
|---------------------------------------|-------------------------------------------------|
| ✅ Simple, quick setup and transfer   | ❌ Only for Manjaro (or Arch-based) systems     |
| ✅ Lightweight – only saves configs   | ❌ Doesn’t transfer full OS setup               |
| ✅ Safe restore prompts               | ❌ Requires basic knowledge of terminal         |
| ✅ Keeps personal configurations      |                                                 |

---

## 🛠 Customizing FrekiFerð

Want to adjust how *FrekiFerð* works? Here are some tweaks you can make:

- **Change Backup Directory**: You can modify `BACKUP_DIR` inside the script to use a custom location for backups.
- **Retention Policy**: By default, backups older than 30 days are automatically deleted. You can adjust this by editing the `-mtime +30` parameter in the `save_config` function.
- **Path for Setup**: When using the `setup` command, specify a custom path for the backup folder to better organize your files.

---

## 📄 License

This project is licensed under the MIT License – see the [LICENSE](LICENSE) file for details.

---

## 🤝 Contributing

Contributions are welcome! Feel free to fork the project and submit pull requests. See [CONTRIBUTING.md](CONTRIBUTING.md) for guidelines.

**Enjoy your journey with FrekiFerð!** 🐺✨

