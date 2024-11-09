#!/bin/bash

fix_salt_repositories() {
  # Step 1: Move the conflicting keyring to /tmp/
  echo "Moving conflicting keyring to /tmp/..."
  sudo mv /etc/apt/keyrings/salt-archive-keyring.pgp /tmp/

  # Step 2: Update the Signed-By path in /etc/apt/sources.list.d/salt.sources
  echo "Updating Signed-By path in /etc/apt/sources.list.d/salt.sources..."
  sudo sed -i 's|Signed-By: /etc/apt/keyrings/salt-archive-keyring.pgp|Signed-By: /etc/apt/keyrings/salt-archive-keyring-2023.pgp|' /etc/apt/sources.list.d/salt.sources

  # Step 3: Comment out the first line in /etc/apt/sources.list.d/salt.list
  echo "Commenting out the first line in /etc/apt/sources.list.d/salt.list..."
  sudo sed -i '1s/^/#/' /etc/apt/sources.list.d/salt.list

  # Step 4: Run apt-get update to refresh the repository list
  echo "Running sudo apt-get update to update package lists..."
  sudo apt-get update

  # Step 5: Continue installation using salt-call
  echo "Re-running the SIFT SaltStack installation..."
  sudo cast install --mode=server teamdfir/sift-saltstack
}

# Execute the function
fix_salt_repositories
