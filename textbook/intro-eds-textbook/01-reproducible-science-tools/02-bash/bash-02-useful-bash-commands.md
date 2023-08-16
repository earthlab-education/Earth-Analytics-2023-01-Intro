---
file_format: mystnb
jupytext:
  text_representation:
    extension: .md
    format_name: mystnb
    format_version: 0.13
    jupytext_version: 1.14.7
kernelspec:
  display_name: Python 3
  language: python
  name: python3
myst:
  substitutions:
    title: 'Bash Commands to Manage Directories and Files'
    authors:  'Jenny Palomino, Leah Wasser, Elsa Culler'
    excerpt: |
      **Bash** or **Shell** is a command line tool that is used in open science to efficiently manipulate files and directories. Learn how to run useful Bash commands to access and manage directories and files on your computer.
    objective: |
      * Run `Bash` commands to work with files
      * Use the **recursive option** (-r) to apply `Bash` commands to all files in a directory
---

:::{include} ../../../textbook-header.md
:::

## How to Run Bash Commands in the Terminal

In the previous section on Terminal Sessions, you learned that the terminal displays a prompt that shows you that `Bash` is waiting for input. 

:::{code-block} bash
$ bash
$
:::

:::{note}
Recall that depending on your computer's set-up, you may see a different character as a prompt and/or additional information before the prompt, such as your current location within your computer's file structure (i.e. your current working directory).
:::

When typing commands (either from this textbook or from other sources), do not type the dollar sign (or other character prompt). Only type the commands that follow it. 

Note: In the examples on this page, the indented lines that follow a prompt and do not start with a dollar sign ($) are the output of the command. The results of the commands below on your computer will be slightly different, depending on your operating system and how you have customized your file system.

## Useful Bash Commands to Manage Directories and Files

Below, you will find details about the following `Bash` commands:

`pwd`
: **p**rint the **w**orking **d**irectory

`cd`
: **c**hange **d**irectories

`mkdir`
: **m**a**k**e a **dir**ectory

`ls`
: **l**i**s**t files

`rm`
: **r**e**m**ove files

`cp`
: **c**o**p**y files

`touch`
: create new files

### Print Current Working Directory (`pwd`)

Your current working directory is the directory where your commands are being executed. It is typically printed as the full path to the directory (meaning that you can see the parent directory). 

To print the name of the current working directory, use the command `pwd`.

:::{code-block} bash  
$ pwd 
/users/jdoe
:::

As this is the first command that you have executed in `Bash` in this session, the result of the `pwd` is the full path to your home directory. The home directory is the default directory that you will be in each time you start a new `Bash` session. 

