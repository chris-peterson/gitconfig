# List the recipes
default:
    @just --list

# Serve the docs site with live reload, and open it
docs:
    docsify serve docs --open

# Deploy the config into $HOME
install:
    ./update.sh
