# Change git repo name

There are various possible interpretations of what is meant by renaming a Git repository: the displayed name, the repository directory, or the remote repository name. Each requires different steps to rename.
Displayed Name

## Rename the displayed name (for example, shown by gitweb):

Edit .git/description to contain the repository's name.
Save the file.

## Repository Directory

Git does not reference the name of the directory containing the repository, as used by git clone master child, so we can simply rename it:

Open a command prompt (or file manager window).
Change to the directory that contains the repository directory (i.e., do not go into the repository directory itself).
Rename the directory (for example, using mv from the command line or the F2 hotkey from a GUI).

## Remote Repository

Rename a remote repository as follows:

Go to the remote host (for example, https://github.com/User/project).
Follow the host's instructions to rename the project (will differ from host to host, but usually Settings is a good starting point).
Go to your local repository directory (i.e., open a command prompt and change to the repository's directory).
Determine the new URL (for example, git@github.com:User/project-new.git)

Set the new URL using Git:

    git remote set-url origin git@github.com:User/project-new.git

# Create a new repository on the command line

    echo "# django-practise" >> README.md
    git init
    git add README.md
    git commit -m "first commit"
    git branch -M main
    git remote add origin git@github.com:gofr1/django-practise.git
    git push -u origin main

# Push an existing repository from the command line

    git remote add origin git@github.com:gofr1/django-practise.git
    git branch -M main
    git push -u origin main

# If you want to remove the file only from the Git repository and not remove it from the filesystem, use:

    git rm --cached file1.txt
    git commit -m "remove file1.txt"

# Move commit from one branch to another
    
On your current branch:

    git reset --hard HEAD~1

Switch to another branch and commit there
