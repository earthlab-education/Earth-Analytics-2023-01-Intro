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
    title: "Create your own webpage using GitHub pages"
    authors: "Nate Quarderer, Elsa Culler"
    excerpt: |
      <a href="www.github.com" target="_blank">GitHub</a> is a powerful software development tool owned and operated by Microsoft. It is used almost universally for software development and scientific projects. It lets you:
        * Keep track of all the changes you have ever made, when, and why
        * Collaborate with others
        * Get your code online so you can access it anywhere
        * Use a cloud platform to run your code
        * Publish a website in minutes
      We'll be focusing on that last feature in this activity, in which you will create and publish your own online portfolio website. You can read more about `git` and `GitHub` in our open <a href="https://www.earthdatascience.org/courses/intro-to-earth-data-science/git-github/" target="_blank">**Earth Data Science**</a> textbook.
    objective: |
      * Sign up for a GitHub account, if needed
      * Create a GitHub repository
      * Publish a website using <a href="https://pages.github.com/" target="_blank">**GitHub pages**</a>
      * Structure text and other content with <a href="https://www.markdownguide.org/getting-started/" target="_blank">**Markdown**</a>
      * (optional) Use HTML to add additional features
      * (optional) Add a jekyll theme
---

:::{include} ../textbook-header.md
:::

## Portfolio websites help you document and share your work

Why tell potential employers and collaborators what you can do when you can show them? In this activity, you will create a **personal portfolio webpage**. You'll use this webpage to share some biographical information and a photo of yourself. You can then update your webpage with links to work that you complete. 

***

## Step 0: Create a GitHub account
Use <a href="https://github.com/signup" target="_blank">**this link**</a> to create a free GitHub account. 

:::{warning}
If you already have a GitHub account, there is no need to create a new account!
:::

***

## Step 1: Create a new repository

Once you have a GitHub account, get started by creating a new **repository** for your webpage. There are several ways to accomplish this task. 

:::{warning}
Sometimes buttons on GitHub are blue instead of green.
:::

:::{admonition} What is a **repository**?
:class: info margin

A GitHub **repository** is a collection of code, documentation, and configuration files. All changes you make in a repository will be tracked using the version control system **git**. You can discuss and manage your project's work within the repository.
:::

