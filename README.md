# SIFT-REMnux Installer

This repository provides an automated script to add the SIFT Workstation tools to an existing REMnux system, combining malware analysis and digital forensics functionalities in a single environment.

## About

If most of your work involves malware analysis, you may prefer starting with a REMnux system and adding the SIFT Workstation tools. This setup will allow you to retain the look and feel of REMnux while benefiting from the forensics capabilities provided by SIFT.

This script automates the process by installing the necessary SaltStack dependencies, setting up the required package sources, and utilizing the `cast` tool to install SIFT in `server` mode.

## Prerequisites

- A REMnux system with internet access.
- Sudo privileges on the system.

## Installation Instructions

To set up your combined REMnux and SIFT environment:

1. Clone the repository:
   ```bash
   git clone https://github.com/lyonzon2/sift-remnux-installer.git
   cd sift-remnux-installer
2. Run the script:
   ```bash
   sudo ./sift-remnux-install.sh
   
## Error Handling

If you encounter repository conflicts during the installation, such as the following errors:

- **`E: Conflicting values set for option Signed-By`**
- **`One or more requisite failed: sift.python3-packages.pyhindsight.sift-python3-packages-pyhindsight`**

You can resolve these issues by running the `fix_salt_repositories.sh` script included in this repository. 
1. run
```bash
cd sift-remnux-installer
sudo ./fix_salt_repositories.sh
```

**instalation Script Details**
The script performs the following steps:

Download and Install cast Tool: cast is a command-line installer for SIFT. It is downloaded from the official GitHub releases and installed as a .deb package.

Set up SaltStack Key and Sources: Adds the SaltStack public key and source list required for installing SIFT through SaltStack.

Install SIFT: Runs the cast install command to install SIFT in server mode, providing forensic tools directly on REMnux.

**Error Handling Script Details**

The script performs the following steps:

1. **Move the conflicting keyring to `/tmp/`**: This step temporarily moves the old keyring that is causing the conflict.
2. **Update the repository source configuration**: It updates the `Signed-By` field in the `/etc/apt/sources.list.d/salt.sources` file to point to the correct keyring.
3. **Comment out the duplicate repository entry in the Salt list**: The script disables one of the conflicting entries in the `/etc/apt/sources.list.d/salt.list` file.
4. **Run `sudo apt-get update`**: This command refreshes the package list to ensure the changes take effect.
5. **Re-run the SIFT installation**: After resolving the conflicts, the script continues the SIFT installation automatically using the `cast` tool.

After running the script, the installation will automatically continue without the repository conflicts.

License
This project is licensed under the MIT License. See the LICENSE file for more details.
