#!/bin/bash

# ╔═══════════════════════════════════════════════════════════╗
# ║                                                           ║
# ║                   🐺 FrekiFerð - Manjaro                  ║
# ║            Lightweight Config & Package Transfer          ║
# ║                                                           ║
# ║          Seamlessly migrate your personal setup           ║
# ║                 between Manjaro systems                   ║
# ║                                                           ║
# ╚═══════════════════════════════════════════════════════════╝

# Define default variables
BACKUP_DIR="${HOME}/manjaro_backup"
DEFAULT_RETRIEVE_DIR="${HOME}/Downloads"
TIMESTAMP=$(date +%Y%m%d_%H%M%S)
CONFIG_BACKUP="${BACKUP_DIR}/config_backup_${TIMESTAMP}.tar.gz"
PACKAGE_LIST="${BACKUP_DIR}/package_list_${TIMESTAMP}.txt"
LOG_FILE="${BACKUP_DIR}/backup_restore.log"

# Functions for each operation
save_config() {
    mkdir -p "$BACKUP_DIR"
    echo "[$(date)] Saving list of installed packages..." >> "$LOG_FILE"
    pacman -Qqe > "$PACKAGE_LIST"
    echo "Package list saved to $PACKAGE_LIST"
    
    echo "[$(date)] Compressing .config folder..." >> "$LOG_FILE"
    tar -czvf "$CONFIG_BACKUP" -C "$HOME" .config
    echo "Configuration saved to $CONFIG_BACKUP"

    if tar -tvf "$CONFIG_BACKUP" > /dev/null; then
        echo "Backup archive verified successfully."
    else
        echo "Backup archive may be corrupted. Please check!" >&2
        exit 1
    fi

    find "$BACKUP_DIR" -type f -mtime +30 -name '*.tar.gz' -delete
    echo "[$(date)] Backup complete. Files saved in $BACKUP_DIR." >> "$LOG_FILE"
}

restore_config() {
    if [ -f "$PACKAGE_LIST" ]; then
        echo "Checking availability of packages..."
        while IFS= read -r package; do
            if ! pacman -Si "$package" &>/dev/null; then
                echo "Warning: Package $package is not available in the repositories."
            fi
        done < "$PACKAGE_LIST"
        echo "Restoring available packages..."
        sudo pacman -S --needed - < "$PACKAGE_LIST"
    else
        echo "Package list not found. Aborting restore."
        exit 1
    fi

    if [ -f "$CONFIG_BACKUP" ]; then
        echo "Restoring configuration files..."
        if [ -d "${HOME}/.config" ]; then
            read -p ".config directory already exists. Overwrite? (y/n): " overwrite
            if [[ "$overwrite" == "y" ]]; then
                tar -xzvf "$CONFIG_BACKUP" -C "$HOME" --overwrite
                echo "Configuration restored."
            else
                echo "Skipping configuration restore."
            fi
        else
            tar -xzvf "$CONFIG_BACKUP" -C "$HOME"
            echo "Configuration restored."
        fi
    else
        echo "Configuration backup not found. Aborting restore."
        exit 1
    fi
}

setup_backup_folder() {
    local target_dir="${1:-$DEFAULT_RETRIEVE_DIR}"
    mkdir -p "$target_dir/manjaro_backup"
    cp "$0" "$target_dir/manjaro_backup/backup_script.sh"
    echo "Setup complete. Please place your backup files in $target_dir/manjaro_backup and run:"
    echo "  cd $target_dir/manjaro_backup && ./backup_script.sh restore"
}

# Helper function to display the header and usage instructions
show_help() {
    echo "╔═══════════════════════════════════════════════════════════╗"
    echo "║                                                           ║"
    echo "║                   🐺 FrekiFerð - Manjaro                  ║"
    echo "║            Lightweight Config & Package Transfer          ║"
    echo "║                                                           ║"
    echo "║          Seamlessly migrate your personal setup           ║"
    echo "║                 between Manjaro systems                   ║"
    echo "║                                                           ║"
    echo "╚═══════════════════════════════════════════════════════════╝"
    echo ""
    echo "Usage: $0 {save|restore|setup [target_directory]}"
    echo "  save    - Save the current configuration and package list"
    echo "  restore - Restore configuration and package list from backup"
    echo "  setup   - Prepare the backup folder on a new computer for restoration"
}

# Main script logic
case "$1" in
    save)
        save_config
        ;;
    restore)
        restore_config
        ;;
    setup)
        setup_backup_folder "$2"
        ;;
    *)
        show_help
        exit 1
        ;;
esac
