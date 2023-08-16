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
title: 'Loops in Python Exercise'
excerpt: "Loops can be used to automate data tasks in Python by iteratively executing the same code on multiple data structures. Practice using loops to automate certain functionality in Python."
authors: ['Nathan Korinek', 'Leah Wasser']
category: [courses]
class-lesson: ['intro-loops-tb']
permalink: /courses/intro-to-earth-data-science/write-efficient-python-code/loops/loops-exercise/
nav-title: "Loops Exercise"
dateCreated: 2020-07-08
modified: '{:%Y-%m-%d}'.format(datetime.now())
module-type: 'class'
chapter: 18
course: "intro-to-earth-data-science-textbook"
week: 7
sidebar:
  nav:
author_profile: false
comments: true
order: 5
topics:
  reproducible-science-and-programming: ['python']
---
```

{% include toc title="On This Page" icon="file-text" %}

<div class='notice--success' markdown="1">

## <i class="fa fa-graduation-cap" aria-hidden="true"></i> Learning Objectives

This page of exercises will test the skills that you learned in the previous lessons 
in this chapter. You will practice using loops to help with common coding tasks, using 
for and while loops, and looping over different types of data. 

</div>

+++

<div class="notice--warning" markdown="1">

## <i class="fa fa-pencil-square-o" aria-hidden="true"></i> Challenge 1: Print Numbers in a list 

The list below contains temperature values for a location in Boulder, Colorado.
Create a for loop that loops through each value in the list and prints the 
value like this: `

`temp: 47`

HINT: you can print a string and a variable together using the syntax:

`print("temp:", variable_name_here)`

</div>

```{code-cell} ipython3
# Data to convert to celsius

boulder_avg_high_temp_f = [
    47,
    49,
    57,
    64,
    72,
    83,
    89,
    87,
    79,
    67,
    55,
    47
]

boulder_avg_high_temp_f
```

```{code-cell} ipython3
# Add your code here 
```

```{code-cell} ipython3
:tags: [hide]

# Answer

for val in boulder_avg_high_temp_f:
    print("temp:", val)
```

<div class="notice--warning" markdown="1">

## <i class="fa fa-pencil-square-o" aria-hidden="true"></i> Challenge 2: Modify Numeric Values in a List

Below is a list of values that represents the average monthly high temperature 
in Boulder, CO., collected by NOAA. They are currently in Fahrenheit, but can be 
converted to Celsius by subtracting 32, and multiplying by 5/9. 

```
celcius = (fahrenheit - 32) * 5/9
```

Create a **new list** with these same temperatures converted to Celsius using a for loop.
Call your new list: `boulder_avg_high_temp_c`

HINT: to complete this challenge you may want to create a new empty list first. 
Then you can use `list_name.append()` in each loop iteration to add a new 
value to your list. 

</div>

```{code-cell} ipython3
# Add your code here 
```

```{code-cell} ipython3
:tags: [hide]

# Answer

boulder_avg_high_temp_c = []

for f in boulder_avg_high_temp_f:
    c = (f - 32)*(5/9)
    boulder_avg_high_temp_c.append(c)
    
boulder_avg_high_temp_c
```

<div class="notice--warning" markdown="1">

## <i class="fa fa-pencil-square-o" aria-hidden="true"></i> Challenge 3: Round Values In a List  

Create a loop that rounds the values in the list that you created above: 
`boulder_avg_high_temp_c` to only two decimal places. 

To round your data, you can use the **Python** function `round()`. The 
first argument in the `round()` function is the number to round, and the 
second argument is the number of decimals you want after it's been rounded. 
See how this works below.

```
c = 7.3848234
round(c, 2)

# 7.38
```

Create a new list called `boulder_avg_high_temp_c_round` that contains temperature
data that has been rounded. 

</div>

```{code-cell} ipython3
# Add your code here 
```

```{code-cell} ipython3
:tags: [hide]

# Answer

boulder_avg_high_temp_c_round = []

for c in boulder_avg_high_temp_c:
    boulder_avg_high_temp_c_round.append(round(c, 2))
    
boulder_avg_high_temp_c_round
```

+++ {"tags": ["hide"]}

I think we need some better, more applied examples for next year. i suggest
we use the data i used in notebook 3 and have them look through a list of files and print

+++

<div class="notice--warning" markdown="1">

## <i class="fa fa-pencil-square-o" aria-hidden="true"></i> Challenge 4: Print A List of Directories  

The code below creates a list of directories called `all_dirs`.
Create a **for loop** that prints each directory name.

</div>

```{code-cell} ipython3
import os 
from glob import glob
import earthpy as et 

# Download data on average monthly temp for two California sites
file_url = "https://ndownloader.figshare.com/files/21894528"
out_path = et.data.get_data(url = file_url)


# Set working directory to earth-analytics
os.chdir(os.path.join(et.io.HOME, 
                      "earth-analytics", 
                      "data",
                      "earthpy-downloads"))

# Creating all_dirs list of directories to loop through

data_dirs = os.path.join(out_path, "*")
all_dirs = glob(data_dirs)
```

