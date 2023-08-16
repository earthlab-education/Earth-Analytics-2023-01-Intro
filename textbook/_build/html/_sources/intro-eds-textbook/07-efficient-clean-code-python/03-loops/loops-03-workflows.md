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
title: 'Create Data Workflows with Loops'
excerpt: "Loops can be an important part of creating a data workflow in Python. Use loops to go from raw data to a finished project more effeciently."
authors: ['Leah Wasser', 'Nathan Korinek']
category: [courses]
class-lesson: ['intro-loops-tb']
permalink: /courses/intro-to-earth-data-science/write-efficient-python-code/loops/data-workflows-with-loops/
nav-title: "Create Data Workflows with Loops"
dateCreated: 2020-07-07
modified: '{:%Y-%m-%d}'.format(datetime.now())
module-type: 'class'
chapter: 18
course: "intro-to-earth-data-science-textbook"
week: 7
sidebar:
  nav:
author_profile: false
comments: true
order: 3
topics:
  reproducible-science-and-programming: ['python']
---
```

{% include toc title="On This Page" icon="file-text" %}

<div class='notice--success' markdown="1">

## <i class="fa fa-graduation-cap" aria-hidden="true"></i> Learning Objectives

After completing this chapter, you will be able to:

* Iterate through multiple directories to access data within.
* Nest loops in each other to run more complicated loops.
* Use for loops to combine multiple datasets into one **Pandas** `DataFrame`.

 
</div>

+++

## Build a Data Workflow 

Often, the data that you need for your workflow is messy and sometimes 
difficult to access. It can be spread out over multiple files in many 
directories. Manually processing data in multiple files and directories 
manually is time consuming. It can be much easier to automate the process in 
**Python** with `for` loops! This lesson will cover using loops to automate 
data workflows where you have many different files that you need to work with. 

```{code-cell} ipython3
import os
from glob import glob
import matplotlib.pyplot as plt
import pandas as pd
import earthpy as et

# Download data on average monthly temp for two California sites
file_url = "https://ndownloader.figshare.com/files/21894528"
data_path = et.data.get_data(url=file_url)
data_path

# Set working directory to earth-analytics
os.chdir(os.path.join(et.io.HOME,
                      "earth-analytics",
                      "data",
                      "earthpy-downloads"))
```

```{code-cell} ipython3
# List directories for the data
os.listdir(data_path)
```

The data downloaded above contain temperature data for two cities in California, 
USA: Sonoma and San Diego. Within each directory you will find temperature
data for the year stored in individual **.csv** files. Like this:


```
Sonoma-1999-temp.csv
Sonoma-2000-temp.csv
Sonoma-2001-temp.csv
```

Your analysis goal is to create a plot of temperature across all years that you
have data for in both locations. To create this plot, you will need to:

1. open each file
2. combine the data for each year into a single dataframe
3. add an attribute that specifies the location and year to the `data.frame` 

The above steps will allow you to summarize the plot the data.

### Explore Your Data Using Loops

It's normal to open and look at your directory structure after you download new data.
You can, however, also explore the data using `glob` to list directories and files 
within each directory. To begin, create a list of all the directories in your 
new download directory. If you remember from <a href="{{ site.baseurl }}/courses/intro-to-earth-data-science/python-code-fundamentals/work-with-files-directories-paths-in-python/os-glob-manipulate-file-paths/">Chapter 12 of this textbook, </a> you can use `glob` to create a list of files that match 
certain criteria. You can then iterate through those lists with `for` loops to
perform an operation on each file.

Here, you create a list using `glob` of all of the folders in the data you 
downloaded, and then iterate through that list with a `for` loop to print 
out the name of each folder within the main directory.

```{code-cell} ipython3
# Print all dirs found by glob
data_dirs = os.path.join(data_path, "*")
all_dirs = glob(data_dirs)

for a_dir in all_dirs:
    print(a_dir)
```

### Use `glob` Inside a `for` Loop

The folders printed out above are interesting, but they are not the files you 
want to work on. The files are another directory down, stored within the folders 
printed above. To access these files, you can use `glob` once again. Inside the 
`for` loop, you can use `glob` to create a list of all of the files within each 
folder in the original list. 

Below you can see two different lists printed, one with all of the files stored in 
the `San-Diego` folder, and one with all of the files stored in the `Sonoma` folder. 

```{code-cell} ipython3
# Create lists inside a for loop
for a_dir in all_dirs:
    all_files = os.path.join(a_dir, "*")
    print(glob(all_files))
