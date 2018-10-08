# git-branch-cleaner
A simple command line tool to clean your Git branches.  The script scans through all branches available on your local, and prompt if you'd like to keep/delete them.

# Usage
1. Clone the repo on your local
```git clone https://github.com/dashk/git-branch-cleaner.git```

2. Navigate to the Git repo you want to clean branches from
```cd <my-repo-with-many-local-branches>```

3. Run the command
```sh <path-to-git-branch-cleaner-repo>/clean_branches.sh```
* The command will promot you for master branch's name.

Enjoy!

# Tips
You can add branch cleaner to your PATH so it's available everywhere.
```
##
# Add branch cleaner
##
export PATH=<path-to-branch-cleaner repo>:$PATH
```

Once you've done this, all you need to do in Step #3 above is just...
```sh clean_branches.sh```
