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
title: 'Lists in Python'
excerpt: "A Python list is a data structure that stores a collection of values in a specified order (or sequence) and is mutable (or changeable). Learn how to create and work with lists in Python."
authors: ['Jenny Palomino', 'Leah Wasser', 'Nathan Korinek']
category: [courses]
class-lesson: ['get-started-python']
permalink: /courses/intro-to-earth-data-science/python-code-fundamentals/get-started-using-python/lists/
nav-title: "Python Lists"
dateCreated: 2019-07-01
modified: '{:%Y-%m-%d}'.format(datetime.now())
module-type: 'class'
course: "intro-to-earth-data-science-textbook"
week: 4
sidebar:
  nav:
author_profile: false
comments: true
order: 3
topics:
  reproducible-science-and-programming: ['python']
redirect_from:
  - "/courses/earth-analytics-bootcamp/python-variables-lists/lists/"
---
```

{% include toc title="On This Page" icon="file-text" %}

<div class='notice--success' markdown="1">

## <i class="fa fa-graduation-cap" aria-hidden="true"></i> Learning Objectives

At the end of this activity, you will be able to:

* Explain how **Python** uses lists to store multiple data values.
* Create new **Python** lists that contain `int`, `float` and `str` values.
* Use the list index to update, add, and remove items in a **Python** list.
 
</div>
 

+++


## What are Python Lists?

A **Python** list is a data structure that stores a collection of values or 
objects in a specified order (or sequence). Some features of **Python** 
lists include:

* They are mutable, which means that they can be changed or updated.
* **Python** lists can store different types of objects and different data types. So, for example a list can contain a mix of `int`, `float` and `str` values. A list can also contain sublists, arrays and other **Python** data structures.  
* Python lists are created using the square brackets, with objects separated by commas. Like this: `[1,2,3]`


### Items Within a Python List Can Be Subsetted Using an Index

Each value in a list is called an item. Since lists are sequences of items 
in a specified order, there is a label for the location or order number of 
each item in the list. This order label is referred to as an index. Indexing 
allows lists to be iterable, meaning that you can access each item in the list, 
in the order in which they appear in the list object. 

### About List Indices in Python

You can use an index value in **Python** to access objects within lists, to 
organize data and to manage the order of the items within the data structure. 
By default, **Python** indexing will always begin at `[0]`, rather `[1]`. 
Thus, the first item in a **Python** list has an index `[0]`, the second item 
in a list has an index `[1]`, and so on. You can use the index of an item to 
access its value. For example, you can use the index `[1]` to get the value 
for the 2nd item (`0.75`) in the following list of values [`0.70, 0.75, 1.85`]. 

<i class="fa fa-star"></i> **Data Tip:** The **Python** programming language uses zero-based indexing. This means that the first element in a list or other data structure will be identified by the value `[0]` rather than `[1]`.
{: .notice--success }


## How to Create a List in Python

To create a **Python** list, you use the following syntax:

`list_name = [item_1, item_2, item_3]`

Notice that the values (soon to be items in a list) are enclosed within square brackets `[]` and are separated from each other using commas `,`. Below, you create a list of numeric floating point values (type = float). 

```{code-cell} ipython3
boulder_precip_in = [0.70, 0.75, 1.85]

boulder_precip_in
```

```{code-cell} ipython3
# Get the second value in the list above using indexing
boulder_precip_in[1]
```

You can also create lists of `str` values. Just like defining `str` variables, you need to enclose the individual text strings using quotes `""`. 

```{code-cell} ipython3
months = ["January", "February", "March"]

months
```

You can also create a list that contains different types of data (e.g. `int`, `float`, `str`), including other defined variables.

```{code-cell} ipython3
jan = 0.70

boulder_avg_precip = [1, jan, "January"]

boulder_avg_precip
```

<div class="notice--warning" markdown="1">

## <i class="fa fa-pencil-square-o" aria-hidden="true"></i> Challenge - Test Your Knowledge

Look at the list above called boulder_avg_precip. Why did the value `jan` translate to `0.7` when you printed the list in the cell above?

</div>

+++ {"tags": ["hide"]}

### Answer to the test you knowledge

`jan` translated to `0.7` instead of `0.70` because **Python** stored the value of the variable, not the variable exactly as you wrote it. Since the trailing 0 on the end of `0.70` contained no information, **Python** didn't store it in the variable.

+++

### Use the Type() Function in Python to Determine the Object Type

Similar to the previous lesson, you can use the `type()` function to confirm the type of 
an object. Below you see that the object that we created above, is indeed a list: 

`type(list_name)`

```{code-cell} ipython3
type(boulder_avg_precip)
```

## Print the Length of a List Using `len()`
 
To use list indexing efficiently, it is helpful to know how long the list is. Length in this case refers to how many items are stored in the list. You can use the **Python** function `len()` to query this information by including the name of the list as a parameter, or input, to the function as follows: 

`len(list_name)` 

Using `len()`, you can see that `months` contains 3 items, as it only contained `str` values for January through March. 

```{code-cell} ipython3
months
```

```{code-cell} ipython3
print("The length of the months list is:", len(months))
```

<div class="notice--warning" markdown="1">

## <i class="fa fa-pencil-square-o" aria-hidden="true"></i> Challenge - Create Your First List

Make a list called `precip_by_location` that has a length of 3 and contains a string for `New York City` at index `2`, a float for the [average annual precipitation in New York City](https://www.usclimatedata.com/climate/new-york/new-york/united-states/usny0996) (46.23 inches), and a string for the units (`inches`). 

Note that this means the float value for precipitation and the string value for units can be in any location, but the string for `New York City` needs to be at index `2`. 

</div>

```{code-cell} ipython3
:tags: [hide]

