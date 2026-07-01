# Git LFS
# https://github.com/git-lfs/git-lfs
# Release notes: https://github.com/git-lfs/git-lfs/releases

# Add the official packagecloud apt repo. This makes `apt` track the latest
# release automatically, so `sudo apt upgrade` keeps git-lfs current and there
# is no version to pin by hand.
curl -s https://packagecloud.io/install/repositories/github/git-lfs/script.deb.sh | sudo bash

sudo apt-get install -y git-lfs

# One-time per-user setup: install the global clean/smudge filters only.
# --skip-repo: do NOT install hooks into whatever repo is the current directory.
# Running plain `git lfs install` inside a repo drops a pre-push hook there; that
# hook runs a lock-verification API call on every push, which a fine-grained
# GitHub PAT can't satisfy (403) - blocking pushes even in repos with no LFS files.
# The global filters set here are all that real LFS repos need; their per-repo
# hooks get installed when you clone them.
git lfs install --skip-repo

git lfs version
