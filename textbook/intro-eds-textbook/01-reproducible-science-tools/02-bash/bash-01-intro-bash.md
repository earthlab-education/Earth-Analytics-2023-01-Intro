---
kernelspec:
  name: python3
  display_name: earth-analytics
jupytext:
  text_representation:
    extension: .md
    format_name: myst
    format_version: '0.13'
    jupytext_version: 1.13.8
myst:
  substitutions:
    title: 'Introduction to Bash (Shell) and Manipulating Files and Directories at the Command Line'
    authors: 'Jenny Palomino, Leah Wasser'
    excerpt: |
      Bash or Shell is a command line tool that is used in open science to efficiently manipulate files and directories. Learn how to use Bash to access and move files and directories.
    objective: |
      * Explain the roles of `Terminal`, `Shell`, and `Bash` for accessing programs and other items on your computer. 
      * Launch a `Terminal` session to access `Bash`.
      * Run `Bash` commands in the terminal to work with files and directories on your computer.
      * Test that `Bash` is ready for use on your computer.
---

:::{include} ../../../textbook-header.md
:::

## Terminal, Shell, and Bash - An Overview

### Terminal

In the early days of computing, the computer that processed data or performed operations was separate from the tool that gave it the instructions to do the processing. There was: 

* The terminal: which was used to send commands to the computer and
* The computer: the hardware that processed the commands

Today, there are computers that can both provide commands AND perform the computation, and these computers have graphical user interfaces (known as GUIs) that make it easy to perform tasks. 

However, accessing the command line or terminal can often be more efficient than using GUIs for certain tasks, and you can send commands via the terminal to programmatically accomplish these tasks. For example, working with files in the terminal is faster and more efficient than working with files in a graphic environment like Windows Explorer or the Finder on a MAC. 

You can also use the terminal to launch and execute open reproducible science tools such as `Jupyter Notebook`, `Python`, and `git`, which you will use throughout this textbook. 

:::{figure} ../../../../images/earth-analytics/bash/early-terminal.png
:alt: "An image showing a terminal and a computer in the early days of computing."

Image of an older computer and terminal.
:::

### Shell and Bash

In the chapter on Open Reproducible Science, you learned that `Shell` is the primary program that computers use to receive code (i.e. commands) and return information produced by executing these commands (i.e. output). 

These commands can be entered and executed via the terminal. This allows you to control your computer by typing in commands with a keyboard, instead of using buttons or drop down menus in a GUI with a mouse/keyboard.

`Bash` (also known as the "Bourne Again SHell") is an implementation of `Shell` and allows you to efficiently perform many tasks. For example, you can use `Bash` to perform operations on multiple files quickly via the command line. 

You can also write and execute scripts in `Bash`, just like you can in `R` or `Python`, that can be executed across different operating systems. 

:::{admonition} Data Tip
:class: data-tip 
`Bash` stands for “Bourne Again SHell” and is an updated version of `Shell`. Sometimes you will hear `Bash` and `Shell` used interchangeably; this textbook uses the term `Bash`.
:::


## Why Is Bash Important for Open Reproducible Science

Using `Bash` in the Terminal is a powerful way of interacting with your computer. GUIs and command line `Bash` are complementary—by knowing both, you will greatly expand the range of tasks you can accomplish with your computer. 

With `Bash` commands, you will be able to perform many tasks more efficiently and automate and replicate workflows across different operating systems. Common tasks that you can run at the command line include checking your current working directory, changing directories, making a new directory, extracting files, and finding files on your computer. 

Working in the terminal with `Bash` provides you with the ability to:
  * easily navigate your computer to access and manage files and folders (i.e. directories). 
  * quickly and efficiently work with many files and directories at once.
  * run programs that provide more functionality at the command line (e.g. `git`).
  * launch programs from specific directories on your computer (e.g. `Jupyter Notebook`).
  * use repeatable commands for these tasks across many different operating systems (Windows, Mac, Linux).


## Terminal Options For Bash

Previously, you learned that a terminal is the command line interface (CLI) that gives you access to `Bash`. There are many different terminal programs, and thus, the terminal that you use on your computer will vary according to your operating system. 

For instance, Mac as well as many Linux computers have a default terminal program installed that provides access to `Bash`. However, the default terminal on Windows computers does not provide access to `Bash`. 

For this textbook, Windows users will need to install a customized terminal called `Git Bash` to access and run `Bash` commands (see section above on What You Need).

Throughout the textbook, the command line environment that you use to access `Bash` will be referred to as the terminal. 


## Open a Terminal Session On Your Computer

The terminal program that you use to run `Bash` commands will vary depending upon your computer's operating system.

:::::{tab-set}
::::{tab-item} Mac (OS X)

You can use the program called Terminal, which uses the `Bash` implementation of `Shell` and is installed natively on the Mac OS. 

You can open Terminal by finding and launching it from Spotlight (or from `/Applications/Utilities`).

:::{figure} ../../../../images/earth-analytics/bash/mac-terminal.png
:alt: "This is what the Terminal on Mac looks like. Source: Apple.com."

This is what the Terminal on Mac looks like. Source: <a href="https://help.apple.com/assets/58C4E5B4680CE2040551BA60/58C4E5B6680CE2040551BA69/en_US/84239026ca019f46567b86e900f5edd7.png" target = "_blank">Apple.com.</a>
:::
::::

::::{tab-item} Linux
Many Linux computers use the `Bash` implementation of `Shell`, which you will learn to test for in the section below.  

You can open the program called `Terminal` (or `Terminal Emulator`) by finding and launching it from your list of programs. 

:::{figure} ../../../../images/earth-analytics/bash/linux-terminal.png
:alt: "This is what the Terminal on Linux looks like."
:width: 125%

This is what the Terminal on Linux looks like.
:::
::::

::::{tab-item} Windows
There are many options for running `Bash` on Windows. For this textbook, you will use `Git Bash` which comes with your installation of `git`. Instructions for setting this up are here: 

[Setting up Git, Bash, and Conda on your computer](python-open-source-tool-setup)

Once you have installed `git` on a Windows machine, you can open this Terminal by searching for `Git Bash` in the start menu. Use `Git Bash` for all hands-on activities in this textbook that ask you to use the `Terminal`. 

:::{figure} ../../../../images/earth-analytics/bash/git-bash-terminal.png
:alt: "This is what the Git Bash Terminal on Windows looks like."

This is what the Git Bash Terminal on Windows looks like.
:::
::::

:::::


## Check For Bash

To check for `Bash` on your computer, you can type "bash" into your open terminal, like shown below, and hit the enter key. 

Note that you will only get a message back if the command is not successful. If the command is successful, you will simply see a new line prompt waiting for more input.

:::{code-block} bash
  $ bash
:::

In this example, the dollar sign ($) is a prompt that shows you that `Bash` is waiting for more input. 

Depending on your computer's set-up, you may see a different character as a prompt and/or additional information before the prompt, such as your current location within your computer's file structure (i.e. your current working directory) or the `conda` environment you have activated.

## Close a Terminal Session

You can close the terminal at any time by typing the command "exit" and hitting the enter key.
