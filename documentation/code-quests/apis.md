---
layout: default
title: APIs
parent: Code Quests
nav_order: 3 # Order under the "Coding Quests" section
permalink: /docs/code-quests/apis/
---
# APIs Main Quest

There are several key benefits of using an API for your project. APIs can help you to retrieve up to date data and enable external developers to (in a way) rely on a third party organization in order to add functionality to existing solutions. APIs allow for access to many online services for your project. The possibilities are endless because they simply provide data and can be used by nearly any programming language, allowing you to use the data in any way you see fit. APIs also play a strong role in terms of security governance, limiting access to any software that an application might not be allowed to use.

### Level One: 
→ Instructions shown below.
### Level Two: 
→ A hands-on API ques­t to practice fetching data, parsing responses, and displaying information from an external service.an accept the assignment [<u>here</u>](https://classroom.github.com/a/6zvc_FYg). 
### Level Three: 
→ Creating your own project. The instructions can be found [<u>here</u>](https://github.com/BU-Spark-Learning-Ambassadors/API-level-3).

---

# APIs Level One
## Overview – what you should learn  

### Vocabulary

- HTTP methods

- Request

- Status code

- Headers

- Body

- Authentication

- JSON

- API key

- Query parameters

- REST Api

### Concepts

- API common uses

- Implementing requests

- Types of APIs

- Reading and understanding status codes

- Implementing query parameters

- Accessing API endpoints

> **HTTP methods —** <span class="mark">also known as HTTP verbs: These
> methods define the actions that can be performed on resources within a
> server. A few of the most common methods includes GET, POST, PUT,
> PATCH, etc</span>
>
> **<span class="mark">Request</span> —** a message sent by the user to
> the server which asks for an action to be performed. This includes but
> is not limited to HTTP methods, headers, and more
>
> **<span class="mark">Status code</span> —** a code that shows the
> status or result of a request and are part of the HTTP response
>
> **Headers —** Key-value pairs sent with both requests and responses
> that provide additional information, such as content type,
> authentication tokens, or caching instructions
>
> **Body —** part of a request or response that contains the data being
> sent
>
> **Authentication —** the process of verifying the identity of a user
> or system. APIs can require authentication so that only authorized
> users can access certain endpoints
>
> **JSON** **—** a data-interchange format that is easy for humans to
> read and write, and easy for machines to parse and generate
>
> **API key —** a unique identifier used to authenticate a client making
> an API request
>
> **Query parameters —** used to modify and change the behavior of the
> request in order to customize the response
>
> **REST API —** also known as RESTful API: the most common form of API
> today. It's web-based, uses HTTP verbs, and thus is widely used for
> designing networked applications

## What are APIs?

API stands for **Application Programming Interface.** It is a way for
two software components to communicate with each other and is an
accessible method to allow data transmission between multiple
applications. Think about it like this: when you order at a restaurant,
you tell the waiter what you want, and the waiter then relays this to
the kitchen which prepares your food, and finally the waiter brings your
food to you. In this case, your order is a request, the kitchen is the
back end service while the waiter is the API that acts as a
communication between yourself and the kitchen without exposing the
complexities of how the food is made. In the real world when you use an
application, the app connects to the internet and sends data to a
server. After the server retrieves the data, interprets it, and performs
any necessary actions, it is then presented in a readable format to the
client. APIs exist all around us: when you use the weather app, the
weather bureau’s software system contains the information about today’s
weather, but the app on your phone connects to this data via APIs in
order to show you information about the weather.

![Diagram](media/image15.png){:style="width:720px; display:inline-block;"}

### What is the purpose of APIs?

There are several key benefits of using an API for your project. APIs
can help you to retrieve up to date data and enable external developers
to (in a way) rely on a third party organization in order to add
functionality to existing solutions. APIs allow for access to many
online services for your project. The possibilities are endless because
they simply provide data and can be used by nearly any programming
language, allowing you to use the data in any way you see fit. APIs also
play a strong role in terms of security governance, limiting access to
any software that an application might not be allowed to use.

### What are the different types of APIs?

There are 3 types of APIs: **private, partner** and **public**.

Private APIs are designed to be used within an organization and thus are
limited to only developers within that organization. These types of APIs
have stronger security measures because it is for internal use and
enables the organization to have complete control over its design and
usage. It may be used to improve solutions or create a new system using
existing resources.

Partner APIs are used to be shared with specific external partners or
organizations. These APIs are given access to select business partners
to allow them to integrate their systems, exchange data, and collaborate
together. A few examples include:

> Facebook Login API: Third-party applications use this to enable user
> authentication with Facebook credentials.
>
> eBay APIs: eBay offers a number of APIs to users who join the eBay
> Developers Program, including Sell APIs, Buy APIs, Commerce APIs, and
> more.

Public APIs are made available to the general public. They are
accessible to any developer or user and have a broad usage from
individuals to entire organizations. They can be either free or
commercial. A few examples include:

> Google Maps API: Integrates Google Maps into their apps to provide
> access to mapping and location-based services.
>
> OpenAI API: Allows users to connect the GPT-4o API and the Whisper API
> with other apps.

### What is an API endpoint?

An endpoint is a component of an API where the API receives requests.
These include server URLs, services, and other digital locations from
where information is sent and received between two systems. Endpoints
are essential to APIs because they are the point where the client and
the server communicate. Let's see an example!

[<u>Spotify</u>](https://developer.spotify.com/documentation/web-api)
has an API that gives information about albums, playlists, songs, and
more. If you, for example, wanted to access a specific album, you can
gain access through Spotify’s catalog with the endpoint
https://api.spotify.com/v1/albums/{id}, where {id} is the album’s unique
identifier.

## LET’S GET STARTED!

Before anything, you will need to pick an API to use. There are
thousands of public APIs you can choose from, but a helpful place to
start might be to consult pages like [<u>Google’s API
Explorer</u>](https://developers.google.com/apis-explorer/) to find
which one best fits your needs. Some popular AI APIs include:

> OpenAI API: Offers access to powerful language models like GPT-4 for
> natural language tasks such as text generation, completion, and
> summarization.
>
> Google Cloud AI APIs: A suite of APIs for integrating vision,
> language, and conversation capabilities into applications.
>
> IBM Watson API: Provides a range of AI services, including NLP,
> sentiment analysis, and computer vision.

Next, locate the API documentation and understand how to interact with
that API. Usually, there will be a reference section that provides the
various objects, parameters, and endpoints you can access. Every API
should have a document that contains information such as how to use it,
what you can do with it, and some dependencies or requirements. Check
the authentication requirements and see if you need to obtain certain
credentials. From here, you can begin to dive into the API!

### Getting started with API requests in Python

Before you start coding, you need to first figure out what type of API
request you will need to be making. These request types, also known as
methods, have unique functions associated with each other. A few common
types include GET (to retrieve information), POST (to send new data),
and PUT (to update existing data). For the purpose of this guide, we
will focus on how to implement a GET request. In addition, you will also
need to obtain an API key. This is done by creating a verified account
with the API provider.

When making API requests, there are several libraries in Python that can
be used throughout the process. The most widely used library for making
requests in Python is the requests library. Since it is not a standard
library, you will first have to install it. Open up a coding platform of
your choice and install and import the library using pip:


![Pip Install](media/image16.png){:style="width:720px; height:47px; display:inline-block;"}
![Diagram](media/image17.png){:style="width:720px; height:48px; display:inline-block;"}


### YOU’VE INSTALLED THE LIBRARY! WHAT’S NEXT?

After importing our library, we can proceed with making the GET request
and analyzing the results. We will use the requests.get() function,
passing in the URL we want to request. The following code outlines how
to request and how to understand the API’s response:

![Code Block](media/image18.png){:style="width:720px; height:331px; display:inline-block;"}


After making the request, it is important to check the status code to
ensure that the request was successful. Ideally, 200 should be printed
to show that it was successful but if you see a code like 404, that
indicates that the server cannot find the requested file.

### WHAT HAPPENS IF I GET A DIFFERENT STATUS CODE?

Every status code indicates a different output that happened with the
request. Look at the following for a guide to see what your status code
means:

[<u>https://developer.mozilla.org/en-US/docs/Web/HTTP/Status</u>](https://developer.mozilla.org/en-US/docs/Web/HTTP/Status)

Run through these status codes and try to solve whatever issue is
popping up.

### I SUCCESSFULLY MADE THE REQUEST! WHAT NOW?

Most APIs return data in JSON format. You can use the response.json()
method to view the data that you just received.

![Print Statement](media/image19.png){:style="width:720px; height:48px; display:inline-block;"}

Sometimes you will need to send query parameters with your GET requests.
Query parameters are appended to the URL of an API request. These
parameters are used to modify and change the behavior of the request in
order to customize the response. To do this, you will need to use query
parameter syntax, which requires a question mark followed by the query
parameters you want to add. Multiple parameters are separated by an
ampersand.


### Should I implement query parameters?

There are many scenarios in which implementing a query parameter might
be useful. Some common uses include filtering data, sorting data,
limiting the number of results returned in a single request, querying a
dataset for a specific term, or customizing the format. Think of this
like ordering a burger: if we are given a standard burger with lettuce,
tomatoes, onions, and cheese, we might only want to choose the lettuce
and cheese. These specifications are much like optional query
parameters, allowing us to specify or filter the data from an API as we
need.

### How should I implement a query parameter?

You can send query parameters using the ‘params’ argument as a
dictionary to filter out the data you receive. Let’s see a basic setup
of how to do this below:

![Code](media/image21.png){:style="width:720px; height:217px; display:inline-block;"}


In the real world, this is what the code might look like if you wanted
to get weather data for the city of London:

![Code](media/image22.png){:style="width:490px; height:140px; display:inline-block;"}


Query parameters allow for more dynamic requests by enabling clients to
specify optional filters or settings without changing the endpoint
structure. In contrast, <u>path parameters</u> are another option which
would request weather information in this general format:

GET/weather/London. Path parameters are best used for identifying
specific collections in an API URL whereas query parameters allow for
multiple filterings.

### NOW WHAT?

In most cases, if you need to send data to an API you should now
implement a POST request. A POST request is one of the most common
methods used in APIs, and is primarily used to send complex data (such
as JSON, form data, or files) to a server to create or update a
resource. To do this, you will need to use requests.post(). Let’s see
how to do this below:

![Code](media/image23.png){:style="width:629px; height:350px; display:inline-block;"}


Here, we used json.dumps to convert the task\_data dictionary into a
JSON-formatted string then send the request with requests.post().
Similar to our GET request above, we also need to test if this request
was done successfully through looking at its status code. In this
example, a status code of 201 indicates that we are successful.

As you become more familiar with the APIs, refine your requests and add
more complexities to better meet your needs. This might involve using
additional parameters, handling pagination, or optimizing performance.
Follow an iterate and improve method to keep track of your code and
leverage more of your APIs capabilities.

---

## HOW TO CONTINUE THIS MAIN QUEST?  

Take the quiz [<u>here</u>](https://docs.google.com/forms/d/e/1FAIpQLSdrirR6caWeNXtfILYCv-RtfpRrp0GmiUAOyNb5Kp-yeGmjiw/viewform?usp=sf_link) to finalize level one, then apply your knowledge by doing a API Side Quest!  

After completing that, you can create your own project with some guidelines for level three!

---

### For any information or quality issues, please contact:  

Kaylin Von Bergen - [<u>kaylinvb@bu.edu</u>](mailto:kaylinvb@bu.edu)  

---

### Author of this Code Quest:  
Catherine - [<u>cliu26@bu.edu</u>](mailto:cliu26@bu.edu)
