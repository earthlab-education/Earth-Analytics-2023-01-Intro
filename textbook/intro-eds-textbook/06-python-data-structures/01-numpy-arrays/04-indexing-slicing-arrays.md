---
jupytext:
  formats: ipynb,md:myst
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
title: 'Slice (or Select) Data From Numpy Arrays'
excerpt: "Numpy arrays are an efficient data structure for working with scientific data in Python. Learn how to use indexing to slice (or select) data from one-dimensional and two-dimensional numpy arrays."
authors: ['Jenny Palomino', 'Leah Wasser']
category: [courses]
class-lesson: ['intro-numpy-arrays']
permalink: /courses/intro-to-earth-data-science/scientific-data-structures-python/numpy-arrays/indexing-slicing-numpy-arrays/
nav-title: "Slice Data From Numpy Arrays"
dateCreated: 2019-09-06
modified: '{:%Y-%m-%d}'.format(datetime.now())
module-type: 'class'
course: "intro-to-earth-data-science-textbook"
week: 6
sidebar:
  nav:
author_profile: false
comments: true
order: 4
topics:
  reproducible-science-and-programming: ['python']
---
```

{% include toc title="On This Page" icon="file-text" %}

<div class='notice--success' markdown="1">

## <i class="fa fa-graduation-cap" aria-hidden="true"></i> Learning Objectives

After completing this page, you will be able to:

* Explain the difference in indexing between one-dimensional and two-dimensional **numpy arrays**.
* Use indexing to slice (i.e. select) data from one-dimensional and two-dimensional **numpy arrays**.

</div>


##  Indexing on Numpy Arrays

In a previous chapter that introduced **Python** lists, you learned that **Python** indexing begins with `[0]`, and that you can use indexing to query the value of items within **Python** lists.

You can also access elements (i.e. values) in **numpy** arrays using indexing. 

### Indexing on One-dimensional Numpy Arrays

For one-dimensional **numpy** arrays, you only need to specify one index value, which is the position of the element in the **numpy** array (e.g.  `arrayname[index]`). 

As an example, take a look at the one-dimensional array below which has 3 elements. 

```python
avg_monthly_precip = numpy.array([0.70, 0.75, 1.85])
```

You can use `avg_monthly_precip[2]` to select the third element in (`1.85`) from this one-dimensional **numpy** array. 

Recall that you are using use the index `[2]` for the third place because **Python** indexing begins with `[0]`, not with `[1]`.


### Indexing on Two-dimensional Numpy Arrays

For two-dimensional **numpy** arrays, you need to specify both a row index and a column index for the element (or range of elements) that you want to access. 

For example, review the two-dimensional array below with 2 rows and 3 columns. 

```python
precip_2002_2013 = numpy.array([[1.07, 0.44, 1.5],
                              [0.27, 1.13, 1.72]])
```

To select the element in the second row, third column (`1.72`), you can use:

`precip_2002_2013[1, 2]`

which specifies that you want the element at index `[1]` for the row and index `[2]` for the column. 

Just like for the one-dimensional **numpy** array, you use the index `[1,2]` for the second row, third column because **Python** indexing begins with `[0]`, not with `[1]`

On this page, you will use indexing to select elements within one-dimensional and two-dimensional **numpy** arrays, a selection process referred to as slicing.

  
### Import Python Packages and Get Data

Begin by importing the necessary **Python** packages and downloading and importing the data into **numpy** arrays. 

As you learned previously in this chapter, you will use the **earthpy** package to download the data files, **os** to set the working directory, and **numpy** to import the data files into **numpy** arrays. 

```{code-cell} ipython3
# Import necessary packages
import os

import numpy as np
import earthpy as et
```

```{code-cell} ipython3
# Download .txt with avg monthly precip (inches)
monthly_precip_url = 'https://ndownloader.figshare.com/files/12565616'
et.data.get_data(url=monthly_precip_url)

# Download .csv of precip data for 2002 and 2013 (inches)
precip_2002_2013_url = 'https://ndownloader.figshare.com/files/12707792'
et.data.get_data(url=precip_2002_2013_url)
```

```{code-cell} ipython3
# Set working directory to earth-analytics
os.chdir(os.path.join(et.io.HOME, 'earth-analytics'))
```

```{code-cell} ipython3
# Import average monthly precip
fname = os.path.join("data", "earthpy-downloads",
                     "avg-monthly-precip.txt")

