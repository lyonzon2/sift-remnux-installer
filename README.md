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
   git clone https://github.com/your-username/sift-remnux-installer.git
   cd sift-remnux-installer
2. Run the script:
   ```bash
   sudo ./sift-remnux-install.sh

Script Details
The script performs the following steps:

Download and Install cast Tool: cast is a command-line installer for SIFT. It is downloaded from the official GitHub releases and installed as a .deb package.

Set up SaltStack Key and Sources: Adds the SaltStack public key and source list required for installing SIFT through SaltStack.

Install SIFT: Runs the cast install command to install SIFT in server mode, providing forensic tools directly on REMnux.

License
This project is licensed under the MIT License. See the LICENSE file for more details.
