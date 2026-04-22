# Linux TUI User Manager 🐧

A lightweight, interactive Terminal User Interface (TUI) utility for managing Linux users and groups. Built entirely with Bash and `whiptail`, this script simplifies system administration tasks by wrapping standard Linux user management commands into an easy-to-navigate menu system.

## 🚀 Features

* **User Management:** Add, modify (rename), and delete users.
* **Group Management:** Add, modify (rename), and delete user groups.
* **System Enumeration:** Scrollable lists displaying all current users and groups on the system.
* **Account Security:** Quickly lock (disable) or unlock (enable) user accounts.
* **Password Management:** Prompt to change passwords for specific users.
* **Interactive UI:** Fully menu-driven interface using `whiptail`.

## 📋 Prerequisites

To run this script, your system must have:
* A Linux-based operating system.
* `whiptail` installed (usually pre-installed on Debian/Ubuntu-based and RHEL-based systems).
* **Root privileges:** The script executes administrative commands (`useradd`, `usermod`, etc.) and must be run as root or via `sudo`.

## 🛠️ Usage

1. Clone this repository or download the script:
   ```bash
   git clone https://github.com/FatemaAhmedKhalil/TUI_User_Manager
   cd TUI_User_Manager
   ```
