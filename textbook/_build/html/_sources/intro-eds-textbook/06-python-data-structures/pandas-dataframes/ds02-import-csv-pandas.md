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
title: 'Import CSV Files Into Pandas Dataframes'
excerpt: "Pandas dataframes are a commonly used scientific data structure in Python that store tabular data using rows and columns with headers. Learn how to import text data from .csv files into numpy arrays."
authors: ['Jenny Palomino', 'Leah Wasser']
category: [courses]
class-lesson: ['intro-pandas-dataframes']
permalink: /courses/intro-to-earth-data-science/scientific-data-structures-python/pandas-dataframes/import-csv-files-pandas-dataframes/
nav-title: "Import Data Into Dataframes"
dateCreated: 2019-09-06
modified: '{:%Y-%m-%d}'.format(datetime.now())
module-type: 'class'
course: "intro-to-earth-data-science-textbook"
week: 6
sidebar:
  nav:
author_profile: false
comments: true
order: 2
topics:
  reproducible-science-and-programming: ['python']
redirect_from:
  - "/courses/earth-analytics-bootcamp/pandas-dataframes/import-csv-files-pandas-dataframes/"
  - "/courses/earth-analytics-python/use-time-series-data-in-python/spreadsheet-data-in-python/"
---
```

{% include toc title="On This Page" icon="file-text" %}

<div class='notice--success' markdown="1">

## <i class="fa fa-graduation-cap" aria-hidden="true"></i> Learning Objectives

* Import tabular data from .csv files into **pandas** dataframes. 

</div>


## CSV Files of Tabular Data as Inputs to Pandas Dataframes 

Recall that scientific data can come in a variety of file formats and types, including comma-separated values files (.csv), which use delimiters such as commas (or some other delimiter like tab spaces or semi-colons) to indicate separate values. 

CSV files also support labeled names for the columns, referred to as headers. This means that CSV files can easily support multiple columns of related data, and thus, are very useful for collecting and organizing datasets across multiple locations and/or timeframes. 

As you learned previously in this chapter, you can manually define **pandas** dataframes as needed using the `pandas.DataFrame()` function. However, when working with larger datasets, you will want to import data directly into **pandas** dataframes from .csv files. 


## Get Data to Import Into Pandas Dataframes
  
To import data into **pandas** dataframes, you will need to import the **pandas** package, and you will use the **earthpy** package to download the data files from the Earth Lab data repository on **Figshare.com**. 

```{code-cell} ipython3
# Import packages
import os

import matplotlib.pyplot as plt
import pandas as pd
import earthpy as et
```

Recall from the previous chapter on <a href="{{ site.url }}/courses/intro-to-earth-data-science/scientific-data-structures-python/numpy-arrays/">**numpy** arrays</a> that you can use the function `data.get_data()` from the **earthpy** package (which you imported with the alias `et`) to download data from online sources such as the **Figshare.com** data repository. To use the function `et.data.get_data()`, you need to provide a parameter value for the `url`, which you define by providing a text string of the URL to the dataset.

Begin by downloading a **.csv** file for average monthly precipitation for Boulder, CO from the following URL: 

`https://ndownloader.figshare.com/files/12710618`

```{code-cell} ipython3
# URL for .csv with avg monthly precip data
avg_monthly_precip_url = "https://ndownloader.figshare.com/files/12710618"

# Download file from URL
et.data.get_data(url=avg_monthly_precip_url)
```

```{code-cell} ipython3
# Set working directory to earth-analytics
os.chdir(os.path.join(et.io.HOME, 
                      "earth-analytics", 
                      "data"))
```

## Import Tabular Data from CSV Files into Pandas Dataframes

Using the `read_csv()` function from the `pandas` package, you can import tabular data from CSV files into `pandas dataframe` by specifying a parameter value for the file name (e.g. `pd.read_csv("filename.csv")`). Remember that you gave `pandas` an alias (`pd`), so you will use `pd` to call `pandas` functions. 

```{code-cell} ipython3
# Import data from .csv file
fname = os.path.join("earthpy-downloads",
                     "avg-precip-months-seasons.csv")

avg_monthly_precip = pd.read_csv(fname)

avg_monthly_precip
```

As you can see, the `months` and `precip` data can exist together in the same **pandas** dataframe, which differs from **numpy** arrays. You can see that there is also a column for `seasons` containing text strings. 

Once again, you can also see that the indexing still begins with `[0]`, as it does for **Python** lists and **numpy** arrays, and that you did not have to use the `print()` function to see a nicely formatted version of the **pandas** dataframe. 

+++

<div class="notice--warning" markdown="1">

## <i class="fa fa-pencil-square-o" aria-hidden="true"></i> Challenge 1: Plot a DataFrame

In the previous lesson you learned how to plot a pandas dataframe using matplotlib.
Test your your skills by plotting the data frame that you opened above.
Instead of using `ax.plot()`, use `ax.bar()` to create your plot. 

HINT: to make this plot work, you will have to specify the x axis variable and then 
height instead of y. Your code will look something like this:

```python
ax.bar(x=dataframe.column,
       height=dataframe.column)
```
</div>

```{code-cell} ipython3
:caption: Bar plot of average monthly precipitation using matplotlib.
:tags: [hide]

f, ax = plt.subplots()

ax.bar(x=avg_monthly_precip.months,
       height=avg_monthly_precip.precip,
      color="purple")

ax.set(title = "Plot of Average Monthly Precip")
plt.show()
```

You now know how to import data from **.csv** files into **pandas** dataframes, which will come in very handy as you begin to work with scientific data. On the next pages of this chapter, you will learn how to work with **pandas** dataframes to run calculations, summarize data, and more.