```{code-cell} ipython3
# Add your code here 
```

```{code-cell} ipython3
:tags: [hide]

# Answer

for a_dir in all_dirs:
    print(a_dir)
```

<div class="notice--warning" markdown="1">

## <i class="fa fa-pencil-square-o" aria-hidden="true"></i> Challenge 5: Print A List of All Files Within Each Directory  

Above, you printed the name of each directory stored in a list of directories. 
Use the same for loop that you created above to print a list of all files  in
each directory. 

HINT: you will want to use the glob function to create a list of files within each directory. 

* <a href="https://www.earthdatascience.org/courses/intro-to-earth-data-science/python-code-fundamentals/work-with-files-directories-paths-in-python/os-glob-manipulate-file-paths/">More on using the glob function here</a>
</div>

```{code-cell} ipython3
# Add your code here 
```

```{code-cell} ipython3
:tags: [hide]

# Answer

for a_dir in all_dirs:
    all_files = os.path.join(a_dir, "*")
    print(glob(all_files))
```

<div class="notice--warning" markdown="1">

## <i class="fa fa-pencil-square-o" aria-hidden="true"></i> Bonus Challenge 1: Get Data from List of Files

Above, you created a list inside of a `for` loop to view all of the files 
stored in two separate folders. These files are `csv` files that can be opened 
with **pandas** as a `DataFrame`. The files contain the average monthly temperature 
for two different study locations, Sonoma and San Diego. Their are `csv` files for 
each location for the years between 1999 and 2003. 

For this challenge, use nested `for` loops to get data from the files and find the 
average temperature in January over the years for the two sites. The end result
should be two variables that represent the average January temperature for each site. 
Their are many ways to get this data, so don't be afraid to get creative!

</div>

```{code-cell} ipython3
# You will need pandas for this challenge
import pandas as pd

# Add your code here 
```

```{code-cell} ipython3
:tags: [hide]

# Answer

all_df = []
for a_dir in all_dirs:
    dir_path = os.path.join(a_dir, "*")
    all_file_paths = (glob(dir_path))
    for a_file_path in all_file_paths:
        temp_data_df = pd.read_csv(a_file_path)
        temp_data_df["location"] = os.path.basename(a_dir)
        all_df.append(temp_data_df)
        
all_data = pd.concat(all_df) 

san_diego_df_mean = all_data[all_data["location"] == "San-Diego"].mean()
sonoma_df_mean = all_data[all_data["location"] == "Sonoma"].mean()

san_diego_jan_mean = san_diego_df_mean["January"]
sonoma_jan_mean = sonoma_df_mean["January"]

print("San Diego January Mean Temperature from 1999 to 2003: " + str(round(san_diego_jan_mean, 2)) + " ºF")
print("Sonoma January Mean Temperature from 1999 to 2003: " + str(round(sonoma_jan_mean, 2)) + " ºF")
```

<div class="notice--warning" markdown="1">

## <i class="fa fa-pencil-square-o" aria-hidden="true"></i> Bonus Challenge 2: Collatz Conjecture

The Collatz Conjecture is a mathematic rule that says that if the following 
rules are performed on any positive interger, the number will eventually reach 
1. The rules are:

1. If the integer is even, the next integer is one half of the current integer.
2. If the integer is odd, the next term is 3 times the current integer plus 1. 

If these rules are followed, any integer will eventually reach one. Using a `while` 
loop, implement these rules so that a variable you enter into the while loop has these 
rules run on it until it equals one. Here are some helpful hints to help you implement 
these rules:

1. To check if a number is odd or even in **Python**, it is common practice to see if the remainder of the number divided by 2 equals zero. If you remember, `%` will get the remainder of a number divided by another number. So, to see if a number is even, the code `n%2 == 0` will return `True` if `n` is even, and `False` if `n` is odd.
2. The `while` loop will run until the input number equals one. But you also need to remember not to run the code on the number if it does equal one. So in the odd calculation, make sure that the number doesn't equal one before you run the calculation on it. 

Print out the number variable with each pass through of the while loop. Have your number 
variable equal `10000` before the `while` loop is run. Careful with this, it shouldn't 
take long to run. If it is taking a long time to run, there's probably a mistake in your 
code and your while loop will be running forever until you stop it! Once your code runs, 
change the number variable to see it run on any number you want!

For further explanation on the Collatz Conjecture, and what it looks like to implement it, [this YouTube video explains the basics of the math behind it](https://www.youtube.com/watch?v=5mFpVDpKX70) and [the Wikipedia page on the number has more in depth explanations of the math](https://en.wikipedia.org/wiki/Collatz_conjecture).
</div>

```{code-cell} ipython3
# Add your code here 
```

```{code-cell} ipython3
:tags: [hide]

# Answer 

n = 10000

while n != 1:
    print(n)
    if(n%2 == 0):
        n /= 2
    elif(n !=1):
        n = (n*3)+1
        
print(n)
```
