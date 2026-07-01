# Git LFS
# https://github.com/git-lfs/git-lfs
# Release notes: https://github.com/git-lfs/git-lfs/releases

# Add the official packagecloud apt repo. This makes `apt` track the latest
# release automatically, so `sudo apt upgrade` keeps git-lfs current and there
# is no version to pin by hand.
curl -s https://packagecloud.io/install/repositories/github/git-lfs/script.deb.sh | sudo bash

sudo apt-get install -y git-lfs

# One-time per-user setup: installs the git hooks / filters.
git lfs install

git lfs version