avg_monthly_precip = np.loadtxt(fname)

print(avg_monthly_precip)
```

```{code-cell} ipython3
# Import monthly precip for 2002 and 2013
fname = os.path.join("data", "earthpy-downloads",
                     "monthly-precip-2002-2013.csv")

precip_2002_2013 = np.loadtxt(fname, delimiter=",")

print(precip_2002_2013)
```

## Slice One-dimensional Numpy Arrays

By checking the shape of `avg_monthly_precip` using `.shape`, you know that it contains 12 elements along one dimension (e.g. `[12,]`). 

```{code-cell} ipython3
# Check shape
avg_monthly_precip.shape
```

If you to select the last element of the array, you can use index `[11]`, as you know that indexing in **Python** begins with `[0]`.

```{code-cell} ipython3
# Select the last element of 12 elements
avg_monthly_precip[11]
```

Check out what happens when you query for an index location that does not exist in the array, say the index `[12,]`.

```python
# This code results in the error below
avg_monthly_precip[12]

```

`IndexError: index 12 is out of bounds for axis 0 with size 12`

You are told explicitly that there are 12 elements but that the index `[12]` is not within the bounds of the data.

One way to get around having to explicit know the number of elements is to use shortcuts such as `-1` which identifies the last index for you:

```{code-cell} ipython3
# Select the last element of the array
avg_monthly_precip[-1]
```

### Slice a Range of Values from One-dimensional Numpy Arrays

You can slice a range of elements from one-dimensional **numpy** arrays such as the third, fourth and fifth elements, by specifying an index range: `[starting_value, ending_value]`. 

Note that the index structure is inclusive of the first index value, but not the second index value. So you provide a starting index value for the selection and an ending index value that is not included in the selection. 

Thus, to select the third, fourth and fifth elements, you need to specify the index value for the third element `[2]` as the starting value and then index value for the sixth element `[5]` as the ending value (but it will not be including in the output). 

```{code-cell} ipython3
# Slice range from 3rd to 5th elements
print(avg_monthly_precip[2:5])
```

## Slice Two-dimensional Numpy Arrays

Using `.shape`, you can confirm that `precip_2002_2013` is a two-dimensional array with a row count of 2 with a column count of 12. 

```{code-cell} ipython3
# Check shape
precip_2002_2013.shape
```

To slice elements from two-dimensional arrays, you need to specify both a row index and a column index as `[row_index, column_index]`.

For example, you can use the index `[1,2]` to query the element at the second row, third column in `precip_2002_2013`.

```{code-cell} ipython3
# Select element in 2nd row, 3rd column
precip_2002_2013[1, 2]
```

If you want to select the last element in the array, you need to select the element at the last row, last column.

For `precip_2002_2013` which has 2 rows and 12 columns, the last row index is `[1]`, while the last column index is `[11]`. 

```{code-cell} ipython3
# Select element in 2nd row, 12th column
precip_2002_2013[1, 11]
```

As you become more familiar with slicing, you can start to apply shortcuts, such as `-1` introduced earlier, which can be used to identify the last index for the row and/or column:

```{code-cell} ipython3
# Select element in last row, last column
precip_2002_2013[-1, -1]
```

### Slice a Range of Values from Two-dimensional Numpy Arrays

You can also use a range for the row index and/or column index to slice multiple elements using:

`[start_row_index:end_row_index, start_column_index:end_column_index]`

Recall that the index structure for both the row and column range is inclusive of the first index, but not the second index. 

For example, you can use the index `[0:1, 0:2]` to select the elements in first row, first two columns.

```{code-cell} ipython3
# Slice first row, first two columns
print(precip_2002_2013[0:1, 0:2])
```

You can flip these index values to select elements in the first two rows, first column.

```{code-cell} ipython3
# Slice first two rows, first column
print(precip_2002_2013[0:2, 0:1])
```

If you wanted to slice the second row, second to third columns, you would need to use the index`[1:2, 1:3]`, which again identifies the ending index range but does not include it in the output.

```{code-cell} ipython3
# Slice 2nd row, 2nd and 3rd columns
print(precip_2002_2013[1:2, 1:3])
```

As you become more familiar with slicing, you can start to use shortcuts, such as omitting the first index value `0` to start a slice at the beginning of an index range: 

```{code-cell} ipython3
# Slice first two rows, first two columns
print(precip_2002_2013[:2, :2])
```

Notice that the slices in the examples above provide output as two-dimensional arrays, as the original array that is being sliced is also two-dimensional. 

```{code-cell} ipython3
precip_2002_2013[:2, :2].shape
```

### Use Shortcuts to Create New One-dimensional Array From Row or Column Slice

Recall that `precip_2002_2013` contains two rows (or years) of data for average monthly precipitation (one row for 2002 and one row for 2013) and twelve columns (one for each month). 

You can use shortcuts to easily select an entire row or column by simply specifying the index of the row or column (e.g. `0` for the first, `1` for the second, etc) and providing `:` for the other index (meaning all of the row or column). 

The output of these shortcuts will be one-dimensional arrays, which is very useful if you want to easily plot the data.  

For example, you can use `[:, 0]` to select the entire first column of `precip_2002_2013`, which are all of the values for January (in this case, for 2002 and 2013). 

```{code-cell} ipython3
# Select 1st column
print(precip_2002_2013[:, 0])
```

Or conversely, you can use `[0, :]` to select the entire first row of `precip_2002_2013`, which are all of the monthly values for 2002. 

```{code-cell} ipython3
# Select 1st row
print(precip_2002_2013[0, :])
```

This means that you can create a new **numpy** array of the average monthly precipitation data in 2002 by slicing the first row of values from `precip_2002_2013`. 

Note that the result is an one-dimensional array, which you can use to plot the average monthly precipitation data for 2002. 

```{code-cell} ipython3
# Select 1st row of data for 2002
precip_2002 = precip_2002_2013[0, :]