```

### Nesting `for` Loops

Now that you've created another list inside of a `for` loop, you can loop 
through that list too! Below, you create the list of files inside each directory 
with `glob`, and then you loop through that list to print out each individual file. 

Nesting `for` loops is a powerful tool, but can also be computationally expensive. 
Each time the outer loop executes one cycle, the `for` loop that's nested inside must 
complete it's entire loop before the outer loop executes it's next cycle. You can nest 
as many `for` loops as you want, but it's good to keep this in mind. The more `for` 
loops that are nested, the longer each cycle of the outer `for` loop will take. 

```{code-cell} ipython3
# Nesting for loops
for a_dir in all_dirs:
    dir_path = os.path.join(a_dir, "*")
    all_file_paths = (glob(dir_path))
    # Create a nested loop which loops through each directory
    for a_file_path in all_file_paths:
        print(a_file_path)
```

<div class='notice--success alert alert-info' markdown="1">

<i class="fa fa-star"></i> **Data Tip:** Assigning Variables in `for` Loops

When assigning variables in **Python**, overwriting a variable with new data 
can be useful to update values and make your code more legible. This can be useful 
in `for` loops too, but can easily be done by accident as well. Below, you see that 
for every file in the two folders that contain your data, the line `pd.read_csv()` 
is run, and assigned to the variable `data`. However, with each new cycle of the for 
loop, that variable is getting reassigned to a new file's data. 

You can see that even though you opened up and read every single file into **pandas**, 
the only data stored in the `data` variable is from the last file that was read, which 
happens to be the 2003 data from the Sonoma folder. 

To avoid this data being overwritten every cycle, a common work around is to create a 
list outside of the for loop, and append all of the values into that list. That way 
the `data` variable from each cycle will be stored in the list with the data from that 
cycle stored in it, preventing it from being overwritten. 

</div>

```{code-cell} ipython3
for a_dir in all_dirs:
    dir_path = os.path.join(a_dir, "*")
    all_file_paths = (glob(dir_path))
    # Create a nested loop which loops through each directory
    for a_file_path in all_file_paths:
        print(a_file_path)
        # Read the file into a pandas dataframe and assign it to a variable
        temp_data_df = pd.read_csv(a_file_path)
temp_data_df
```

### Combining Pandas Datasets in a List

**pandas** has a lot of functionality that makes modifying large amounts of 
data much easier. One such function is the `concat` function, which can be 
used to combine multiple **pandas** `DataFrames` stored in a list into one 
`DataFrame`. You can combine this functionality with a list of `DataFrames` 
created and added to a list in a `for` loop, and create a final `DataFrame` 
with all of the data stored in the directory structure. 

```{code-cell} ipython3
# Create a list outside of the for loop to store data
all_df = []

for a_dir in all_dirs:
    dir_path = os.path.join(a_dir, "*")
    all_file_paths = (glob(dir_path))
    for a_file_path in all_file_paths:
        temp_data_df = pd.read_csv(a_file_path)
        # Append the data to the list you made to prevent it from being overwritten
        all_df.append(temp_data_df)

# Combine all the dataframes stored in the all_df list into one pandas dataframe
pd.concat(all_df)
```

### Extracting Data from Pathnames

Often times when data is stored in many directories, the name of the folder 
that the data is stored in can have useful information. Some examples of this include: 

1. The date the data was collected
2. The location where the data was collected
3. Physical attributes of the data
4. The resolution of the data

There are countless other examples of data that can be stored in a file pathname. 
Because of this, it can be useful to add data from a pathname to your 
data. 

In this example, the two folders that store all of the files contain useful 
information in the folder names. Specifically, the names, `San-Diego` and `Sonoma`, 
are indicative of where the data was collected. You can add this information to a new 
column in the **pandas** `DataFrames` you are creating. 

+++

<div class='notice--success alert alert-info' markdown="1">

<i class="fa fa-star"></i> **Data Tip:** Extracting Values from Pathnames

You can extract information from a path name in many ways. 
In this exercise, we use `os.path.basename()` to get our information, but
that is not always the best way to collect information from a path. This wouldn't
work if, for example, the infomation you wanted from a path wasn't last folder name 
in your pathname. For more ways to extract information from a path, see 
<a href="{{ site.baseurl }}/courses/intro-to-earth-data-science/python-code-fundamentals/work-with-files-directories-paths-in-python/os-glob-manipulate-file-paths/">this lesson modifying paths with `glob` and `os`.</a> 

</div>

+++

You can extract the last folder name in your pathname by using `os.path.basename()`. 
This function will grab the last folder name in a pathname and return 
it as a string.

```{code-cell} ipython3
# Get the basename from a pathname

