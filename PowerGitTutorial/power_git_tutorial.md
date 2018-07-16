# Power Git

Speaker: [Brent Laster](https://twitter.com/BrentCLaster)
* Author of "Professional Git" and "Up & Running with Jenkins 2"

## Agenda
* Merging and rebasing
* Stash
* Reset and revert
* Rerere ("re three")
* Bisect
* Trees and modules
  * Worktrees
  * Submodules
  * Subtrees
  * Filter branches - the swiss army knife
* Interactive rebase
* Notes
* Grep

### Centralized or Distributed VCS
* Git is distributed version control system (vcs)
* This allows disconnected development. Sync between local and remote.

### Git allows development flows
* Dev, Test, Prod, Public
* working directory, staging area, local repo, remote repo

### Git's Granularity
* Normally the level of detail is the file
* git's granularity is a tree with snapshots of commits

## Merging
* fast-forward collapses into one common branch
* three way merge
  * merge commit, makes a brand new commit with all three locations and it will now have two parents
  * only taking two tips of branches, lacking history
* rebase - a merge with history
  * replay the changes in a commit over another commit
  * much cleaner, linear history

## Stash
* Purpose: keep a backup copy that has not been committed
* allows you to switch branches without committing
  * `git stash save "message"`
  * shows the message with `git stash list`
  * `apply` and `pop`
  * helpful to stash / pull / pop to have more control
* `--keep-index` will not clean out the staging area
* `git clean` will clean up untracked files in working directory

## Reset & Revert
* think of `git reset` like a "rollback" to point at a previous commit
  * soft / mixed / hard
* `git revert` will cancel out a commit to point to a new one
  * preferred method that causes fewer issues with pushing to remote
* `git reset --hard <sha1hash>`
  * could use a hash, branch or a tag
  * `--hard` will apply changes to files, staging files and working directory
* `git reset current~1 [--mixed]`
  * current is a tag, the 1 means "one before" what is tagged as current
* `git revert HEAD`
  * makes a new commit, end up at the same place as --hard, but moves forward, which is easier for coworkers to pull from remote master

## Rerere (Reuse Recorded Resolution)
* allows recording of solving merge conflicts and automatic resolution
* `git config --global rerere.enabled 1` to enable re3
  * `git merge feature1` - records a pre-image
  * fix conflicts
  * `git add .`
  * `git commit -m "example"`
  * we now have a recorded file resolution
  * if we try again we'll get "resolved fileb.txt with previous resolution"
  * it does still show a conflict in the message
* `git rerere`
  * this is a state command. It's enabled and will run automatically in the background
  * If you're just doing it once, it doesn' do much. For recurring merges and conflicts, it can help replay them
* other commands: `status`, `diff`, `forget`

## Temporary Checkout
* detached head state, not on a branch
* `git checkout HEAD^0`
* can then create a branch off that headless scratch zone

# LAB ONE - Rerere
* https://github.com/brentlaster/greetings
* rerere enable, merge and auto resolution
* to share this with other team members, you could copy over the rerere cache file

# LAB TWO - Bisect
* https://github.com/brentlaster/bisect
* `git bisect start` or can add the range `git bisect start HEAD HEAD~10` for last 10 commits
  * OR
  * `git bisect bad` to identify bad commit with issues
  * `git bisect good` when you hit the spot before the issue
* narrows in on the bad case. somehow identify, by running tests or something similar
* from there, you can branch off, `rebase -i` etc
* other options
  * `log` - write out all options
  * `visualize` - show info
  * `reset` - stopping bisect
  * `skip`
  * fixing missed `good/bad`
    * `git bisect log > filename`
    * `git bisect rename`
    * `git bisect replay filename`
  * `run` - can write script to automatically run test condition and return 0 or 1 (for example)

# LAB THREE - Worktrees
* https://github.com/lucas-ibotta/super_calc
* `git worktree` command
  * add - create a new working tree for specified branch
  * list
  * remove
    * removes structure only if it's clean
  * prune
  * lock / unlock

# LAB FOUR - Submodules
* https://github.com/lucas-ibotta/super_calc
* https://github.com/lucas-ibotta/sub_docs
* https://github.com/lucas-ibotta/sub_ui
* "some people swear by them, some swear at them."
* this is largely handled by package managers nowadays, instead of using the source directly
* It's a linked project. Link one repo to another repo to update together.
* we have submodules in a super project
* `git submodule` command
  * `git submodule add <remote path> <subdirectory>`
  * adds a `.gitmodules` files
* cloning them down. `git clone --recursive` is a shortcut
* we still need to keep the metafiles in sync with all the submodules in the super project, which takes extra steps.
  * last time, I was pointing to commit "N"
  * if project is updated to commit "N+1", super project needs to be updated to reflect that. Otherwise, the project is behind when cloning.
* merging in submodules?
  * standard merge process in submodule itself
  * update super project references
* `git submodule status`
  * starts with `-` it has not been initialized
  * starts with `+` it has a difference and has updates

# LAB FIVE - Subtrees
* adding a copy from remote as a subtree
* `git subtree add --prefix subproject --squash subproj.git master`
  * oh, golly
  * squashing history is generally a good idea
* tips:
  * can create a second remote to be added as a subtree
* `subtree merge`
* `subtree split` - extract a subproject content into its own branch
* `subtree push` - splits and pushes to remote... not very useful

# LAB SIX - Filters
* https://github.com/brentlaster/roarv2
* two types of git commands.
  * porcelain - nice and tidy user-facing commands
  * plumbing - lower level commands. often a porcelain command is multiple plumbing commands

* `git filter-branch`
  * many examples `tag-name-filter` `--tree-filter` and `--parent-filter` and more
  * also uses `rev-list` to list revisions (another plumbing command)
* uses `--` as a separator command to send filter to the rev-list option
* `git rev-list` is another good one to look more deeply at a list of commits
* types of filters
  * subdirectory filter takes a sub directory instead of a branch
  * splits that subdirectory into its own repository
* Undoing a filter branch command
  * Easy as `git reset --hard <sha>` or relative reset with `git reset --hard HEAD@{1}`
* removing files with an `--index-filter`
  * only works on one branch at a time
* changing email address on commits
  * use env filters
  * GIT_AUTHOR_EMAIL must be exported
