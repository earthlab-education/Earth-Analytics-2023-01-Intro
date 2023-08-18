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
  language: Python
  name: Python3
myst:
  substitutions:
    title: 'Use names to save information for later'
    excerpt: |
      One of the features that makes computer programming such a powerful tool is the ability to retrieve data (i.e. information) you computed earlier from **memory**. In the analogy of your computer as a kitchen, your memory is the **countertop space** - you can access everything in it quickly, but it's easy for it to get too crowded (and you don't want to leave anything there when you're done cooking!). Storing data in memory allows you to:
        * **Hard code** values into your code, like physical constants, conversion factors, and file locations
        * Perform multiple-step **workflows** without needing to save every intermediate step on your hard disk
      You can store data (i.e. information) in `Python` by giving it a **name**. You will need to name everything that you want to re-use in your code (e.g. single numeric value, path to a directory or file). Without names for data, `Python` would only be able to perform the same calculations as a handheld calculator. 
    authors: 'Jenny Palomino, Leah Wasser, Nathan Korinek, Elsa Culler'
    objective: |
      * Explain how names are used in `Python` to store information.
      * Use `Python` code to give names to single data values including numbers and text strings. 
      * Define computer **memory** and **disk space**
      * Describe what the **workspace** is in `Python`
      * Check the data type of a value in your workspace.
---

:::{include} ../../../textbook-header.md
:::

## Use **names** to save data in Python

:::{admonition} Why names and not variables?
:class: note margin

You may also see named values referred to as **variables** in programming. We think this can be confusing, because most people are used to the word **variable** in the context of algebra. In algebra, a **variable** is a value that you don't know the value of. In programming, the value of a variable **is** known, and doesn't change unless you write over it.
:::

A **name** in programming is used to save information that you want to re-use in your code. You can think of it like the contacts in a cellphone -- instead of remembering phone numbers, you save them under someone's name so that you can use them again. Examples of things that you may wish to save in your code include:

* numeric values
* file names, paths, web addresses
* or even larger objects such as a remote sensing image or a terrain model


```{exercise-start}
:label: name-a-variable
```

In `Python`, names can be created without explicitly defining the type of data that it will hold (e.g. integer, text string). You can create a name in `Python` using the following syntax, replacing `name` and `value` with the information you wish to store:

```{code-block} python
name = value
```

```{code-cell}
# Try it out
```

```{exercise-end}
```


```{solution-start} name-a-variable
:class: dropdown
```

```{code-cell} ipython3
a_number = 5

a_number
```

```{solution-end}
```

This syntax for creating names is the same whether you are assigning a numeric or text value to a name. For example, below you assign the name name `a` the value of 3 which is a number:  

`a = 3`

Here is an example of assigning a text string value to the same name named `a`. 

`a = "a word"`

Notice that strings (character values) use double quotes `""` to indicate a text 
string value. 


:::{admonition} **Data Tip:**
:class: data-tip margin

Some programming languages require a 
name to be explicitly assigned a data type when it is created. You do not 
need to worry about this when using ``Python``, however! 
:::


### Easy to Understand Names Make Your Code Easier to Read

Just like you want to use 
<a href="https://www.earthdatascience.org/courses/intro-to-earth-data-science/open-reproducible-science/get-started-open-reproducible-science/best-practices-for-organizing-open-reproducible-science/"> 
expressive naming conventions (names that represent what is stored within 
the directory)</a> for directories on your computer, you also want to use 
short, clear names for your names to make your code easier to read. To 
follow best practices for name names, avoid the following:

* spaces in your name names
* complicated wording
* long name names
* words that do not represent what the name contains (example: `my_name` vs `precip_data`)

When naming a name, you want to keep the name short but specific enough 
that someone reading your code can understand what it contains. It is good 
practice to use underscores (e.g. `boulder_precip_in`) to create multi-word 
name names that provide specifics regarding the name's content. The 
underscore makes the name name easier to read and follows `Python` 
<a href="https://www.`Python`.org/dev/peps/pep-0008/#naming-conventions" target="_blank">PEP 8 best practices for code readability</a>. 


:::{admonition} **Data Tip:**
:class: data-tip margin

Read more about expressive name 
names and clean code <a href="https://www.earthdatascience.org/courses/intro-to-earth-data-science/write-efficient-`Python`-code/intro-to-clean-code/expressive-name-names-make-code-easier-to-read/">
in this earth data science lesson.</a> 
:::


### names Are Available In Your Coding Environment Once Defined 

A key characteristic of names is that once you create a name in your 
coding environment (that is to say you run the actual line of code that defines 
the name), it is available throughout your code. So for example, if you 
create a name at the top of a Jupyter Notebook, the value associated with 
that name will remain the same and can be reused in cells lower down in the 
notebook.

:::{admonition} **Data Tip:**
:class: data-tip margin

You can overwrite an existing name 
if you create a new name with the same name. For example, if you assign 
`a = 5` in one cell and then assign `a = "dog"` in the next cell, the final value 
of `a` will be `"dog"`.
:::

While there are occasions in which you might want to overwrite an existing name 
to assign a new value to it, you want to make sure that you give names both 
clear and distinct names to avoid *accidentally* overwriting name values.   

```{code-cell} ipython3
# Here you assign the name name temperature the value 55 (a number)
temperature = 55

temperature
```

```{code-cell} ipython3
# Note that you can easily reassign a name name 
# to contain a new value (a string / word in this case)
temperature = "doctor"

temperature
```

## About Data Types in `Python`

`Python` data types are important to understand when coding. Below you will learn 
more about the different types of names that you can store including:

