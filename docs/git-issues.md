## Git basics

When working with Git and GitHub, following a clear workflow will make managing your code easier. Here's a breakdown of a simple terminal-based workflow using **GitHub CLI** and **Git**



### 1. Log in to GitHub CLI

First, authenticate with GitHub using the GitHub CLI:


```bash

gh auth login

```

This command will guide you through logging into GitHub from the terminal.


### 2. Create a GitHub Repository


Once logged in, create a new GitHub repository from the terminal.


```bash

gh repo create [repo-name] --public --source=. --remote=origin

```


* [repo-name] is a placeholder for the name of your repository

* the text inside the brackets indicates what it's used for

* remove the square brackets ```[wrong-name]```, ```right-name```


--public: Makes the repository public.


--source=.: Uses the current directory for the repository’s files.


--remote=origin: Automatically sets up the remote origin to your GitHub repo.


This will create the GitHub repository and link it to your local project.


### 3. Initialize Git in Your Local Directory


We will create a .git folder in your project directory so the files will be tracked by git.


```bash

git init

```



### 4. Stage Your Changes


After creating a descriptive readme and relevat files you may want to save your changes to github. Start by staging the changes:


```bash

git add .

```


If you need to undo this operations you can run:

```bash

git reset HEAD .

```

Note that . is not the only option for managing staging and unstaging.


### 5. Commit and push


When you are ready:

```bash

git commit -m "type(scope): Add commit explanation"

```

Save everything to github repo with:

```bash

git push origin main

```

If you created the repository in github web:

```bash

git remote add origin https://github.com/your-username/your-repo-name.git

```

### 6. Branches

For safe feature development, testing and experimenting we can create a contained version of the repository called a branch.

```bash

git switch -c feature/login

```

The switch command changes from current branch to the defined feature/login branch and the -c flag creates the branch. Wehen changeing between existing branches leave out the -c flag.

main: (c1)-(c2)  
&emsp;&emsp;&emsp;&emsp;&emsp;&nbsp; \ &emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&nbsp;&nbsp;    
branch:&emsp;&emsp;&emsp;(c2a)-(c2b)-(c2c)

To check all your current branches:

```bash

git branch -a

```

To see commits of the current branch

```bash

git log

```

### 7. Merging
Once your work on a feature is done and tested, you bring those changes back into your main codebase.

```bash
   git switch main
```
Pull in the changes from your feature branch:
```bash
git merge feature/login
```
main: (c1)-(c2)-(c3)-(c4)-(c5)-(c6)-(c7)  
&emsp;&emsp;&emsp;&emsp;&emsp;&nbsp; \ &emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&nbsp;&nbsp; /  
branch:&emsp;&emsp;&emsp;(c2a)-(c2b)-(c2c)

When mergeing your branch, merge commit converges into the main branches timeline. So main becomes an interconnected map of all the timelines merged into it.

If you prefer a different approach you can rebase your branch with main:
```bash
git rebase main
```

main: (c1)-(c2)-(c3)-(c4)-(c5)-(c6)  
&emsp;&emsp;&emsp;&emsp;&emsp;&nbsp; \ &emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&nbsp;&nbsp;   
branch:&emsp;&emsp;&emsp;(c2a)-(c2b)-(c2c)

main: (c1)-(c2)-(c3)-(c4)-(c5)-(c6)-(c2a)-(c2b)-(c2c)

Or you can use squash:  
```bash
git merge --squash feature/login
```

main: (c1)-(c2)-(c3)-(c4)-(c5)-(c6)-(c7)  
&emsp;&emsp;&emsp;&emsp;&emsp;&nbsp; \ &emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&nbsp;&nbsp;   
branch:&emsp;&emsp;&emsp;(c2a)-(c2b)-(c2b)

main: (c1)-(c2)-(c3)-(c4)-(c5)-(c6)-(c2abc)

***Summary***:  
***Merge*** preserves the complete history of your work by creating a "knot" commit that ties two timelines together.  
 ***Rebase*** (done on the branch) updates your branch's starting point to the end of main, resulting in a perfectly linear history where your work appears to have been written after the latest updates.  
 ***Squash*** simplifies the history by combining all your individual branch commits into a single, clean "summary" commit on main, hiding messy intermediate steps like typos.

You can visualize the timeline in the terminal:
```bash
git log --oneline --graph --all
```

## ***Troubleshooting common workflow issues***

Mistakes are invetiable so familiarity of tools to fix them is very important
### Restore to previous commit
To find any operations you have made locally in the last 90 days:
```bash
git reflog
```
cc6dc6f HEAD@{0}: checkout: moving from ctf to tools  
3968c9a HEAD@{1}: checkout: moving from main to ctf  
f8c40f4 HEAD@{2}: checkout: moving from tools to main

Here you can dee the ID's and HEAD selectors, you can use ether one. The HEAD works as a rolling list where 0 is you current position, 1 the position before this and so on.

```bash
git show HEAD@{1}
```

If the result of git show command shows the code you are expecting to get back we can reset to that commmit. Effectively humping from current selector 0 to the previous selector 1.
```bash
git reset --hard HEAD@{1}
```
If you had already pushed your changes into github push these changes with a lease so it will not owerwrite work others may have done
```bash
git push --force-with-lease origin [branch-name]  
```
