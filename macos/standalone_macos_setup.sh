#!/bin/bash

# Check if Homebrew is installed
if ! command -v brew &> /dev/null; then
    echo "Homebrew not found. Installing Homebrew..."
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

# Install yq to read YAML file
if brew list yq &> /dev/null; then
    echo "yq is already installed. Skipping..."
else
    echo "Installing $formula..."
    brew install yq
fi

# Install formulae using Homebrew
echo "Installing formulae..."
for formula in $(yq '.formulae[]' packages.yml); do
    if brew list "$formula" &> /dev/null; then
        echo "$formula is already installed. Skipping..."
    else
        echo "Installing $formula..."
        brew install "$formula"
    fi
done

# Install casks using Homebrew
echo "Installing casks..."
for cask in $(yq '.casks[]' packages.yml); do
    if brew list --cask "$cask" &> /dev/null; then
        echo "$cask is already installed. Skipping..."
    else
        echo "Installing $cask..."
        brew install --cask "$cask"
    fi
done

echo "Done."
read -n 1 -s -r -p "Press any key to close this terminal..."