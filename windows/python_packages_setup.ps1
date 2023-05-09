# Work in progress: untested

# Define the name of the environment and the packages to install
$envName = "my-environment" # todo: read environment from config file
$packages = "numpy", "pandas" # todo: read packages from packages.yml file

# Activate the environment
conda activate $envName # in windows, need to have 

# Install the packages
foreach ($package in $packages) {
    conda install $package -y
}

# Verify the installation
foreach ($package in $packages) {
    Write-Host "Checking version of $package"
    python -c "import $package; print('$package version:', $package.__version__)"
}