# Creating list answer

precip_by_location = [46.23, "inches", "New York City"]
```

## Access Objects Stored in a Python List: Indexing

As **Python** indexing begins at `[0]`, you can use the list index to query the value of the nth item in the list using the syntax `month[index]`, where index is equal to:

`number of items - 1` or `n-1`

For example, if you want to query the second item in the `months` list, you will need to use the index value that results from `2-1`, or `1`.

```{code-cell} ipython3
months[1]
```

Note that calling an index value that is larger than `n-1` will result in an error that the index does not exist. For example, when you run, `months[3]`, Python will return the following error:

`IndexError: list index out of range`

because there are only three items in the list and the index value of `3` actually represents a 4th item that does not exist. 

+++

## Update Items in Python Lists

In addition to querying values, you can also use the list index to update items in a list by assigning a new value to that index location. For example, if you want to update the value stored at `months[index]`, you can assign a new value with:

`months[index] = value`

```{code-cell} ipython3
boulder_precip_in[1] = 0

boulder_precip_in
```

```{code-cell} ipython3
months[1] = "Feb"

months
```

## Insert Items into Lists

You can also use the list index to insert new items into a list by specifying 
at which index location you want to the new value to be. The index locations 
for the other values in the list will be automatically updated. For example, 
if you want to insert a value at the beginning of the list, you can use:

`list_name.insert(0, value)`

In the example below, the months list is incomplete, and the value for January 
is inserted at the beginning of the list. This automatically updates the index 
locations for the existing items, such as `February`, which began as index `0` 
and becomes index `1` when `January` is inserting at the beginning of the list.  

```{code-cell} ipython3
# Month list missing the first value for January
months = ["February", "March"]

# Check index value at 0
months[0]
```

```{code-cell} ipython3
# Modify list to add January at the beginning
months.insert(0, "January")

months
```

```{code-cell} ipython3
# Check index value at 0 in modified list
months[0]
```

```{code-cell} ipython3
# February is now at index 1
months[1]
```

## Delete Items From a Python List

You can delete unwanted items from an existing list using the `del` statement: 

`del list_name[index]` 

Once again, checking the length of a list is helpful before using the list index to modify the list.

```{code-cell} ipython3
len(boulder_precip_in)
```

```{code-cell} ipython3
del months[2]

months
```

## Append an Item to a Python List

To add an item to the end of a list, you can use the `.append()` function that is associated with lists (referred to as a method of the list object). You can call this method to add values to a list using the syntax: 

`listname.append(value)` 

```{code-cell} ipython3
months.append("March")

months
```

```{code-cell} ipython3
boulder_precip_in.append(2.93)

boulder_precip_in
```

## Add Items to List

You can also add items to a list using the addition operation `+`.

For example, you can add items to the beginning of a list using the following syntax: 

`listname = [value] + listname`

```{code-cell} ipython3
boulder_precip_in = [-9999] + boulder_precip_in

boulder_precip_in
```


<div class="notice--success" markdown="1">

## <i class="fa fa-star"></i> **Data Tip:** Append Items to an Existing Python List 

You can add items to a list using the addition operator `+`.
For example, you can add items to the beginning of a list using the following syntax: 

`listname = [value] + listname`

You can also add items to the end of a list by using the addition assignment operator `+=`:

`listname += [value]`

which combines the steps to add and set the list equal to itself plus the new value. 

However we suggest that you use `.append()` to append items to a list rather than 
the addition operator as a **Python** best practice.

</div>

+++

<div class="notice--warning" markdown="1">

## <i class="fa fa-pencil-square-o" aria-hidden="true"></i> Challenge - Modify Lists

Use the skills you just learned to modify the list `precip_by_location` created above. It should look like: 

`[1, 20.23, 'inches', 'Boulder', 'Colorado']`

There are a lot of ways to update the `precip_by_location` object with the new values. Don't be afraid to be creative! 

</div>

```{code-cell} ipython3
:tags: [hide]

# Modifying the list with the functions above

precip_by_location[0] = 20.23

precip_by_location.insert(0, 1)

del precip_by_location[3]

precip_by_location += ["Boulder", "Colorado"]

precip_by_location
```

<div class="notice--warning" markdown="1">

## <i class="fa fa-pencil-square-o" aria-hidden="true"></i> Challenge - Create a List of Lists

The syntax for creating a list composed of sublists is below. 

`[["sub-list-one"],["sub-list-two"]]`

Notice that the hierarchy for the top level of the list of lists is defined 
by square brackets (`[]`) and then each sublist is also defined by square 
brackets, separated by a comma. You can add values to each sublist using the 
syntax below:
 
```python
list_of_lists = [[1,2,3], [8,9,10]]
list_of_lists
```

Run the code above, then answer the following questions:

1. What is returned when you grab the first item (`list_of_lists[0]`) in the list? 
2. What is the object `type()` of `list_of_lists[0]`?

</div>

```{code-cell} ipython3
:tags: [hide]

# Creating list of lists

list_of_lists = [[1,2,3], [8,9,10]]
```

<div class="notice--warning" markdown="1">

## <i class="fa fa-pencil-square-o" aria-hidden="true"></i> Challenge - Create a List of Lists

The syntax for accessing the second item in the first sublist is as follows:

`list_of_lists[0][1]`
 
Access the second item in the second sublist. HINT: the value returned should be `2`.

</div>

```{code-cell} ipython3
:tags: [hide]

# Accessing 2 in the list of lists

list_of_lists[0][1]
```