basename = os.path.basename(all_dirs[0])

print("The pathname without running os.path.basename():\n" + all_dirs[0])
print("\nThe infromation extracted from the pathname by os.path.basename():\n" + basename)
```

```{code-cell} ipython3
# Read in filenames without modifying the pathnames

all_df = []
for a_dir in all_dirs:
    dir_path = os.path.join(a_dir, "*")
    all_file_paths = (glob(dir_path))
    for a_file_path in all_file_paths:
        temp_data_df = pd.read_csv(a_file_path)
        # Reading the pathname from each directory into the dataframe.
        # Notice how it reads in the entire pathname.
        temp_data_df["location"] = a_dir
        all_df.append(temp_data_df)

pd.concat(all_df)
```

```{code-cell} ipython3
# Read in filenames using os to modify the pathnames

all_df = []
for a_dir in all_dirs:
    dir_path = os.path.join(a_dir, "*")
    all_file_paths = (glob(dir_path))
    for a_file_path in all_file_paths:
        temp_data_df = pd.read_csv(a_file_path)
        # Read the pathname from each directory into the dataframe. 
        # Notice how it reads just the last folder name into the column now.
        temp_data_df["location"] = os.path.basename(a_dir)
        all_df.append(temp_data_df)

all_data = pd.concat(all_df)
all_data
```

### Plot Your Temperature Data

With the new column that specifies where the data was collected, you can use 
the **pandas** `groupby` function to plot a chart for each location! The `groupby` 
function will create a new plot for each unique entry in a column. Since there are 
two locations in the `location` column, you can produce two graphs, one for each location. 

Below, you can create a new column that is the mean of all of the monthly readings for 
the average temperature in each location. With that column, you can plot the average 
annual temperature of each location by year using the `groupby` function.

```{code-cell} ipython3
# Creating a dataframe that is just the columns for temperature from each month.
just_monthly_data_df = all_data.loc[:, "January":"December"]

# Get the average of each row in that dataframe and assigning the output to a new column in the original dataframe
all_data['annual_average_temp'] = just_monthly_data_df.mean(axis=1)
all_data
```

```{code-cell} ipython3
# Sort the data by year for nicer plotting
all_data.sort_values("Year", inplace=True)
```

```{code-cell} ipython3
---
caption: Plot showing average annual temperature for San Diego and Sonoma from 1999
  to 2003.
---
f, ax = plt.subplots()
for title, group in all_data.groupby('location'):
    group.groupby('location').plot(x='Year', 
                                   y='annual_average_temp',
                                   title="Annual Average Temperature ºF",
                                   label=title,
                                   style='.--',
                                   ax=ax, 
                                   alpha=.8)

    
ax.set(xlabel="Year", ylabel="Temperature (F)", xticks=[1999, 2000, 2001, 2002, 2003])

plt.show()
```

<div class="notice--warning" markdown="1">

## <i class="fa fa-pencil-square-o" aria-hidden="true"></i> Challenge 1: Plot Temperature by Maximum Value

Above, you summarized the year by the average temperature for each year, plotted the 
two locations to compare their average annual temperatures. In this challenge, plot 
the maximum annual temperature for each location annually. Your graph should look 
similar to the one above, but it should display the maximum annual temperature instead 
of the average. You can use a similar method to getting the average to get the maximum 
temperature. Using `max` instead of `mean` of the `just_monthly_data_df` should return 
a series of data that's the maximum values, which you can then assign to a column in the 
main dataframe and plot like above.  
</div>

```{code-cell} ipython3
# Create data and plot answer here
```

```{code-cell} ipython3
:tags: [hide]

# Get the average of each row in that dataframe and assigning the output to a new column in the original dataframe
all_data['annual_maximum_temp'] = just_monthly_data_df.max(axis=1)

# Sort data again
all_data.sort_values("Year", inplace=True)
```

```{code-cell} ipython3
---
caption: Challenge 1 Example Plot showing maximum annual temperature for San Diego
  and Sonoma from 1999 to 2003.
tags: [hide]
---
f, ax = plt.subplots()
for title, group in all_data.groupby('location'):
    group.groupby('location').plot(x='Year', 
                                   y='annual_maximum_temp',
                                   title="Challenge 1 Plot: Annual Maximum Temperature ºF",
                                   label=title,
                                   style='.--',
                                   ax=ax, 
                                   alpha=.8)
    
ax.set(xlabel="Year", ylabel="Temperature (F)", xticks=[1999, 2000, 2001, 2002, 2003])

plt.show()
```