print(precip_2002.shape)
print(precip_2002)
```

To select rows, there is an even shorter shortcut - you can provide an index for the desired row by itself!

```{code-cell} ipython3
# Select 2nd row of data for 2013
precip_2013 = precip_2002_2013[1]

print(precip_2013.shape)
print(precip_2013)
```

<div class="notice--warning" markdown="1">

## <i class="fa fa-pencil-square-o" aria-hidden="true"></i> Practice Your Numpy Array Skills 

Test your `Python` skills to:

1. Review how to download and import data files into **numpy** arrays to create an array of month names from `months.txt` which is available for download at "https://ndownloader.figshare.com/files/12565619".

2. Create a new **numpy** array for the average monthly precipitation in 2013 by selecting all data values in the last row in `precip_2002_2013` (i.e. data for the year 2013).

3. Convert the values in the **numpy** array from inches to millimeters (1 inch = 25.4 millimeters). 

4. Use the converted **numpy** array for 2013 and the **numpy** array of month names to create plot of Average Monthly Precipitation in 2013 for Boulder, CO.  
    * If needed, review how to <a href="{{ site.url }}/courses/scientists-guide-to-plotting-data-in-python/plot-with-matplotlib/customize-plot-colors-labels-matplotlib/">create **matplotlib** plots with lists</a>, and then substitute the list names for the appropriate numpy array name.  

</div>

```{code-cell} ipython3
---
caption: This is a line plot created from a numpy array for average monthly precipitation
  in 2013 for Boulder, CO. Notice the high average value for September, in which a
  flooding event occurred in Boulder, CO.
label: fig:lineplot_2013_precip_numpy
tags: [hide]
---
# import matplotlib.pyplot as plt 

# # Download data from URL to .txt with month names
# month_names_url = 'https://ndownloader.figshare.com/files/12565619'
# et.data.get_data(url=month_names_url)

# # Import month names
# fname = os.path.join("data", "earthpy-downloads", "months.txt")
# months = np.genfromtxt(fname, dtype='str')

# # create a new array for 2013 from the last row in `precip_2002_2013`
# precip_2013 = precip_2002_2013[1, :]

# precip_2013 *= 25.4

# fig, ax = plt.subplots(figsize=(10,10))

# # add the x-axis and the y-axis to the plot
# ax.plot(months, 
#        precip_2013, 
#        color="blue")

# # set plot title
# ax.set(title="Average Monthly Precipitation in 2013 for Boulder, CO",
#       xlabel="Month", 
#        ylabel="Precipitation (mm)")

# plt.show()
```