* Numbers (integers and floats)
* Strings (letters / characters and words)

## Numeric names in `Python`

In `Python`, you can create names to store numeric values such as integers 
(`int`) which represent whole numbers and floating point numbers which represent 
decimal values (`float`).  

<i class="fa fa-star"></i> **Data Tip:** For more advanced math applications, you can also 
use names to work with <a href="https://docs.`Python`.org/3/library/stdtypes.html#numeric-types-int-float-complex" target="_blank">complex numbers (see `Python` documentation for more details)</a>.
{: .notice--success}

As described previously, you do not need to define which numeric type you want to 
use to create a name. For example, you can create a `int` name called 
`boulder_precip_in`, which contains the value for the 
[average annual precipitation in inches (in) in Boulder, Colorado](https://psl.noaa.gov/boulder/Boulder.mm.precip.html), rounded to the nearest integer.

```{code-cell} ipython3
# This is a comment line in `Python`
boulder_precip_integer = 20

# You can see the value of any name by calling the name name
boulder_precip_integer
```

You can use the `type()` function to figure out the type of data stored in a 
name.

```{code-cell} ipython3
# What is the type of data stored in boulder_precip_in
type(boulder_precip_integer)
```

If your data has decimal places associated with it, it will be stored in `Python` 
as a type: `float`. 

```{code-cell} ipython3
boulder_precip_float = 20.23

boulder_precip_float
```

```{code-cell} ipython3
type(boulder_precip_float)
```

## How to Store Text names: Strings in `Python`

To create a name containing a text string (`str`), you use quotation marks 
(`""`) around the value. For example: 

`name_name = "text"`

While in `Python` the single quote (`''`) and the double quote (`""`) are 
used interchangeably (see the official <a href="https://docs.`Python`.org/3/library/stdtypes.html#text-sequence-type-str" target="_blank">`Python` Docs</a> for more examples), we suggest 
that you use double quotes `""` to define strings (type == `str`) following 
`PEP8` code style for `Python` best practices. Using quotes, you can create `str` 
names that contain a single word or many words, including punctuation. 
Below are some examples of creating a string. 

```{code-cell} ipython3
city = "Boulder"

city
```

```{code-cell} ipython3
city_state = "Boulder, CO"

city_state
```

```{code-cell} ipython3
city_description = "Boulder, CO is the home of the University of Colorado, Boulder campus."

city_description
```

```{admonition} What Does Float() Do?
:class: data-tip margin

Run the code in the cell below. What does the `float()` function do to the value stored in the name named `a`?
```

```{code-cell} ipython3
# Run the code below - what does the float() function do? 
a = 75
b = float(a)
print(a, b)


# What data type is name b? (hint: use the type() function to find out)
```

```{code-cell} ipython3
:tags: [hide]

# Answer to the above activity

b_type = type(b)

# Float turned the integer a into a float name and assigned it to b
```

::::{admonition} Interactive Activity  - Create Some names

It's time for you to create some names of your own! Create the following: 

1. a name called `precip_float` that stores a float value. 
2. a name called `precip_int` that stores an integer value.
3. a name called `location` that stores the string for the location: `New York City`.

For these names, use the [average annual precipitation in New York City](https://www.usclimatedata.com/climate/new-york/new-york/united-states/usny0996), which is 46.23 inches. 

HINT: you can coerce a floating point value to an integer using the `int()` function. Use int() to convert your floating point value to an integer. The name name should be precip_int. 

Try the code below to see how this works:

:::{code-block} python
a = 75.643
b = int(a)
print(a, b)
:::

::::

```{code-cell} ipython3

# Assigning the names from above

precip_float = 46.23
precip_int = int(precip_float)
location = "New York City"
```

## Check the type

In the activities above, you used the `type()` function to determine what type of data are stored in a name. 

`type(name_name)`

For example, you can check the type of `boulder_precip_in` after each time 
that a name is created with that same name to see that the type changes 
from `int` to `float`. 

```{code-cell} ipython3
boulder_precip_in = 21

type(boulder_precip_in)
```

```{code-cell} ipython3
boulder_precip_in = 20.68

type(boulder_precip_in)
```

You can also check the type of the name named `city`, which is a string (`str`) regardless of how many words (or punctuation) it contains. 

```{code-cell} ipython3
city = "Boulder"

type(city)
```

```{code-cell} ipython3
city = "Boulder, CO is the home of the University of Colorado, Boulder campus."

type(city)
```

Checking the type for a name can help you make sure that you understand what a name contains and how it can be used. For example, you can actually create a `str` name that contain numbers if you use the syntax for creating a `str` name (e.g. `name_name = "value"`). Notice below that `city_precip` is still a `str`, even though it contains a number.

```{code-cell} ipython3
city_precip = "20.68"

type(city_precip)
```

If you wanted to perform math on that name, it would not work the way you think it should. 

```{code-cell} ipython3
# Multiply city_precip by 2
city_precip * 2
```

Thus, the value itself is not important for determining whether the name is a numeric or string type - the syntax does this. 

A good reminder that it is important to make sure that you are defining names with the appropriate syntax to distinguish between numeric and string types. 

## Challenge - Data Types & Math

Run the following code which divides name `a` by name `b` (`a/b`). 

```{code-cell} ipython3
a = 5
b = 3
c = a/b
```

Use the `type()` function to determine what type of value is stored in each name defined (`a`, `b`, and `c`).

```{code-cell} ipython3
a = 5
b = 3
c = a/b

type_a = type(a)
type_b = type(b)
type_c = type(c)
```