To do this you can:
  1. Navigate to your profile page
  2. Click on the dropdown arrow next to your profile photo in the upper right corner
  3. Select `Your profile`

  ![Select `Your profile`](https://raw.githubusercontent.com/cu-esiil-edu/esiil-stars-student-webpages/main/images/your-profile.png)
  
  4. Select the **Repositories** tab from the menu near the top of the page.

  ![Select the **Repositories** tab from the menu near the top of the page.](https://raw.githubusercontent.com/cu-esiil-edu/esiil-stars-student-webpages/main/images/repositories.png)

  5. From here, you can select the green **New** button on the right to get started.

  ![Select the green **New** button on the right to get started.]("https://raw.githubusercontent.com/cu-esiil-edu/esiil-stars-student-webpages/main/images/new-repo.png)

  6. Customize the settings. You can name your repository anything short and descriptive. We recommend `<yourusername>.github.io` because it results in the simplest url for your website. You can also:
    * Give your repository a **description**
    * Make your repository **Public**
    * You can skip adding the **gitignore** file for now
    * Add a README if you like
    * Choose a **License** for your repository, if you plan to keep any code in the repository. Check out <a href="https://choosealicense.com" target="_blank">choosealicense.com</a> for more information about popular options.
    * Once you're done, select the green **Create Repository** button at the bottom of the page


:::{admonition} Speak Code
:class: data-tip margin

When reading code snippets, the `<` and `>` symbols are used to surround text you should replace with something applicable to you and your project. **Do not leave the `<` and `>` symbols in place!**. For example, in this case your repository name might look something like `jdoe.github.io`, if `jdoe` was your GitHub username.
::: 

***

## Step 2: Create a new `index.md` file
You will create a new file called `index.md` that will serve as the content for your webpage. To do this you can :
  1. Select the **Add file** button from the menu on the right
  2. Select **Create new file**. 

  ![Select **Create new file**.](https://raw.githubusercontent.com/cu-esiil-edu/esiil-stars-student-webpages/main/images/create-new-file.png)

  3. Name your new **Markdown** file `index.md`. This will make it the home page of your website. Then, add a **Markdown header** text to your index file, e.g. 
  ```{code-block}
  # A fabulous Earth Data Science Portfolio
  ```

:::{note}

You can change this text to your name or something else. This is _**your**_ website, and you'll always be able to come back and make edits!
:::

***

## Step 3: Commit changes
Now that you've created your `index.md` file and added some text, you'll want to **commit changes** to your repository. Add an optional extended description of your changes and then select the green **Commit changes** button at the bottom of the page.

![Commit changes](https://raw.githubusercontent.com/cu-esiil-edu/esiil-stars-student-webpages/main/images/commit-changes.png)

***

## Step 4: Build your webpage
Once you've created your `index.md` file you're ready to build your webpage. From your repository, select the **Settings** tab from the right end of the menu. 

<img src="https://raw.githubusercontent.com/cu-esiil-edu/esiil-stars-student-webpages/main/images/settings.png">

From here, scroll down the menu on the **left** and select **Pages**.

<img src="https://raw.githubusercontent.com/cu-esiil-edu/esiil-stars-student-webpages/main/images/pages.png">

Now you'll want to select the **main** option under the **Branch** heading and then select **Save**.

<img src="https://raw.githubusercontent.com/cu-esiil-edu/esiil-stars-student-webpages/main/images/select-branch-main.png">

***

## Step 5: Check on your webpage
Check in on your webpage to see how it is doing by opening the link **`https://username.github.io/`** in a **new tab** in your web browser. Here, you'll need to replace `username` with your GitHub username. Once you see your name (or whatever text you added to your `index.md` file in **Step 2**) appear as a Markdown header, then you know your webpage is working!


:::{note} 

Sometimes your webpage can take a minute or so to build so _be patient_ and refresh every 30 seconds or so until the page is done building. You can track the progress in the `Actions` tab.
:::

***

## Step 6: Start adding information to your webpage
Now you're ready to start adding some more information to your webpage. Navigate back to your repository and open the `index.md` file that you just created. You will edit this page by clicking on the **pencil** icon on the right of the menu near the top of your repository page on GitHub. You will use **Markdown** and **Hypertext Markup Language (HTML)** to add text, links, images, and other content to your webpage. Markdown and HTML are both common markup langauges, and have wide application including formatting text, report writing, and website development.

<img src="https://raw.githubusercontent.com/cu-esiil-edu/esiil-stars-student-webpages/main/images/edit-file.png">

### Here you should think about adding the following information to your webpage:
* A **photo** of yourself
* Your name (as a _**header**_) if you haven't already
* A **bulleted list** of links to your public **contact information** (email, GitHub account, LinkedIn account, social media accounts, etc.)
* Your educational and professional background
* A **biographical paragraph** about yourself
* What you're **excited about learning** about **Earth Data Science**
* **Questions** that you'd like to answer using **Earth Data Science**


:::{note}
:class: margin

You will want to review the <a href="https://www.markdownguide.org/basic-syntax/" target="_blank">**Markdown Basic Syntax guide**</a> to help you format your webpage using **`Markdown`** and **`HTML`**. We also have a <a href="https://www.earthdatascience.org/courses/intro-to-earth-data-science/file-formats/use-text-files/format-text-with-markdown-jupyter-notebook/" target="_blank">**lesson**</a> in our **Earth Data Science** textbook that may be helpful.
:::

:::{note}
:class: margin

> When adding <a href="https://www.w3schools.com/html/html_links.asp" target="_blank">**links**</a> and <a href="https://www.w3schools.com/html/html_images.asp" target="_blank">**images**</a> to your webpage, you may appreciate the added control of Hypertext Markup Language (HTML) over Markdown. 
:::

:::{warning} 

Always remember to **commit changes** so that your updated content gets added to your webpage.
:::

***

## Step 7: Add website metadata and theme

<a href="https://docs.github.com/en/pages/setting-up-a-github-pages-site-with-jekyll/adding-a-theme-to-your-github-pages-site-using-jekyll#adding-a-theme" target="_blank">GitHub pages has some build in themes</a> that you can use to make your website more attractive.

To preview themes:
  1. Go to the <a href="https://pages.github.com/themes/" target="_blank">GitHub theme page</a>
  2. Click on the link to a theme you are interested in. This will take you to the theme **repository**.
  3. Scroll down in the repository until you see a link like "preview what this theme will look like" at the top of the README file (below the code).

The `_config.yml` file that you created to add a theme can also be used to **change the title of your website from the default (the name of your repository)**. Check out the README for your theme to see what parameters are available For example, and example `_config.yml` file for the `minimal` theme looks like:

:::{code-block}
title: J. Doe's Awesome Portfolio Website
description: Check out my projects!
logo: img/headshot.png
remote_theme: pages-themes/minimal@v0.2.0
plugins:
- jekyll-remote-theme
:::

:::{admonition} So what **is** YAML?
:class: data-tip margin

The `_config.yml` file is written in **YAML**, a human-readable format for structured information (lists and key/value pairs). <a href="https://yaml.org/" target="_blank">Learn more about YAML on their website</a>
:::