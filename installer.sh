#!/bin/bash

ofc_packages=()
aur_packages=()
needs_upgrade=false

# Check if the base-devel group is installed
if ! pamac list --installed | grep -q "base-devel"; then
  # Install the base-devel group
  pamac build --no-confirm base-devel
fi

# Iterate over the packages in the file
while read pkg; do
  # Skip empty lines and lines starting with #
  if [ -z "$pkg" ] || [[ "$pkg" =~ ^[[:blank:]]*"#" ]]; then
    continue
  fi

  # Check if the package is already installed
  if pamac list --installed | grep -q "$pkg"; then
    # Check if the package is up to date
    if pamac list --upgrades | grep -q "$pkg"; then
      # Will call upgrade at the end
      needs_upgrade=true
    else
      echo "Skipping $pkg, already up to date"
    fi
  else
    # Is in the official repos?
    if pamac info "$pkg" --no-aur &>/dev/null; then
      ofc_packages+=($pkg)
    # Is in "official" AUR?
    elif pamac info "$pkg" --aur &>/dev/null; then
      aur_packages+=($pkg)
    # Is in binaries AUR?
    elif pamac info "${pkg}-bin" --aur &>/dev/null; then
      aur_packages+=("${pkg}-bin")
    # Is in git?
    elif pamac info "${pkg}-git" --aur &>/dev/null; then
      aur_packages+=("${pkg}-git")
    else
      echo "Package $pkg not found"
    fi
  fi
done <packages.txt

# Install updates
if needs_upgrade; then
  pamac upgrade --no-confirm --aur
fi

# Install packages
echo "${packages[@]}" | xargs pamac install --no-confirm
echo "${packages[@]}" | xargs pamac build --no-confirm
