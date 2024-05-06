# GitHub Gems: Driving Open-Source Investments With Data

Welcome to the GitHub Gems project! This project hosts a data analytics pipeline that enables smarter investment decisions by measuring the popularity of open-source repos on Github.

## Project Overview

The goal of this project is to develop an efficient data pipeline that streamlines analytics, reduces manual effort, and enables deeper insights into the open-source ecosystem on GitHub. By leveraging modern data tools and best practices, such as dbt (data build tool) and Airflow, we aim to create a scalable and reliable solution for data-driven decision-making.

# Important metrics
We need to extract important metrics for our pipeline. Metrics are essential because they provide a comprehensive and quantifiable picture of an open source project's health, potential for growth, and alignment with investor objectives. This allows companies and individuals to make informed, strategic decisions about where to allocate resources for maximum impact and return.

### Github Stars
Github stars are important metrics that provide us an idea of how many people have saved a particular repository. 

### Forks 
GitHub forks are valuable indicators that show us how many people have copied a particular repository to work on independently.

### Contributors 
GitHub contributors are key figures that tell us how many people have actively participated in developing a particular repository.

### Pull Requests 
Both open and merged pull requests provide insight into how the project handles incoming contributions and its openness to community involvement.

### Commit Frequency 
Measures how active the project is. Frequent commits typically indicate ongoing development and maintenance.

### Watchers
GitHub watchers are crucial observers who signal their interest in a repository by subscribing to receive notifications about its updates.

### Visitors
GitHub visitors are important metrics that indicate how many people have viewed a particular repository, offering insights into its popularity and reach.

### Git Clones
Git clones are essential metrics that show how many times a repository has been duplicated, indicating its influence and reach within the developer community.

### Package Downloads
Package downloads are significant metrics that reflect the number of times a software package has been downloaded, demonstrating its usage and popularity.

# What is the source of our data?
For our project we need to have a way to access all open source repositories' data. We have a few options, but we are most interest in two of them, GitHub API and GH Archive. 

Lets discuss the difference between them, the pros and cons.

### Advantages of the Github API
* Most recent fresh data
* Speed and performance
* Data accuracy
* Not a third party 

### Disatvantages of the Github API
* Primary rate limit for requests (5000 requests per hour for authorized users and 15000 requests per hour for enterprise users)
* Complex load logic
* Not primarily focused on archived data

### Advantages of GH Archive
* Offers a comprehensive, historical log of GitHub events dating back to 2011.
* Free to use and easily accessible for downloading historical GitHub event data.
* Provides access to a massive amount of data because it records all public GitHub events.

### Disatvantages of GH Archive
* Third party source
* Can have slower speed compared to Github API
* No real time data

GH Archive is an invaluable resource for historical data analysis and large-scale trend observations on GitHub projects. However, its use involves significant data handling, processing demands, and potential costs, making it less suitable for real-time applications, small-scale needs, or users without substantial data processing capabilities. For tasks requiring real-time data or targeted queries, the GitHub API may be a more appropriate choice.

In our case, it would be the best to work with GH Arhcive, simply because there are no request limitations. 

### What format is our data delivered in?
Since we are getting the data from the GH Archive, we should expect it in a JSON format. JSON format is the proper format when we are working with large amount of data.

GH Archive is being updated hourly, so we can expect hourly updates.