**Windows users:** note that the `Terminal` uses forward slashes (`/`) to indicate directories within a path. This differs from the Windows File Explorer which uses backslashes (`\`) to indicate directories within a path.   

### Change Current Working Directory (`cd`)

Often, you may want to change the current working directory, so that you can access different subdirectories and files. 

To change directories, use the command `cd` followed by the name of the directory (e.g. `cd downloads`). Then, you can print your current working directory again to check the new path. 

For example, you can change the working directory to an existing `documents` directory under your home directory, and then check that the current working directory has been updated.

:::{code-block} bash
$ cd documents
$ pwd
/users/jdoe/documents
:::

You can go back to the parent directory of any current directory by using the command `cd ..`, as the full path of the current working directory is understood by `Bash`.

:::{code-block} bash
$ cd ..
$ pwd
/users/jdoe
:::

You can also go back to your home directory (e.g. `/users/yourusername`) at any time using the command `cd ~` (the character known as the tilde). 

:::{code-block} bash
$ cd ~
$ pwd
/users/jdoe
:::

### Create a New Directory (`mkdir`)

The first step in creating a new directory is to navigate to the directory that you would like to be the parent directory to this new directory using `cd`. 

Then, use the command `mkdir` followed by the name you would like to give the new directory (e.g. `mkdir directory-name`). 

For example, you can create a new directory under `documents` called `assignments`. Then, you can navigate into the new directory called `assignments`, and print the current working directory to check the new path.

:::{code-block} bash
$ cd documents
$ mkdir assignments
$ cd assignments
$ pwd
/users/jdoe/documents/assignments
:::

Notice that `mkdir` command has no output. Also, because `assignments` is provided to `Bash` as a relative path (i.e., doesn’t have a leading slash or additional path information), the new directory is created in the current working directory (e.g. `documents`) by default. 

<i class="fa fa-star"></i> **Data Tip:** 
Directory vs Folder: You can think of a directory as a folder. However, recall that the term directory considers the relationship between that folder and the folders within it and around it. 
{: .notice--success}

<i class="fa fa-star"></i> **Data Tip:**
Notice that you are creating an easy to read directory name. The name has no spaces and uses all lower case to support machine reading down the road. 
{: .notice--success}


### Print a List of Files and Subdirectories  (`ls`)

To see a list of all subdirectories and files within your current working directory, use the command `ls`.

:::{code-block} bash
$ cd ~
$ pwd
/users/jdoe
$ ls 
addresses.txt    documents    downloads    grades.txt    
:::

In the example above, `ls` printed the contents of the home directory which contains the subdirectories called `documents` and `downloads` and the files called `addresses.txt` and `grades.txt`. 

You can continue to change your current working directory to a subdirectory such as `documents` and print a new list of all files and subdirectories to see your newly created `assignments` directory.

:::{code-block} bash
$ cd documents
$ ls    
assignments  
:::

You can also create a new subdirectory under `assignments` called `homeworks`, and then list the contents of the `assignments` directory to see the newly created `homeworks`.

:::{code-block} bash
$ cd assignments
$ mkdir homeworks
$ ls    
homeworks  
:::

### Delete a File (`rm`)

To delete a specific file, you can use the command `rm` followed by the name of the file you want to delete (e.g. `rm filename`).

For example, you can delete the `addresses.txt` file under the home directory. 

:::{code-block} bash
$ pwd
/users/jdoe
$ ls 
addresses.txt    documents    downloads    grades.txt 
$ rm addresses.txt
$ ls 
documents    downloads    grades.txt
:::

### Delete a Directory (`rm -r`)

To delete (i.e. remove) a directory and all the sub-directories and files that it contains, navigate to its parent directory, and then use the command `rm -r` followed by the name of the directory you want to delete (e.g. `rm -r directory-name`). 

For example, you can delete the `assignments` directory under the `documents` directory because it does not meet the requirement of a good name for a directory (i.e. not descriptive enough - what kind of assignments?).

:::{code-block} bash
$ cd ~
$ cd documents
$ pwd
/users/jdoe/documents
$ ls    
assignments  
$ rm -r assignments
:::

The `rm` stands for remove, while the `-r` is necessary to tell `Bash` that it needs to recurse (or repeat) the command through a list of all files and sub-directory within the parent directory. 

Thus, the newly created `homeworks` directory under `assignments` will also be removed, when `assignments` is deleted.

:::{code-block} bash
$ pwd
/users/jdoe/documents
$ ls
$
:::

### Copy a File (`cp`)

You can also copy a specific file to a new directory using the command `cp` followed by the name of the file you want to copy and the name of the directory to where you want to copy the file (e.g. `cp filename directory-name`). 

For example, you can copy `grades.txt` from the home directory to `documents`. 

:::{code-block} bash
$ cd ~
$ pwd
/users/jdoe
$ ls 
documents    downloads    grades.txt
$ cp grades.txt documents
$ cd documents
$ ls
grades.txt
:::

Note that the original copy of the file remains in the original directory, so you would now have two copies of `grades.txt`, the original one in the home directory and the copy under `documents`.

:::{code-block} bash
$ cd ~
$ pwd
/users/jdoe
$ ls 
documents    downloads    grades.txt
:::

### Copy a Directory and Its Contents (`cp -r`)

Similarly, you can copy an entire directory to another directory using `cp -r` followed by the directory name that you want to copy and the name of the directory to where you want to copy the directory (e.g. `cp -r directory-name-1 directory-name-2`). 

Similar to `rm -r`, `-r` in `cp -r` is necessary to tell `Bash` that it needs to recurse (or repeat) the command through a list of all files and sub-directory within the parent directory.

:::{code-block} bash
$ cd ~
$ pwd
/users/jdoe
$ ls 
documents    downloads    grades.txt
$ mkdir pics
$ ls 
documents    downloads    grades.txt    pics
$ cp -r pics documents
$ cd documents
$ ls
grades.txt    pics
:::

Once again, the original copy of the directory remains in the original directory. 

:::{code-block} bash
$ cd ~
$ pwd
/users/jdoe
$ ls 
documents    downloads    grades.txt    pics
:::

### Create a New File Using a Single Command (`touch`)

You can create a new empty file using the single command `touch` (e.g. `touch file-name.txt`). This command was originally created to manage the timestamps of files. However, if a file does not already exist, then the command will make the file. 

This is an incredibly useful way to quickly and programmatically create a new empty file that can be populated at a later time.   

:::{code-block} bash
$ cd ~
$ cd downloads
$ pwd
/users/jdoe/downloads
$ touch veg-data.txt
$ ls
veg-data.txt
:::

+++

::::{admonition} Practice Your Bash Skills: Create a Directory for earth-analytics
:class: exercise

Project organization is integral to efficient research. In this challenge, you will use `Bash` to create an `earth-analytics` directory that you will use throughout this textbook. 

You will then create a  `data` directory within the `earth-analytics` directory to save all of the data that you will need to complete the homework assignments and follow along with the course.

Begin by creating an `earth-analytics` directory (or folder) in your home directory. Recall that this is the default directory in which the Terminal opens. 

* Create a **new directory** called `earth-analytics`.

    ::: bash 
    $ mkdir earth-analytics 
    :::

*  Next, change your working directory to the `earth-analytics` directory, and create a new directory within it called `data`.

    :::{code-block} bash 
    $ cd earth-analytics 
    $ mkdir data 
    :::

* Last, go back to the home directory and confirm that you can then access the directories you just made.

    :::{code-block} bash
    $ cd ~
    $ cd earth-analytics
    $ ls
    data
    :::

::::