---
jupytext:
  text_representation:
    extension: .md
    format_name: myst
    format_version: 0.13
    jupytext_version: 1.14.7
kernelspec:
  display_name: Python 3
  language: python
  name: python3
---

```{raw-cell}

---
layout: single
title: 'Practice Using Git and GitHub to Manage Files'
excerpt: "Practice your skills setting up git locally, committing changes to files and pushing and pulling files to GitHub.com"
authors: ['Leah Wasser', 'Max Joseph', 'Jenny Palomino']
category: [courses]
class-lesson: ['version-control-git-github']
permalink: /courses/intro-to-earth-data-science/git-github/version-control/guided-activity-version-control/
nav-title: "Practice Git Skills"
dateCreated: 2018-07-25
modified: '{:%Y-%m-%d}'.format(datetime.now())
module-type: 'class'
course: "intro-to-earth-data-science-textbook"
order: 6
week: 3
sidebar:
  nav:
author_profile: false
comments: true
topics:
  reproducible-science-and-programming: ['git']
---
```

{% include toc title="In This Lesson" icon="file-text" %}

In this lesson, you will learn how to implement version control using `Git` and `GitHub`.

<div class='notice--success' markdown="1">

## <i class="fa fa-graduation-cap" aria-hidden="true"></i> Learning Objectives

After completing this lesson, you will be able to:

* Explain how `Git` and `GitHub.com` are used to implement version control.
* Use `Git` to `add` and `commit` changed files.
* Use `Git` to `push` changed files from your local computer to the repository on `GitHub.com`.

## <i class="fa fa-check-square-o fa-2" aria-hidden="true"></i> What You Need

You will need:

* an active GitHub account with your username and password
* to fork and clone the <a href="https://github.com/earthlab-education/practice-git-skillz">practice github repository </a> to complete this lesson.
* a web browser with internet access 

</div>


## Git and GitHub Workflow For Version Control

In the previous lessons, you learned how to `fork` and `clone` existing `GitHub` repositories to make copies of other users' repositories and download them to your computer. 

In this lesson, you expand on those skills to:

* check the `status` of changed files in a repository
* `add` changed files to version control tracking
* `commit` the changed files to your local repository
* `push` those changed files from the local copy of a repository to the cloud (`GitHub.com`)

In later lessons, you will expand on this version control workflow to notify others (your collaborators) about changes you have made and that you would like to add to the original (`main`) copy of a repository.  

+++

<div class="notice--warning" markdown="1">

## <i class="fa fa-pencil-square-o" aria-hidden="true"></i> Challenge 1: Check `Git` Configuration Settings

To begin, check your github configuration. Type the following in bash:  

`$ git config user.name`

`$ git config user.email`

The output of the above commands should return your username and email for git. If it does not
or it returns nothing, you will need <a href="{{ site.url }}/courses/intro-to-earth-data-science/git-github/version-control/git-commands/">to review the instructions for configuring **git** locally on your computer</a>. 

</div>

+++



<i class="fa fa-star"></i> **Data tip:** You can also use `$ git config --list` to view all configuration settings for **git** on your machine.</a>
{: .notice--success }

<div class="notice--warning" markdown="1">

## <i class="fa fa-pencil-square-o" aria-hidden="true"></i> Challenge 2: Make Changes to Files

### STEP 1: Make Changes to a File

* Use **Shell** to navigate to your forked repository (the `practice-git-skillz` directory).

If you don't have this repo locally - you can clone it using the following url: `https://github.com/your-user-name-here/practice-git-skillz` 

* Launch Jupyter Notebook inside that directory. (If you are working on a JupyterHub you can skip this step!)
* Open the `Jupyter Notebook` file in that directory(`homework-example.ipynb`) and make some changes to the file as follows:

  * Add a markdown cell to the notebook
  * In the cell add a **heading** and then some text below. 

### STEP 2: Check the Status of Your Changed File

Return to your **shell** tool. Run the command:

`git status` 

to check the status of current changes. It should show that there is a change to the file. 

```bash
$ git status
On branch main
Your branch is up-to-date with 'origin/main'.
Changes not staged for commit:
  (use "git add <file>..." to update what will be committed)
  (use "git checkout -- <file>..." to discard changes in working directory)

	modified:   homework-example.ipynb
    
no changes added to commit (use "git add" and/or "git commit -a")
```

