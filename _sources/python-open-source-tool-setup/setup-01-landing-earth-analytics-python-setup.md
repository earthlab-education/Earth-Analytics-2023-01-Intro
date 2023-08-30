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
myst:
  substitutions:
    title: "Setup Your Earth Analytics Python, Git, Bash Environment On Your Computer"
    excerpt: 'There are several core tools that are required to work with data. These include Shell/Bash, Git/Github and Python. Learn how to set all of these tools up on your computer so you can work with different types of data using open science workflows.'
    authors: 'Leah Wasser, Jenny Palomino, Martha Morrissey, Will Norris'
    objective: | 
      * Install the open source software you need to get started with Earth Data Science in `Python`
      * Clone a `GitHub` repository
      * Build a `Python` environment with Earth Data Science libraries
---

(python-open-source-tool-setup)=
:::{include} ../textbook-header.md
:::

## Get Bash, Git, and Conda Setup On Your Computer

The lessons in this section will help you get your computer setup with core earth analytics tools that you will use in many of the lessons on this website. 

1. `Bash`: `Bash` comes with Mac and Linux but is not natively installed on Windows. `Bash` is a powerful command line interface that allows you to efficiently manipulate files and directories. You will also use it to access and interact with `Git` (version control). 
2. `Git`: `Git` is a tool that you use to keep track of changes in your documents. This makes your workflow more reproducible. It also allows you to undo changes that you want to undo! 
3. Conda - Conda is a package and environment management tool that allows you to install `Python` packages on your computer as well as create and manage multiple `Python` environments, each containing different packages. To get started with conda and `Python`, you will install the Miniconda `Python` distribution, which provides both the conda package manager and a basic `Python` environment. You will then install the `earth-analytics-python` conda environment which provides a tested and easy-to-use conda environment with key packages needed to work with scientific data, including spatial data and more!
