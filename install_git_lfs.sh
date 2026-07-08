# Git LFS
# https://github.com/git-lfs/git-lfs
# Release notes: https://github.com/git-lfs/git-lfs/releases

# Install from Ubuntu's own repos (universe / ESM). git-lfs is packaged there and
# gets security updates through the normal apt channel - no third-party repo to
# maintain. We previously used the packagecloud repo, but it only builds for
# released Ubuntu codenames: on a new release (e.g. 26.04 "resolute") its Release
# file 404s and breaks `apt update`. See plans/2026-07-09-00-remove-packagecloud-git-lfs-repo.md.
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
