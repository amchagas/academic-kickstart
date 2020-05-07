#!/usr/bin/env bash

# Source Themes Academic: Theme updater
# Checks for available updates and then asks to install any updates.
# https://sourcethemes.com/academic/
#
# Command: bash ./update_academic.sh

# Check for prerequisites.
if [ ! -d .git ]; then
  echo "ERROR: This tool is for Git repositories only."
  exit 1;
fi

function run_hugo_and_deploy () {
  GITHUBUSER=$(git config github.user)
  echo -e "running hugo...\n"
  hugo
  cd public
  git add .
  git commit -m "update public"
  git push:${amchagas:-${GITHUBUSER}}
  cd ..
  git add .
  git commit -m "update main repo"
  git push
}

# Function to update Academic
function do_update () {
  # Apply any updates
  git submodule update --remote --merge

  # - Update Netlify.toml with required Hugo version
  if [ -f ./netlify.toml ]; then
    # Postfix '.0' to Hugo min_version as sadly it doesn't map to a precise semantic version.
    version=$(sed -n 's/^min_version = //p' themes/academic/theme.toml | tr -d '"')
    version="${version}.0"
    echo "Set Netlify Hugo version to v${version}"
    sed -i.bak -e "s/HUGO_VERSION = .*/HUGO_VERSION = \"$version\"/g" ./netlify.toml && rm -f ./netlify.toml.bak
  fi

  echo
  echo "View the release notes at: https://sourcethemes.com/academic/updates"
  echo "If there are breaking changes, the config and/or front matter of content" \
  "may need upgrading by following the steps in the release notes."
}

# Display currently installed version (although could be between versions if updated to master rather than tag)
version=$(sed -n 's/^version = "//p' themes/academic/data/academic.toml)
echo -e "Source Themes Academic v$version\n"

# Display available updates
run_hugo_and_deploy

# Apply any updates
#do_update