The output from `git status` indicates that you have modified the file `homework-example.ipynb`.
To add these changes to your git history you need to:

1. `add` the changes, and then
2. `commit` the changes using a useful message that describes what you changed.


### STEP 3: Add and Commit Changed Files

You will use the add and commit functions to `add` and `commit` your changed files.

* `git add`: takes a modified file in your working directory and places the modified version in a staging area.

* `git commit`: takes everything from the staging area and makes a permanent snapshot of the current state of your repository that is associated with a unique identifier.

These two commands make up the bulk of many workflows that use git for version control.

### STEP 4: Push Your Changes to GitHub.com

Once you have added and commited your changes, you are ready to push them to GitHub.com. Use:

`$ git push` 

to push the changes to your fork.

</div>

+++

Congratulations! You've now successfully modified files in a **GitHub** repo and pushed them back up to github.com. We suggest that you run through this process several times to get the hang of it. Working in a small group may be useful as you do this. 

+++ {"caption": "Modified files are staged using git add, and following a commit, all files in the staging area are snapshotted and become part of the repository's history, receiving a unique SHA-1 hash identifier. Source: Max Joseph, adapted from Pro Git by Chacon and Straub (2014).", "label": "fig:git_overview"}

<figure>
   <a href="{{ site.url }}/images/earth-analytics/git-version-control/git-add-commit.png">
   <img src="{{ site.url }}/images/earth-analytics/git-version-control/git-add-commit.png" alt="Modified files are staged using git add, and following a commit, all files in the staging area are snapshotted and become part of the repository's history, receiving a unique SHA-1 hash identifier. Source: Max Joseph, adapted from Pro Git by Chacon and Straub (2014)."></a>
   <figcaption> Modified files are staged using git add, and following a commit, all files in the staging area are snapshotted and become part of the repository's history, receiving a unique SHA-1 hash identifier. Source: Max Joseph, adapted from Pro Git by Chacon and Straub (2014).
   </figcaption>
</figure>

+++ {"tags": ["hide"]}

## Challenge 2: Add New Files To A GitHub Repo

This is all redundant as they'd already learned it earlier. 

You can add an individual file or groups of files to git tracking as well. To add a single file, use: 

`$ git add file-name.extension`.

For example, to add the `ea-bootcamp-hw-1.ipynb` file that you just modified, you’d use: 

```bash
$ git add ea-bootcamp-hw-1.ipynb
```

You can also add all of the files that you have edited at the same time using: 

```bash
$ git add .
```

However, **use `git add .` with caution**. Be sure to review the results from `git status` carefully before using `$ git add .`. You do not want to accidentally add files that you do not want to change in the `GitHub` repository. 


### Commit Files

Once you are ready to make a snapshot of the current state of your repository, you can use `$ git commit`. 

The `$ git commit` command requires a commit message that describes the snapshot (i.e. changes) that you made in that commit. A commit message should outline what changed and why. These messages:

1. help collaborators and your future self understand what was changed and why
2. allow you and your collaborators to find (and undo if necessary) changes that were previously made.

Since you are not committing a lot of changes, you can create a short one line commit message using the -m flag:

```bash
$ git commit -m "Update title and author name in homework 1"
```

You will learn about including longer commit messages later in this course.


## Push Changed Files to GitHub

So far we have only modified our local copy of the repository. To update the files in your `GitHub` repository, you need to `push` the changed files to `GitHub`.

You can push your changes to `GitHub` with:

`$ git push origin main`

You will then be prompted for your `Github.com` username and password. 

After you have pushed your commits, visit your repository on `https://github.com/yourusername/ea-bootcamp-hw-1-yourusername` and notice that your changes are reflected there. Also notice that you have access to the full commit history for your repository!

+++

<div class="notice--warning" markdown="1">

## <i class="fa fa-pencil-square-o" aria-hidden="true"></i> Challenge 3

* Rename the Jupyter Notebook in your repository. Then add and commit the file.
Push the renamed file up to Github. Then check that it's there by going to github.com!

* Add a new file to the repo, commit the change and push it to github.com. Check to see that it's there. 
* Use `git log` to view the history of changes that you've made.  
</div>
