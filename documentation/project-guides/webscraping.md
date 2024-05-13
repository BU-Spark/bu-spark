---
layout: default
title: Web Scraping
parent: Data Science Project Documentation Guidelines
nav_order: 10
---

# Introduction to Web Scraping

## What is web scraping?

Web scraping is the automated process of extracting data from websites. It's a technique that is widely used for gathering data, allowing programmers to extract structured data from the web directly when an API either doesn't exist or is too restrictive.

At a high level, the steps for any web scraping project goes something like:
1. Fetch the page
2. Parse the HTML
3. Extract the info needed


![Image](webscraping_pngs/webscraping.png)



## Legal and Ethical Considerations

It's important to consider both legal and ethical implications before writing any code. If you’re scraping a page respectfully for educational purposes, then you’re unlikely to have any problems. Still, it’s a good idea to do some research on your own and make sure that you’re not violating any Terms of Services before you start a large-scale project.

Check out this [article](https://towardsdatascience.com/ethics-in-web-scraping-b96b18136f01) about the ethics of web scraping. To summarize, you should always 

- Be transparent about scraping intentions
- Respect site load by scraping at reasonable rates
- Store only necessary data.
- Credit original sources and respect their content.



## Use Cases and Applications

When you try to get the information you want manually, you might spend a lot of time clicking, scrolling, and searching, especially if you need large amounts of data from websites that are regularly updated with new content. Manual web scraping can take a lot of time and repetition, and doesn't sound like the most fun or productive way to spend your time.

For example, if you're doing a project that relies on product/price information from an ecommerce website, it'd be much easier to write some code to collect the data for you rather than clicking into each product, and copy pasting data manually. A few other suitable applications of web scraping include automatically collecting:

- Offers, discounts, limited-time deals
- Job postings and internships
- Phone numbers/emails for sales and marketing campaigns

![Image](webscraping_pngs/applications.png)


## Overview of Tools and Libraries for Web Scraping in Python

Python offers several libraries that help for web scraping, the most popular being `requests` and `BeautifulSoup`. The requests library allows users to easily send HTTP requests to websites, while BeautifulSoup is used for parsing HTML and XML documents. Together, these tools enable developers to automate data collection and process web content efficiently. 

It's important to note that BeautifulSoup is excellent for static content, but not that great when it comes to dynamic webpages that rely heavily on JavaScript for rendering their content. In these cases, `Selenium` is a better solution. Selenium is a web automation tool primarily used for testing web applications, but it's also highly effective for web scraping purposes. Unlike BeautifulSoup, Selenium can interact with web pages just like a human user would, navigating through pages, clicking on buttons, and even filling out forms. This capability allows it to execute JavaScript and scrape data from websites that update their content dynamically.


# BeautifulSoup

Here's the website we'll use in this part of the guide: https://realpython.github.io/fake-jobs/

It's a static page designed for educational purposes, allowing learners to practice their web scraping skills without the ethical and legal complexities that come with scraping real-world websites.

Start off by scrolling and clicking through the website to get yourself familiarized with it. There are lots of fake job postings in a card format, and each of them has two buttons. If you click Apply, then you’ll see a new page that contains more detailed descriptions of the selected job.

Next, inspect the website with your browser's developer tools (right click anywhere, and click "Inspect"). This little window will be your best friend when web scraping as it provides a detailed view of the HTML structure of the webpage. You can identify the specific tags, classes, and ids associated with the data you wish to extract.

Let's get to writing some code! Make sure you have the `bs4` and `requests` packages.


```python
# !pip install bs4 requests
```


```python
import requests

# Send a GET request to the URL, returns the raw HTML
site = requests.get('https://realpython.github.io/fake-jobs/')

print(site.text)
```

    <!DOCTYPE html>
    <html>
      <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Fake Python</title>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bulma@0.9.2/css/bulma.min.css">
      </head>
      <body>
      <section class="section">
        <div class="container mb-5">
          <h1 class="title is-1">
            Fake Python
          </h1>
          <p class="subtitle is-3">
            Fake Jobs for Your Web Scraping Journey
          </p>
        </div>
        <div class="container">
        <div id="ResultsContainer" class="columns is-multiline">
        <div class="column is-half">
    <div class="card">
      <div class="card-content">
        <div class="media">
          <div class="media-left">
            <figure class="image is-48x48">
              <img src="https://files.realpython.com/media/real-python-logo-thumbnail.7f0db70c2ed2.jpg?__no_cf_polish=1" alt="Real Python Logo">
            </figure>
          </div>
          <div class="media-content">
            <h2 class="title is-5">Senior Python Developer</h2>
            <h3 class="subtitle is-6 company">Payne, Roberts and Davis</h3>
          </div>
        </div>
    
        <div class="content">
          <p class="location">
            Stewartbury, AA
          </p>
          <p class="is-small has-text-grey">
            <time datetime="2021-04-08">2021-04-08</time>
          </p>
        </div>
        <footer class="card-footer">
            <a href="https://www.realpython.com" target="_blank" class="card-footer-item">Learn</a>
            <a href="https://realpython.github.io/fake-jobs/jobs/senior-python-developer-0.html" target="_blank" class="card-footer-item">Apply</a>
        </footer>
      </div>
    </div>
    </div>
    <div class="column is-half">
    <div class="card">
      <div class="card-content">
        <div class="media">
          <div class="media-left">
            <figure class="image is-48x48">
              <img src="https://files.realpython.com/media/real-python-logo-thumbnail.7f0db70c2ed2.jpg?__no_cf_polish=1" alt="Real Python Logo">
            </figure>
          </div>
          <div class="media-content">
            <h2 class="title is-5">Energy engineer</h2>
            <h3 class="subtitle is-6 company">Vasquez-Davidson</h3>
          </div>
        </div>
    
        <div class="content">
          <p class="location">
            Christopherville, AA
          </p>
          <p class="is-small has-text-grey">
            <time datetime="2021-04-08">2021-04-08</time>
          </p>
        </div>
        <footer class="card-footer">
            <a href="https://www.realpython.com" target="_blank" class="card-footer-item">Learn</a>
            <a href="https://realpython.github.io/fake-jobs/jobs/energy-engineer-1.html" target="_blank" class="card-footer-item">Apply</a>
        </footer>
      </div>
    </div>
    </div>
    <div class="column is-half">
    <div class="card">
      <div class="card-content">
        <div class="media">
          <div class="media-left">
            <figure class="image is-48x48">
              <img src="https://files.realpython.com/media/real-python-logo-thumbnail.7f0db70c2ed2.jpg?__no_cf_polish=1" alt="Real Python Logo">
            </figure>
          </div>
          <div class="media-content">
            <h2 class="title is-5">Legal executive</h2>
            <h3 class="subtitle is-6 company">Jackson, Chambers and Levy</h3>
          </div>
        </div>
    
        <div class="content">
          <p class="location">
            Port Ericaburgh, AA
          </p>
          <p class="is-small has-text-grey">
            <time datetime="2021-04-08">2021-04-08</time>
          </p>
        </div>
        <footer class="card-footer">
            <a href="https://www.realpython.com" target="_blank" class="card-footer-item">Learn</a>
            <a href="https://realpython.github.io/fake-jobs/jobs/legal-executive-2.html" target="_blank" class="card-footer-item">Apply</a>
        </footer>
      </div>
    </div>
    </div>
    <div class="column is-half">
    <div class="card">
      <div class="card-content">
        <div class="media">
          <div class="media-left">
            <figure class="image is-48x48">
              <img src="https://files.realpython.com/media/real-python-logo-thumbnail.7f0db70c2ed2.jpg?__no_cf_polish=1" alt="Real Python Logo">
            </figure>
          </div>
          <div class="media-content">
            <h2 class="title is-5">Fitness centre manager</h2>
            <h3 class="subtitle is-6 company">Savage-Bradley</h3>
          </div>
        </div>
    
        <div class="content">
          <p class="location">
            East Seanview, AP
          </p>
          <p class="is-small has-text-grey">
            <time datetime="2021-04-08">2021-04-08</time>
          </p>
        </div>
        <footer class="card-footer">
            <a href="https://www.realpython.com" target="_blank" class="card-footer-item">Learn</a>
            <a href="https://realpython.github.io/fake-jobs/jobs/fitness-centre-manager-3.html" target="_blank" class="card-footer-item">Apply</a>
        </footer>
      </div>
    </div>
    </div>
    <div class="column is-half">
    <div class="card">
      <div class="card-content">
        <div class="media">
          <div class="media-left">
            <figure class="image is-48x48">
              <img src="https://files.realpython.com/media/real-python-logo-thumbnail.7f0db70c2ed2.jpg?__no_cf_polish=1" alt="Real Python Logo">
            </figure>
          </div>
          <div class="media-content">
            <h2 class="title is-5">Product manager</h2>
            <h3 class="subtitle is-6 company">Ramirez Inc</h3>
          </div>
        </div>
    
        <div class="content">
          <p class="location">
            North Jamieview, AP
          </p>
          <p class="is-small has-text-grey">
            <time datetime="2021-04-08">2021-04-08</time>
          </p>
        </div>
        <footer class="card-footer">
            <a href="https://www.realpython.com" target="_blank" class="card-footer-item">Learn</a>
            <a href="https://realpython.github.io/fake-jobs/jobs/product-manager-4.html" target="_blank" class="card-footer-item">Apply</a>
        </footer>
      </div>
    </div>
    </div>
    <div class="column is-half">
    <div class="card">
      <div class="card-content">
        <div class="media">
          <div class="media-left">
            <figure class="image is-48x48">
              <img src="https://files.realpython.com/media/real-python-logo-thumbnail.7f0db70c2ed2.jpg?__no_cf_polish=1" alt="Real Python Logo">
            </figure>
          </div>
          <div class="media-content">
            <h2 class="title is-5">Medical technical officer</h2>
            <h3 class="subtitle is-6 company">Rogers-Yates</h3>
          </div>
        </div>
    
        <div class="content">
          <p class="location">
            Davidville, AP
          </p>
          <p class="is-small has-text-grey">
            <time datetime="2021-04-08">2021-04-08</time>
          </p>
        </div>
        <footer class="card-footer">
            <a href="https://www.realpython.com" target="_blank" class="card-footer-item">Learn</a>
            <a href="https://realpython.github.io/fake-jobs/jobs/medical-technical-officer-5.html" target="_blank" class="card-footer-item">Apply</a>
        </footer>
      </div>
    </div>
    </div>
    <div class="column is-half">
    <div class="card">
      <div class="card-content">
        <div class="media">
          <div class="media-left">
            <figure class="image is-48x48">
              <img src="https://files.realpython.com/media/real-python-logo-thumbnail.7f0db70c2ed2.jpg?__no_cf_polish=1" alt="Real Python Logo">
            </figure>
          </div>
          <div class="media-content">
            <h2 class="title is-5">Physiological scientist</h2>
            <h3 class="subtitle is-6 company">Kramer-Klein</h3>
          </div>
        </div>
    
        <div class="content">
          <p class="location">
            South Christopher, AE
          </p>
          <p class="is-small has-text-grey">
            <time datetime="2021-04-08">2021-04-08</time>
          </p>
        </div>
        <footer class="card-footer">
            <a href="https://www.realpython.com" target="_blank" class="card-footer-item">Learn</a>
            <a href="https://realpython.github.io/fake-jobs/jobs/physiological-scientist-6.html" target="_blank" class="card-footer-item">Apply</a>
        </footer>
      </div>
    </div>
    </div>
    <div class="column is-half">
    <div class="card">
      <div class="card-content">
        <div class="media">
          <div class="media-left">
            <figure class="image is-48x48">
              <img src="https://files.realpython.com/media/real-python-logo-thumbnail.7f0db70c2ed2.jpg?__no_cf_polish=1" alt="Real Python Logo">
            </figure>
          </div>
          <div class="media-content">
            <h2 class="title is-5">Textile designer</h2>
            <h3 class="subtitle is-6 company">Meyers-Johnson</h3>
          </div>
        </div>
    
        <div class="content">
          <p class="location">
            Port Jonathan, AE
          </p>
          <p class="is-small has-text-grey">
            <time datetime="2021-04-08">2021-04-08</time>
          </p>
        </div>
        <footer class="card-footer">
            <a href="https://www.realpython.com" target="_blank" class="card-footer-item">Learn</a>
            <a href="https://realpython.github.io/fake-jobs/jobs/textile-designer-7.html" target="_blank" class="card-footer-item">Apply</a>
        </footer>
      </div>
    </div>
    </div>
    <div class="column is-half">
    <div class="card">
      <div class="card-content">
        <div class="media">
          <div class="media-left">
            <figure class="image is-48x48">
              <img src="https://files.realpython.com/media/real-python-logo-thumbnail.7f0db70c2ed2.jpg?__no_cf_polish=1" alt="Real Python Logo">
            </figure>
          </div>
          <div class="media-content">
            <h2 class="title is-5">Television floor manager</h2>
            <h3 class="subtitle is-6 company">Hughes-Williams</h3>
          </div>
        </div>
    
        <div class="content">
          <p class="location">
            Osbornetown, AE
          </p>
          <p class="is-small has-text-grey">
            <time datetime="2021-04-08">2021-04-08</time>
          </p>
        </div>
        <footer class="card-footer">
            <a href="https://www.realpython.com" target="_blank" class="card-footer-item">Learn</a>
            <a href="https://realpython.github.io/fake-jobs/jobs/television-floor-manager-8.html" target="_blank" class="card-footer-item">Apply</a>
        </footer>
      </div>
    </div>
    </div>
    <div class="column is-half">
    <div class="card">
      <div class="card-content">
        <div class="media">
          <div class="media-left">
            <figure class="image is-48x48">
              <img src="https://files.realpython.com/media/real-python-logo-thumbnail.7f0db70c2ed2.jpg?__no_cf_polish=1" alt="Real Python Logo">
            </figure>
          </div>
          <div class="media-content">
            <h2 class="title is-5">Waste management officer</h2>
            <h3 class="subtitle is-6 company">Jones, Williams and Villa</h3>
          </div>
        </div>
    
        <div class="content">
          <p class="location">
            Scotttown, AP
          </p>
          <p class="is-small has-text-grey">
            <time datetime="2021-04-08">2021-04-08</time>
          </p>
        </div>
        <footer class="card-footer">
            <a href="https://www.realpython.com" target="_blank" class="card-footer-item">Learn</a>
            <a href="https://realpython.github.io/fake-jobs/jobs/waste-management-officer-9.html" target="_blank" class="card-footer-item">Apply</a>
        </footer>
      </div>
    </div>
    </div>
    <div class="column is-half">
    <div class="card">
      <div class="card-content">
        <div class="media">
          <div class="media-left">
            <figure class="image is-48x48">
              <img src="https://files.realpython.com/media/real-python-logo-thumbnail.7f0db70c2ed2.jpg?__no_cf_polish=1" alt="Real Python Logo">
            </figure>
          </div>
          <div class="media-content">
            <h2 class="title is-5">Software Engineer (Python)</h2>
            <h3 class="subtitle is-6 company">Garcia PLC</h3>
          </div>
        </div>
    
        <div class="content">
          <p class="location">
            Ericberg, AE
          </p>
          <p class="is-small has-text-grey">
            <time datetime="2021-04-08">2021-04-08</time>
          </p>
        </div>
        <footer class="card-footer">
            <a href="https://www.realpython.com" target="_blank" class="card-footer-item">Learn</a>
            <a href="https://realpython.github.io/fake-jobs/jobs/software-engineer-python-10.html" target="_blank" class="card-footer-item">Apply</a>
        </footer>
      </div>
    </div>
    </div>
    <div class="column is-half">
    <div class="card">
      <div class="card-content">
        <div class="media">
          <div class="media-left">
            <figure class="image is-48x48">
              <img src="https://files.realpython.com/media/real-python-logo-thumbnail.7f0db70c2ed2.jpg?__no_cf_polish=1" alt="Real Python Logo">
            </figure>
          </div>
          <div class="media-content">
            <h2 class="title is-5">Interpreter</h2>
            <h3 class="subtitle is-6 company">Gregory and Sons</h3>
          </div>
        </div>
    
        <div class="content">
          <p class="location">
            Ramireztown, AE
          </p>
          <p class="is-small has-text-grey">
            <time datetime="2021-04-08">2021-04-08</time>
          </p>
        </div>
        <footer class="card-footer">
            <a href="https://www.realpython.com" target="_blank" class="card-footer-item">Learn</a>
            <a href="https://realpython.github.io/fake-jobs/jobs/interpreter-11.html" target="_blank" class="card-footer-item">Apply</a>
        </footer>
      </div>
    </div>
    </div>
    <div class="column is-half">
    <div class="card">
      <div class="card-content">
        <div class="media">
          <div class="media-left">
            <figure class="image is-48x48">
              <img src="https://files.realpython.com/media/real-python-logo-thumbnail.7f0db70c2ed2.jpg?__no_cf_polish=1" alt="Real Python Logo">
            </figure>
          </div>
          <div class="media-content">
            <h2 class="title is-5">Architect</h2>
            <h3 class="subtitle is-6 company">Clark, Garcia and Sosa</h3>
          </div>
        </div>
    
        <div class="content">
          <p class="location">
            Figueroaview, AA
          </p>
          <p class="is-small has-text-grey">
            <time datetime="2021-04-08">2021-04-08</time>
          </p>
        </div>
        <footer class="card-footer">
            <a href="https://www.realpython.com" target="_blank" class="card-footer-item">Learn</a>
            <a href="https://realpython.github.io/fake-jobs/jobs/architect-12.html" target="_blank" class="card-footer-item">Apply</a>
        </footer>
      </div>
    </div>
    </div>
    <div class="column is-half">
    <div class="card">
      <div class="card-content">
        <div class="media">
          <div class="media-left">
            <figure class="image is-48x48">
              <img src="https://files.realpython.com/media/real-python-logo-thumbnail.7f0db70c2ed2.jpg?__no_cf_polish=1" alt="Real Python Logo">
            </figure>
          </div>
          <div class="media-content">
            <h2 class="title is-5">Meteorologist</h2>
            <h3 class="subtitle is-6 company">Bush PLC</h3>
          </div>
        </div>
    
        <div class="content">
          <p class="location">
            Kelseystad, AA
          </p>
          <p class="is-small has-text-grey">
            <time datetime="2021-04-08">2021-04-08</time>
          </p>
        </div>
        <footer class="card-footer">
            <a href="https://www.realpython.com" target="_blank" class="card-footer-item">Learn</a>
            <a href="https://realpython.github.io/fake-jobs/jobs/meteorologist-13.html" target="_blank" class="card-footer-item">Apply</a>
        </footer>
      </div>
    </div>
    </div>
    <div class="column is-half">
    <div class="card">
      <div class="card-content">
        <div class="media">
          <div class="media-left">
            <figure class="image is-48x48">
              <img src="https://files.realpython.com/media/real-python-logo-thumbnail.7f0db70c2ed2.jpg?__no_cf_polish=1" alt="Real Python Logo">
            </figure>
          </div>
          <div class="media-content">
            <h2 class="title is-5">Audiological scientist</h2>
            <h3 class="subtitle is-6 company">Salazar-Meyers</h3>
          </div>
        </div>
    
        <div class="content">
          <p class="location">
            Williamsburgh, AE
          </p>
          <p class="is-small has-text-grey">
            <time datetime="2021-04-08">2021-04-08</time>
          </p>
        </div>
        <footer class="card-footer">
            <a href="https://www.realpython.com" target="_blank" class="card-footer-item">Learn</a>
            <a href="https://realpython.github.io/fake-jobs/jobs/audiological-scientist-14.html" target="_blank" class="card-footer-item">Apply</a>
        </footer>
      </div>
    </div>
    </div>
    <div class="column is-half">
    <div class="card">
      <div class="card-content">
        <div class="media">
          <div class="media-left">
            <figure class="image is-48x48">
              <img src="https://files.realpython.com/media/real-python-logo-thumbnail.7f0db70c2ed2.jpg?__no_cf_polish=1" alt="Real Python Logo">
            </figure>
          </div>
          <div class="media-content">
            <h2 class="title is-5">English as a second language teacher</h2>
            <h3 class="subtitle is-6 company">Parker, Murphy and Brooks</h3>
          </div>
        </div>
    
        <div class="content">
          <p class="location">
            Mitchellburgh, AE
          </p>
          <p class="is-small has-text-grey">
            <time datetime="2021-04-08">2021-04-08</time>
          </p>
        </div>
        <footer class="card-footer">
            <a href="https://www.realpython.com" target="_blank" class="card-footer-item">Learn</a>
            <a href="https://realpython.github.io/fake-jobs/jobs/english-as-a-second-language-teacher-15.html" target="_blank" class="card-footer-item">Apply</a>
        </footer>
      </div>
    </div>
    </div>
    <div class="column is-half">
    <div class="card">
      <div class="card-content">
        <div class="media">
          <div class="media-left">
            <figure class="image is-48x48">
              <img src="https://files.realpython.com/media/real-python-logo-thumbnail.7f0db70c2ed2.jpg?__no_cf_polish=1" alt="Real Python Logo">
            </figure>
          </div>
          <div class="media-content">
            <h2 class="title is-5">Surgeon</h2>
            <h3 class="subtitle is-6 company">Cruz-Brown</h3>
          </div>
        </div>
    
        <div class="content">
          <p class="location">
            West Jessicabury, AA
          </p>
          <p class="is-small has-text-grey">
            <time datetime="2021-04-08">2021-04-08</time>
          </p>
        </div>
        <footer class="card-footer">
            <a href="https://www.realpython.com" target="_blank" class="card-footer-item">Learn</a>
            <a href="https://realpython.github.io/fake-jobs/jobs/surgeon-16.html" target="_blank" class="card-footer-item">Apply</a>
        </footer>
      </div>
    </div>
    </div>
    <div class="column is-half">
    <div class="card">
      <div class="card-content">
        <div class="media">
          <div class="media-left">
            <figure class="image is-48x48">
              <img src="https://files.realpython.com/media/real-python-logo-thumbnail.7f0db70c2ed2.jpg?__no_cf_polish=1" alt="Real Python Logo">
            </figure>
          </div>
          <div class="media-content">
            <h2 class="title is-5">Equities trader</h2>
            <h3 class="subtitle is-6 company">Macdonald-Ferguson</h3>
          </div>
        </div>
    
        <div class="content">
          <p class="location">
            Maloneshire, AE
          </p>
          <p class="is-small has-text-grey">
            <time datetime="2021-04-08">2021-04-08</time>
          </p>
        </div>
        <footer class="card-footer">
            <a href="https://www.realpython.com" target="_blank" class="card-footer-item">Learn</a>
            <a href="https://realpython.github.io/fake-jobs/jobs/equities-trader-17.html" target="_blank" class="card-footer-item">Apply</a>
        </footer>
      </div>
    </div>
    </div>
    <div class="column is-half">
    <div class="card">
      <div class="card-content">
        <div class="media">
          <div class="media-left">
            <figure class="image is-48x48">
              <img src="https://files.realpython.com/media/real-python-logo-thumbnail.7f0db70c2ed2.jpg?__no_cf_polish=1" alt="Real Python Logo">
            </figure>
          </div>
          <div class="media-content">
            <h2 class="title is-5">Newspaper journalist</h2>
            <h3 class="subtitle is-6 company">Williams, Peterson and Rojas</h3>
          </div>
        </div>
    
        <div class="content">
          <p class="location">
            Johnsonton, AA
          </p>
          <p class="is-small has-text-grey">
            <time datetime="2021-04-08">2021-04-08</time>
          </p>
        </div>
        <footer class="card-footer">
            <a href="https://www.realpython.com" target="_blank" class="card-footer-item">Learn</a>
            <a href="https://realpython.github.io/fake-jobs/jobs/newspaper-journalist-18.html" target="_blank" class="card-footer-item">Apply</a>
        </footer>
      </div>
    </div>
    </div>
    <div class="column is-half">
    <div class="card">
      <div class="card-content">
        <div class="media">
          <div class="media-left">
            <figure class="image is-48x48">
              <img src="https://files.realpython.com/media/real-python-logo-thumbnail.7f0db70c2ed2.jpg?__no_cf_polish=1" alt="Real Python Logo">
            </figure>
          </div>
          <div class="media-content">
            <h2 class="title is-5">Materials engineer</h2>
            <h3 class="subtitle is-6 company">Smith and Sons</h3>
          </div>
        </div>
    
        <div class="content">
          <p class="location">
            South Davidtown, AP
          </p>
          <p class="is-small has-text-grey">
            <time datetime="2021-04-08">2021-04-08</time>
          </p>
        </div>
        <footer class="card-footer">
            <a href="https://www.realpython.com" target="_blank" class="card-footer-item">Learn</a>
            <a href="https://realpython.github.io/fake-jobs/jobs/materials-engineer-19.html" target="_blank" class="card-footer-item">Apply</a>
        </footer>
      </div>
    </div>
    </div>
    <div class="column is-half">
    <div class="card">
      <div class="card-content">
        <div class="media">
          <div class="media-left">
            <figure class="image is-48x48">
              <img src="https://files.realpython.com/media/real-python-logo-thumbnail.7f0db70c2ed2.jpg?__no_cf_polish=1" alt="Real Python Logo">
            </figure>
          </div>
          <div class="media-content">
            <h2 class="title is-5">Python Programmer (Entry-Level)</h2>
            <h3 class="subtitle is-6 company">Moss, Duncan and Allen</h3>
          </div>
        </div>
    
        <div class="content">
          <p class="location">
            Port Sara, AE
          </p>
          <p class="is-small has-text-grey">
            <time datetime="2021-04-08">2021-04-08</time>
          </p>
        </div>
        <footer class="card-footer">
            <a href="https://www.realpython.com" target="_blank" class="card-footer-item">Learn</a>
            <a href="https://realpython.github.io/fake-jobs/jobs/python-programmer-entry-level-20.html" target="_blank" class="card-footer-item">Apply</a>
        </footer>
      </div>
    </div>
    </div>
    <div class="column is-half">
    <div class="card">
      <div class="card-content">
        <div class="media">
          <div class="media-left">
            <figure class="image is-48x48">
              <img src="https://files.realpython.com/media/real-python-logo-thumbnail.7f0db70c2ed2.jpg?__no_cf_polish=1" alt="Real Python Logo">
            </figure>
          </div>
          <div class="media-content">
            <h2 class="title is-5">Product/process development scientist</h2>
            <h3 class="subtitle is-6 company">Gomez-Carroll</h3>
          </div>
        </div>
    
        <div class="content">
          <p class="location">
            Marktown, AA
          </p>
          <p class="is-small has-text-grey">
            <time datetime="2021-04-08">2021-04-08</time>
          </p>
        </div>
        <footer class="card-footer">
            <a href="https://www.realpython.com" target="_blank" class="card-footer-item">Learn</a>
            <a href="https://realpython.github.io/fake-jobs/jobs/product-process-development-scientist-21.html" target="_blank" class="card-footer-item">Apply</a>
        </footer>
      </div>
    </div>
    </div>
    <div class="column is-half">
    <div class="card">
      <div class="card-content">
        <div class="media">
          <div class="media-left">
            <figure class="image is-48x48">
              <img src="https://files.realpython.com/media/real-python-logo-thumbnail.7f0db70c2ed2.jpg?__no_cf_polish=1" alt="Real Python Logo">
            </figure>
          </div>
          <div class="media-content">
            <h2 class="title is-5">Scientist, research (maths)</h2>
            <h3 class="subtitle is-6 company">Manning, Welch and Herring</h3>
          </div>
        </div>
    
        <div class="content">
          <p class="location">
            Laurenland, AE
          </p>
          <p class="is-small has-text-grey">
            <time datetime="2021-04-08">2021-04-08</time>
          </p>
        </div>
        <footer class="card-footer">
            <a href="https://www.realpython.com" target="_blank" class="card-footer-item">Learn</a>
            <a href="https://realpython.github.io/fake-jobs/jobs/scientist-research-maths-22.html" target="_blank" class="card-footer-item">Apply</a>
        </footer>
      </div>
    </div>
    </div>
    <div class="column is-half">
    <div class="card">
      <div class="card-content">
        <div class="media">
          <div class="media-left">
            <figure class="image is-48x48">
              <img src="https://files.realpython.com/media/real-python-logo-thumbnail.7f0db70c2ed2.jpg?__no_cf_polish=1" alt="Real Python Logo">
            </figure>
          </div>
          <div class="media-content">
            <h2 class="title is-5">Ecologist</h2>
            <h3 class="subtitle is-6 company">Lee, Gutierrez and Brown</h3>
          </div>
        </div>
    
        <div class="content">
          <p class="location">
            Lauraton, AP
          </p>
          <p class="is-small has-text-grey">
            <time datetime="2021-04-08">2021-04-08</time>
          </p>
        </div>
        <footer class="card-footer">
            <a href="https://www.realpython.com" target="_blank" class="card-footer-item">Learn</a>
            <a href="https://realpython.github.io/fake-jobs/jobs/ecologist-23.html" target="_blank" class="card-footer-item">Apply</a>
        </footer>
      </div>
    </div>
    </div>
    <div class="column is-half">
    <div class="card">
      <div class="card-content">
        <div class="media">
          <div class="media-left">
            <figure class="image is-48x48">
              <img src="https://files.realpython.com/media/real-python-logo-thumbnail.7f0db70c2ed2.jpg?__no_cf_polish=1" alt="Real Python Logo">
            </figure>
          </div>
          <div class="media-content">
            <h2 class="title is-5">Materials engineer</h2>
            <h3 class="subtitle is-6 company">Davis, Serrano and Cook</h3>
          </div>
        </div>
    
        <div class="content">
          <p class="location">
            South Tammyberg, AP
          </p>
          <p class="is-small has-text-grey">
            <time datetime="2021-04-08">2021-04-08</time>
          </p>
        </div>
        <footer class="card-footer">
            <a href="https://www.realpython.com" target="_blank" class="card-footer-item">Learn</a>
            <a href="https://realpython.github.io/fake-jobs/jobs/materials-engineer-24.html" target="_blank" class="card-footer-item">Apply</a>
        </footer>
      </div>
    </div>
    </div>
    <div class="column is-half">
    <div class="card">
      <div class="card-content">
        <div class="media">
          <div class="media-left">
            <figure class="image is-48x48">
              <img src="https://files.realpython.com/media/real-python-logo-thumbnail.7f0db70c2ed2.jpg?__no_cf_polish=1" alt="Real Python Logo">
            </figure>
          </div>
          <div class="media-content">
            <h2 class="title is-5">Historic buildings inspector/conservation officer</h2>
            <h3 class="subtitle is-6 company">Smith LLC</h3>
          </div>
        </div>
    
        <div class="content">
          <p class="location">
            North Brandonville, AP
          </p>
          <p class="is-small has-text-grey">
            <time datetime="2021-04-08">2021-04-08</time>
          </p>
        </div>
        <footer class="card-footer">
            <a href="https://www.realpython.com" target="_blank" class="card-footer-item">Learn</a>
            <a href="https://realpython.github.io/fake-jobs/jobs/historic-buildings-inspector-conservation-officer-25.html" target="_blank" class="card-footer-item">Apply</a>
        </footer>
      </div>
    </div>
    </div>
    <div class="column is-half">
    <div class="card">
      <div class="card-content">
        <div class="media">
          <div class="media-left">
            <figure class="image is-48x48">
              <img src="https://files.realpython.com/media/real-python-logo-thumbnail.7f0db70c2ed2.jpg?__no_cf_polish=1" alt="Real Python Logo">
            </figure>
          </div>
          <div class="media-content">
            <h2 class="title is-5">Data scientist</h2>
            <h3 class="subtitle is-6 company">Thomas Group</h3>
          </div>
        </div>
    
        <div class="content">
          <p class="location">
            Port Robertfurt, AA
          </p>
          <p class="is-small has-text-grey">
            <time datetime="2021-04-08">2021-04-08</time>
          </p>
        </div>
        <footer class="card-footer">
            <a href="https://www.realpython.com" target="_blank" class="card-footer-item">Learn</a>
            <a href="https://realpython.github.io/fake-jobs/jobs/data-scientist-26.html" target="_blank" class="card-footer-item">Apply</a>
        </footer>
      </div>
    </div>
    </div>
    <div class="column is-half">
    <div class="card">
      <div class="card-content">
        <div class="media">
          <div class="media-left">
            <figure class="image is-48x48">
              <img src="https://files.realpython.com/media/real-python-logo-thumbnail.7f0db70c2ed2.jpg?__no_cf_polish=1" alt="Real Python Logo">
            </figure>
          </div>
          <div class="media-content">
            <h2 class="title is-5">Psychiatrist</h2>
            <h3 class="subtitle is-6 company">Silva-King</h3>
          </div>
        </div>
    
        <div class="content">
          <p class="location">
            Burnettbury, AE
          </p>
          <p class="is-small has-text-grey">
            <time datetime="2021-04-08">2021-04-08</time>
          </p>
        </div>
        <footer class="card-footer">
            <a href="https://www.realpython.com" target="_blank" class="card-footer-item">Learn</a>
            <a href="https://realpython.github.io/fake-jobs/jobs/psychiatrist-27.html" target="_blank" class="card-footer-item">Apply</a>
        </footer>
      </div>
    </div>
    </div>
    <div class="column is-half">
    <div class="card">
      <div class="card-content">
        <div class="media">
          <div class="media-left">
            <figure class="image is-48x48">
              <img src="https://files.realpython.com/media/real-python-logo-thumbnail.7f0db70c2ed2.jpg?__no_cf_polish=1" alt="Real Python Logo">
            </figure>
          </div>
          <div class="media-content">
            <h2 class="title is-5">Structural engineer</h2>
            <h3 class="subtitle is-6 company">Pierce-Long</h3>
          </div>
        </div>
    
        <div class="content">
          <p class="location">
            Herbertside, AA
          </p>
          <p class="is-small has-text-grey">
            <time datetime="2021-04-08">2021-04-08</time>
          </p>
        </div>
        <footer class="card-footer">
            <a href="https://www.realpython.com" target="_blank" class="card-footer-item">Learn</a>
            <a href="https://realpython.github.io/fake-jobs/jobs/structural-engineer-28.html" target="_blank" class="card-footer-item">Apply</a>
        </footer>
      </div>
    </div>
    </div>
    <div class="column is-half">
    <div class="card">
      <div class="card-content">
        <div class="media">
          <div class="media-left">
            <figure class="image is-48x48">
              <img src="https://files.realpython.com/media/real-python-logo-thumbnail.7f0db70c2ed2.jpg?__no_cf_polish=1" alt="Real Python Logo">
            </figure>
          </div>
          <div class="media-content">
            <h2 class="title is-5">Immigration officer</h2>
            <h3 class="subtitle is-6 company">Walker-Simpson</h3>
          </div>
        </div>
    
        <div class="content">
          <p class="location">
            Christopherport, AP
          </p>
          <p class="is-small has-text-grey">
            <time datetime="2021-04-08">2021-04-08</time>
          </p>
        </div>
        <footer class="card-footer">
            <a href="https://www.realpython.com" target="_blank" class="card-footer-item">Learn</a>
            <a href="https://realpython.github.io/fake-jobs/jobs/immigration-officer-29.html" target="_blank" class="card-footer-item">Apply</a>
        </footer>
      </div>
    </div>
    </div>
    <div class="column is-half">
    <div class="card">
      <div class="card-content">
        <div class="media">
          <div class="media-left">
            <figure class="image is-48x48">
              <img src="https://files.realpython.com/media/real-python-logo-thumbnail.7f0db70c2ed2.jpg?__no_cf_polish=1" alt="Real Python Logo">
            </figure>
          </div>
          <div class="media-content">
            <h2 class="title is-5">Python Programmer (Entry-Level)</h2>
            <h3 class="subtitle is-6 company">Cooper and Sons</h3>
          </div>
        </div>
    
        <div class="content">
          <p class="location">
            West Victor, AE
          </p>
          <p class="is-small has-text-grey">
            <time datetime="2021-04-08">2021-04-08</time>
          </p>
        </div>
        <footer class="card-footer">
            <a href="https://www.realpython.com" target="_blank" class="card-footer-item">Learn</a>
            <a href="https://realpython.github.io/fake-jobs/jobs/python-programmer-entry-level-30.html" target="_blank" class="card-footer-item">Apply</a>
        </footer>
      </div>
    </div>
    </div>
    <div class="column is-half">
    <div class="card">
      <div class="card-content">
        <div class="media">
          <div class="media-left">
            <figure class="image is-48x48">
              <img src="https://files.realpython.com/media/real-python-logo-thumbnail.7f0db70c2ed2.jpg?__no_cf_polish=1" alt="Real Python Logo">
            </figure>
          </div>
          <div class="media-content">
            <h2 class="title is-5">Neurosurgeon</h2>
            <h3 class="subtitle is-6 company">Donovan, Gonzalez and Figueroa</h3>
          </div>
        </div>
    
        <div class="content">
          <p class="location">
            Port Aaron, AP
          </p>
          <p class="is-small has-text-grey">
            <time datetime="2021-04-08">2021-04-08</time>
          </p>
        </div>
        <footer class="card-footer">
            <a href="https://www.realpython.com" target="_blank" class="card-footer-item">Learn</a>
            <a href="https://realpython.github.io/fake-jobs/jobs/neurosurgeon-31.html" target="_blank" class="card-footer-item">Apply</a>
        </footer>
      </div>
    </div>
    </div>
    <div class="column is-half">
    <div class="card">
      <div class="card-content">
        <div class="media">
          <div class="media-left">
            <figure class="image is-48x48">
              <img src="https://files.realpython.com/media/real-python-logo-thumbnail.7f0db70c2ed2.jpg?__no_cf_polish=1" alt="Real Python Logo">
            </figure>
          </div>
          <div class="media-content">
            <h2 class="title is-5">Broadcast engineer</h2>
            <h3 class="subtitle is-6 company">Morgan, Butler and Bennett</h3>
          </div>
        </div>
    
        <div class="content">
          <p class="location">
            Loribury, AA
          </p>
          <p class="is-small has-text-grey">
            <time datetime="2021-04-08">2021-04-08</time>
          </p>
        </div>
        <footer class="card-footer">
            <a href="https://www.realpython.com" target="_blank" class="card-footer-item">Learn</a>
            <a href="https://realpython.github.io/fake-jobs/jobs/broadcast-engineer-32.html" target="_blank" class="card-footer-item">Apply</a>
        </footer>
      </div>
    </div>
    </div>
    <div class="column is-half">
    <div class="card">
      <div class="card-content">
        <div class="media">
          <div class="media-left">
            <figure class="image is-48x48">
              <img src="https://files.realpython.com/media/real-python-logo-thumbnail.7f0db70c2ed2.jpg?__no_cf_polish=1" alt="Real Python Logo">
            </figure>
          </div>
          <div class="media-content">
            <h2 class="title is-5">Make</h2>
            <h3 class="subtitle is-6 company">Snyder-Lee</h3>
          </div>
        </div>
    
        <div class="content">
          <p class="location">
            Angelastad, AP
          </p>
          <p class="is-small has-text-grey">
            <time datetime="2021-04-08">2021-04-08</time>
          </p>
        </div>
        <footer class="card-footer">
            <a href="https://www.realpython.com" target="_blank" class="card-footer-item">Learn</a>
            <a href="https://realpython.github.io/fake-jobs/jobs/make-33.html" target="_blank" class="card-footer-item">Apply</a>
        </footer>
      </div>
    </div>
    </div>
    <div class="column is-half">
    <div class="card">
      <div class="card-content">
        <div class="media">
          <div class="media-left">
            <figure class="image is-48x48">
              <img src="https://files.realpython.com/media/real-python-logo-thumbnail.7f0db70c2ed2.jpg?__no_cf_polish=1" alt="Real Python Logo">
            </figure>
          </div>
          <div class="media-content">
            <h2 class="title is-5">Nurse, adult</h2>
            <h3 class="subtitle is-6 company">Harris PLC</h3>
          </div>
        </div>
    
        <div class="content">
          <p class="location">
            Larrytown, AE
          </p>
          <p class="is-small has-text-grey">
            <time datetime="2021-04-08">2021-04-08</time>
          </p>
        </div>
        <footer class="card-footer">
            <a href="https://www.realpython.com" target="_blank" class="card-footer-item">Learn</a>
            <a href="https://realpython.github.io/fake-jobs/jobs/nurse-adult-34.html" target="_blank" class="card-footer-item">Apply</a>
        </footer>
      </div>
    </div>
    </div>
    <div class="column is-half">
    <div class="card">
      <div class="card-content">
        <div class="media">
          <div class="media-left">
            <figure class="image is-48x48">
              <img src="https://files.realpython.com/media/real-python-logo-thumbnail.7f0db70c2ed2.jpg?__no_cf_polish=1" alt="Real Python Logo">
            </figure>
          </div>
          <div class="media-content">
            <h2 class="title is-5">Air broker</h2>
            <h3 class="subtitle is-6 company">Washington PLC</h3>
          </div>
        </div>
    
        <div class="content">
          <p class="location">
            West Colin, AP
          </p>
          <p class="is-small has-text-grey">
            <time datetime="2021-04-08">2021-04-08</time>
          </p>
        </div>
        <footer class="card-footer">
            <a href="https://www.realpython.com" target="_blank" class="card-footer-item">Learn</a>
            <a href="https://realpython.github.io/fake-jobs/jobs/air-broker-35.html" target="_blank" class="card-footer-item">Apply</a>
        </footer>
      </div>
    </div>
    </div>
    <div class="column is-half">
    <div class="card">
      <div class="card-content">
        <div class="media">
          <div class="media-left">
            <figure class="image is-48x48">
              <img src="https://files.realpython.com/media/real-python-logo-thumbnail.7f0db70c2ed2.jpg?__no_cf_polish=1" alt="Real Python Logo">
            </figure>
          </div>
          <div class="media-content">
            <h2 class="title is-5">Editor, film/video</h2>
            <h3 class="subtitle is-6 company">Brown, Price and Campbell</h3>
          </div>
        </div>
    
        <div class="content">
          <p class="location">
            West Stephanie, AP
          </p>
          <p class="is-small has-text-grey">
            <time datetime="2021-04-08">2021-04-08</time>
          </p>
        </div>
        <footer class="card-footer">
            <a href="https://www.realpython.com" target="_blank" class="card-footer-item">Learn</a>
            <a href="https://realpython.github.io/fake-jobs/jobs/editor-film-video-36.html" target="_blank" class="card-footer-item">Apply</a>
        </footer>
      </div>
    </div>
    </div>
    <div class="column is-half">
    <div class="card">
      <div class="card-content">
        <div class="media">
          <div class="media-left">
            <figure class="image is-48x48">
              <img src="https://files.realpython.com/media/real-python-logo-thumbnail.7f0db70c2ed2.jpg?__no_cf_polish=1" alt="Real Python Logo">
            </figure>
          </div>
          <div class="media-content">
            <h2 class="title is-5">Production assistant, radio</h2>
            <h3 class="subtitle is-6 company">Mcgee PLC</h3>
          </div>
        </div>
    
        <div class="content">
          <p class="location">
            Laurentown, AP
          </p>
          <p class="is-small has-text-grey">
            <time datetime="2021-04-08">2021-04-08</time>
          </p>
        </div>
        <footer class="card-footer">
            <a href="https://www.realpython.com" target="_blank" class="card-footer-item">Learn</a>
            <a href="https://realpython.github.io/fake-jobs/jobs/production-assistant-radio-37.html" target="_blank" class="card-footer-item">Apply</a>
        </footer>
      </div>
    </div>
    </div>
    <div class="column is-half">
    <div class="card">
      <div class="card-content">
        <div class="media">
          <div class="media-left">
            <figure class="image is-48x48">
              <img src="https://files.realpython.com/media/real-python-logo-thumbnail.7f0db70c2ed2.jpg?__no_cf_polish=1" alt="Real Python Logo">
            </figure>
          </div>
          <div class="media-content">
            <h2 class="title is-5">Engineer, communications</h2>
            <h3 class="subtitle is-6 company">Dixon Inc</h3>
          </div>
        </div>
    
        <div class="content">
          <p class="location">
            Wrightberg, AP
          </p>
          <p class="is-small has-text-grey">
            <time datetime="2021-04-08">2021-04-08</time>
          </p>
        </div>
        <footer class="card-footer">
            <a href="https://www.realpython.com" target="_blank" class="card-footer-item">Learn</a>
            <a href="https://realpython.github.io/fake-jobs/jobs/engineer-communications-38.html" target="_blank" class="card-footer-item">Apply</a>
        </footer>
      </div>
    </div>
    </div>
    <div class="column is-half">
    <div class="card">
      <div class="card-content">
        <div class="media">
          <div class="media-left">
            <figure class="image is-48x48">
              <img src="https://files.realpython.com/media/real-python-logo-thumbnail.7f0db70c2ed2.jpg?__no_cf_polish=1" alt="Real Python Logo">
            </figure>
          </div>
          <div class="media-content">
            <h2 class="title is-5">Sales executive</h2>
            <h3 class="subtitle is-6 company">Thompson, Sheppard and Ward</h3>
          </div>
        </div>
    
        <div class="content">
          <p class="location">
            Alberttown, AE
          </p>
          <p class="is-small has-text-grey">
            <time datetime="2021-04-08">2021-04-08</time>
          </p>
        </div>
        <footer class="card-footer">
            <a href="https://www.realpython.com" target="_blank" class="card-footer-item">Learn</a>
            <a href="https://realpython.github.io/fake-jobs/jobs/sales-executive-39.html" target="_blank" class="card-footer-item">Apply</a>
        </footer>
      </div>
    </div>
    </div>
    <div class="column is-half">
    <div class="card">
      <div class="card-content">
        <div class="media">
          <div class="media-left">
            <figure class="image is-48x48">
              <img src="https://files.realpython.com/media/real-python-logo-thumbnail.7f0db70c2ed2.jpg?__no_cf_polish=1" alt="Real Python Logo">
            </figure>
          </div>
          <div class="media-content">
            <h2 class="title is-5">Software Developer (Python)</h2>
            <h3 class="subtitle is-6 company">Adams-Brewer</h3>
          </div>
        </div>
    
        <div class="content">
          <p class="location">
            Brockburgh, AE
          </p>
          <p class="is-small has-text-grey">
            <time datetime="2021-04-08">2021-04-08</time>
          </p>
        </div>
        <footer class="card-footer">
            <a href="https://www.realpython.com" target="_blank" class="card-footer-item">Learn</a>
            <a href="https://realpython.github.io/fake-jobs/jobs/software-developer-python-40.html" target="_blank" class="card-footer-item">Apply</a>
        </footer>
      </div>
    </div>
    </div>
    <div class="column is-half">
    <div class="card">
      <div class="card-content">
        <div class="media">
          <div class="media-left">
            <figure class="image is-48x48">
              <img src="https://files.realpython.com/media/real-python-logo-thumbnail.7f0db70c2ed2.jpg?__no_cf_polish=1" alt="Real Python Logo">
            </figure>
          </div>
          <div class="media-content">
            <h2 class="title is-5">Futures trader</h2>
            <h3 class="subtitle is-6 company">Schneider-Brady</h3>
          </div>
        </div>
    
        <div class="content">
          <p class="location">
            North Jason, AE
          </p>
          <p class="is-small has-text-grey">
            <time datetime="2021-04-08">2021-04-08</time>
          </p>
        </div>
        <footer class="card-footer">
            <a href="https://www.realpython.com" target="_blank" class="card-footer-item">Learn</a>
            <a href="https://realpython.github.io/fake-jobs/jobs/futures-trader-41.html" target="_blank" class="card-footer-item">Apply</a>
        </footer>
      </div>
    </div>
    </div>
    <div class="column is-half">
    <div class="card">
      <div class="card-content">
        <div class="media">
          <div class="media-left">
            <figure class="image is-48x48">
              <img src="https://files.realpython.com/media/real-python-logo-thumbnail.7f0db70c2ed2.jpg?__no_cf_polish=1" alt="Real Python Logo">
            </figure>
          </div>
          <div class="media-content">
            <h2 class="title is-5">Tour manager</h2>
            <h3 class="subtitle is-6 company">Gonzales-Frank</h3>
          </div>
        </div>
    
        <div class="content">
          <p class="location">
            Arnoldhaven, AE
          </p>
          <p class="is-small has-text-grey">
            <time datetime="2021-04-08">2021-04-08</time>
          </p>
        </div>
        <footer class="card-footer">
            <a href="https://www.realpython.com" target="_blank" class="card-footer-item">Learn</a>
            <a href="https://realpython.github.io/fake-jobs/jobs/tour-manager-42.html" target="_blank" class="card-footer-item">Apply</a>
        </footer>
      </div>
    </div>
    </div>
    <div class="column is-half">
    <div class="card">
      <div class="card-content">
        <div class="media">
          <div class="media-left">
            <figure class="image is-48x48">
              <img src="https://files.realpython.com/media/real-python-logo-thumbnail.7f0db70c2ed2.jpg?__no_cf_polish=1" alt="Real Python Logo">
            </figure>
          </div>
          <div class="media-content">
            <h2 class="title is-5">Cytogeneticist</h2>
            <h3 class="subtitle is-6 company">Smith-Wong</h3>
          </div>
        </div>
    
        <div class="content">
          <p class="location">
            Lake Destiny, AP
          </p>
          <p class="is-small has-text-grey">
            <time datetime="2021-04-08">2021-04-08</time>
          </p>
        </div>
        <footer class="card-footer">
            <a href="https://www.realpython.com" target="_blank" class="card-footer-item">Learn</a>
            <a href="https://realpython.github.io/fake-jobs/jobs/cytogeneticist-43.html" target="_blank" class="card-footer-item">Apply</a>
        </footer>
      </div>
    </div>
    </div>
    <div class="column is-half">
    <div class="card">
      <div class="card-content">
        <div class="media">
          <div class="media-left">
            <figure class="image is-48x48">
              <img src="https://files.realpython.com/media/real-python-logo-thumbnail.7f0db70c2ed2.jpg?__no_cf_polish=1" alt="Real Python Logo">
            </figure>
          </div>
          <div class="media-content">
            <h2 class="title is-5">Designer, multimedia</h2>
            <h3 class="subtitle is-6 company">Pierce-Herrera</h3>
          </div>
        </div>
    
        <div class="content">
          <p class="location">
            South Timothyburgh, AP
          </p>
          <p class="is-small has-text-grey">
            <time datetime="2021-04-08">2021-04-08</time>
          </p>
        </div>
        <footer class="card-footer">
            <a href="https://www.realpython.com" target="_blank" class="card-footer-item">Learn</a>
            <a href="https://realpython.github.io/fake-jobs/jobs/designer-multimedia-44.html" target="_blank" class="card-footer-item">Apply</a>
        </footer>
      </div>
    </div>
    </div>
    <div class="column is-half">
    <div class="card">
      <div class="card-content">
        <div class="media">
          <div class="media-left">
            <figure class="image is-48x48">
              <img src="https://files.realpython.com/media/real-python-logo-thumbnail.7f0db70c2ed2.jpg?__no_cf_polish=1" alt="Real Python Logo">
            </figure>
          </div>
          <div class="media-content">
            <h2 class="title is-5">Trade union research officer</h2>
            <h3 class="subtitle is-6 company">Aguilar, Rivera and Quinn</h3>
          </div>
        </div>
    
        <div class="content">
          <p class="location">
            New Jimmyton, AE
          </p>
          <p class="is-small has-text-grey">
            <time datetime="2021-04-08">2021-04-08</time>
          </p>
        </div>
        <footer class="card-footer">
            <a href="https://www.realpython.com" target="_blank" class="card-footer-item">Learn</a>
            <a href="https://realpython.github.io/fake-jobs/jobs/trade-union-research-officer-45.html" target="_blank" class="card-footer-item">Apply</a>
        </footer>
      </div>
    </div>
    </div>
    <div class="column is-half">
    <div class="card">
      <div class="card-content">
        <div class="media">
          <div class="media-left">
            <figure class="image is-48x48">
              <img src="https://files.realpython.com/media/real-python-logo-thumbnail.7f0db70c2ed2.jpg?__no_cf_polish=1" alt="Real Python Logo">
            </figure>
          </div>
          <div class="media-content">
            <h2 class="title is-5">Chemist, analytical</h2>
            <h3 class="subtitle is-6 company">Lowe, Barnes and Thomas</h3>
          </div>
        </div>
    
        <div class="content">
          <p class="location">
            New Lucasbury, AP
          </p>
          <p class="is-small has-text-grey">
            <time datetime="2021-04-08">2021-04-08</time>
          </p>
        </div>
        <footer class="card-footer">
            <a href="https://www.realpython.com" target="_blank" class="card-footer-item">Learn</a>
            <a href="https://realpython.github.io/fake-jobs/jobs/chemist-analytical-46.html" target="_blank" class="card-footer-item">Apply</a>
        </footer>
      </div>
    </div>
    </div>
    <div class="column is-half">
    <div class="card">
      <div class="card-content">
        <div class="media">
          <div class="media-left">
            <figure class="image is-48x48">
              <img src="https://files.realpython.com/media/real-python-logo-thumbnail.7f0db70c2ed2.jpg?__no_cf_polish=1" alt="Real Python Logo">
            </figure>
          </div>
          <div class="media-content">
            <h2 class="title is-5">Programmer, multimedia</h2>
            <h3 class="subtitle is-6 company">Lewis, Gonzalez and Vasquez</h3>
          </div>
        </div>
    
        <div class="content">
          <p class="location">
            Port Cory, AE
          </p>
          <p class="is-small has-text-grey">
            <time datetime="2021-04-08">2021-04-08</time>
          </p>
        </div>
        <footer class="card-footer">
            <a href="https://www.realpython.com" target="_blank" class="card-footer-item">Learn</a>
            <a href="https://realpython.github.io/fake-jobs/jobs/programmer-multimedia-47.html" target="_blank" class="card-footer-item">Apply</a>
        </footer>
      </div>
    </div>
    </div>
    <div class="column is-half">
    <div class="card">
      <div class="card-content">
        <div class="media">
          <div class="media-left">
            <figure class="image is-48x48">
              <img src="https://files.realpython.com/media/real-python-logo-thumbnail.7f0db70c2ed2.jpg?__no_cf_polish=1" alt="Real Python Logo">
            </figure>
          </div>
          <div class="media-content">
            <h2 class="title is-5">Engineer, broadcasting (operations)</h2>
            <h3 class="subtitle is-6 company">Taylor PLC</h3>
          </div>
        </div>
    
        <div class="content">
          <p class="location">
            Gileston, AA
          </p>
          <p class="is-small has-text-grey">
            <time datetime="2021-04-08">2021-04-08</time>
          </p>
        </div>
        <footer class="card-footer">
            <a href="https://www.realpython.com" target="_blank" class="card-footer-item">Learn</a>
            <a href="https://realpython.github.io/fake-jobs/jobs/engineer-broadcasting-operations-48.html" target="_blank" class="card-footer-item">Apply</a>
        </footer>
      </div>
    </div>
    </div>
    <div class="column is-half">
    <div class="card">
      <div class="card-content">
        <div class="media">
          <div class="media-left">
            <figure class="image is-48x48">
              <img src="https://files.realpython.com/media/real-python-logo-thumbnail.7f0db70c2ed2.jpg?__no_cf_polish=1" alt="Real Python Logo">
            </figure>
          </div>
          <div class="media-content">
            <h2 class="title is-5">Teacher, primary school</h2>
            <h3 class="subtitle is-6 company">Oliver, Jones and Ramirez</h3>
          </div>
        </div>
    
        <div class="content">
          <p class="location">
            Cindyshire, AA
          </p>
          <p class="is-small has-text-grey">
            <time datetime="2021-04-08">2021-04-08</time>
          </p>
        </div>
        <footer class="card-footer">
            <a href="https://www.realpython.com" target="_blank" class="card-footer-item">Learn</a>
            <a href="https://realpython.github.io/fake-jobs/jobs/teacher-primary-school-49.html" target="_blank" class="card-footer-item">Apply</a>
        </footer>
      </div>
    </div>
    </div>
    <div class="column is-half">
    <div class="card">
      <div class="card-content">
        <div class="media">
          <div class="media-left">
            <figure class="image is-48x48">
              <img src="https://files.realpython.com/media/real-python-logo-thumbnail.7f0db70c2ed2.jpg?__no_cf_polish=1" alt="Real Python Logo">
            </figure>
          </div>
          <div class="media-content">
            <h2 class="title is-5">Python Developer</h2>
            <h3 class="subtitle is-6 company">Rivera and Sons</h3>
          </div>
        </div>
    
        <div class="content">
          <p class="location">
            East Michaelfort, AA
          </p>
          <p class="is-small has-text-grey">
            <time datetime="2021-04-08">2021-04-08</time>
          </p>
        </div>
        <footer class="card-footer">
            <a href="https://www.realpython.com" target="_blank" class="card-footer-item">Learn</a>
            <a href="https://realpython.github.io/fake-jobs/jobs/python-developer-50.html" target="_blank" class="card-footer-item">Apply</a>
        </footer>
      </div>
    </div>
    </div>
    <div class="column is-half">
    <div class="card">
      <div class="card-content">
        <div class="media">
          <div class="media-left">
            <figure class="image is-48x48">
              <img src="https://files.realpython.com/media/real-python-logo-thumbnail.7f0db70c2ed2.jpg?__no_cf_polish=1" alt="Real Python Logo">
            </figure>
          </div>
          <div class="media-content">
            <h2 class="title is-5">Manufacturing systems engineer</h2>
            <h3 class="subtitle is-6 company">Garcia PLC</h3>
          </div>
        </div>
    
        <div class="content">
          <p class="location">
            Joybury, AE
          </p>
          <p class="is-small has-text-grey">
            <time datetime="2021-04-08">2021-04-08</time>
          </p>
        </div>
        <footer class="card-footer">
            <a href="https://www.realpython.com" target="_blank" class="card-footer-item">Learn</a>
            <a href="https://realpython.github.io/fake-jobs/jobs/manufacturing-systems-engineer-51.html" target="_blank" class="card-footer-item">Apply</a>
        </footer>
      </div>
    </div>
    </div>
    <div class="column is-half">
    <div class="card">
      <div class="card-content">
        <div class="media">
          <div class="media-left">
            <figure class="image is-48x48">
              <img src="https://files.realpython.com/media/real-python-logo-thumbnail.7f0db70c2ed2.jpg?__no_cf_polish=1" alt="Real Python Logo">
            </figure>
          </div>
          <div class="media-content">
            <h2 class="title is-5">Producer, television/film/video</h2>
            <h3 class="subtitle is-6 company">Johnson, Wells and Kramer</h3>
          </div>
        </div>
    
        <div class="content">
          <p class="location">
            Emmatown, AE
          </p>
          <p class="is-small has-text-grey">
            <time datetime="2021-04-08">2021-04-08</time>
          </p>
        </div>
        <footer class="card-footer">
            <a href="https://www.realpython.com" target="_blank" class="card-footer-item">Learn</a>
            <a href="https://realpython.github.io/fake-jobs/jobs/producer-television-film-video-52.html" target="_blank" class="card-footer-item">Apply</a>
        </footer>
      </div>
    </div>
    </div>
    <div class="column is-half">
    <div class="card">
      <div class="card-content">
        <div class="media">
          <div class="media-left">
            <figure class="image is-48x48">
              <img src="https://files.realpython.com/media/real-python-logo-thumbnail.7f0db70c2ed2.jpg?__no_cf_polish=1" alt="Real Python Logo">
            </figure>
          </div>
          <div class="media-content">
            <h2 class="title is-5">Scientist, forensic</h2>
            <h3 class="subtitle is-6 company">Gonzalez LLC</h3>
          </div>
        </div>
    
        <div class="content">
          <p class="location">
            Colehaven, AP
          </p>
          <p class="is-small has-text-grey">
            <time datetime="2021-04-08">2021-04-08</time>
          </p>
        </div>
        <footer class="card-footer">
            <a href="https://www.realpython.com" target="_blank" class="card-footer-item">Learn</a>
            <a href="https://realpython.github.io/fake-jobs/jobs/scientist-forensic-53.html" target="_blank" class="card-footer-item">Apply</a>
        </footer>
      </div>
    </div>
    </div>
    <div class="column is-half">
    <div class="card">
      <div class="card-content">
        <div class="media">
          <div class="media-left">
            <figure class="image is-48x48">
              <img src="https://files.realpython.com/media/real-python-logo-thumbnail.7f0db70c2ed2.jpg?__no_cf_polish=1" alt="Real Python Logo">
            </figure>
          </div>
          <div class="media-content">
            <h2 class="title is-5">Bonds trader</h2>
            <h3 class="subtitle is-6 company">Morgan, White and Macdonald</h3>
          </div>
        </div>
    
        <div class="content">
          <p class="location">
            Port Coryton, AE
          </p>
          <p class="is-small has-text-grey">
            <time datetime="2021-04-08">2021-04-08</time>
          </p>
        </div>
        <footer class="card-footer">
            <a href="https://www.realpython.com" target="_blank" class="card-footer-item">Learn</a>
            <a href="https://realpython.github.io/fake-jobs/jobs/bonds-trader-54.html" target="_blank" class="card-footer-item">Apply</a>
        </footer>
      </div>
    </div>
    </div>
    <div class="column is-half">
    <div class="card">
      <div class="card-content">
        <div class="media">
          <div class="media-left">
            <figure class="image is-48x48">
              <img src="https://files.realpython.com/media/real-python-logo-thumbnail.7f0db70c2ed2.jpg?__no_cf_polish=1" alt="Real Python Logo">
            </figure>
          </div>
          <div class="media-content">
            <h2 class="title is-5">Editorial assistant</h2>
            <h3 class="subtitle is-6 company">Robinson-Fitzpatrick</h3>
          </div>
        </div>
    
        <div class="content">
          <p class="location">
            Amyborough, AA
          </p>
          <p class="is-small has-text-grey">
            <time datetime="2021-04-08">2021-04-08</time>
          </p>
        </div>
        <footer class="card-footer">
            <a href="https://www.realpython.com" target="_blank" class="card-footer-item">Learn</a>
            <a href="https://realpython.github.io/fake-jobs/jobs/editorial-assistant-55.html" target="_blank" class="card-footer-item">Apply</a>
        </footer>
      </div>
    </div>
    </div>
    <div class="column is-half">
    <div class="card">
      <div class="card-content">
        <div class="media">
          <div class="media-left">
            <figure class="image is-48x48">
              <img src="https://files.realpython.com/media/real-python-logo-thumbnail.7f0db70c2ed2.jpg?__no_cf_polish=1" alt="Real Python Logo">
            </figure>
          </div>
          <div class="media-content">
            <h2 class="title is-5">Photographer</h2>
            <h3 class="subtitle is-6 company">Waters, Wilson and Hoover</h3>
          </div>
        </div>
    
        <div class="content">
          <p class="location">
            Reynoldsville, AA
          </p>
          <p class="is-small has-text-grey">
            <time datetime="2021-04-08">2021-04-08</time>
          </p>
        </div>
        <footer class="card-footer">
            <a href="https://www.realpython.com" target="_blank" class="card-footer-item">Learn</a>
            <a href="https://realpython.github.io/fake-jobs/jobs/photographer-56.html" target="_blank" class="card-footer-item">Apply</a>
        </footer>
      </div>
    </div>
    </div>
    <div class="column is-half">
    <div class="card">
      <div class="card-content">
        <div class="media">
          <div class="media-left">
            <figure class="image is-48x48">
              <img src="https://files.realpython.com/media/real-python-logo-thumbnail.7f0db70c2ed2.jpg?__no_cf_polish=1" alt="Real Python Logo">
            </figure>
          </div>
          <div class="media-content">
            <h2 class="title is-5">Retail banker</h2>
            <h3 class="subtitle is-6 company">Hill LLC</h3>
          </div>
        </div>
    
        <div class="content">
          <p class="location">
            Port Billy, AP
          </p>
          <p class="is-small has-text-grey">
            <time datetime="2021-04-08">2021-04-08</time>
          </p>
        </div>
        <footer class="card-footer">
            <a href="https://www.realpython.com" target="_blank" class="card-footer-item">Learn</a>
            <a href="https://realpython.github.io/fake-jobs/jobs/retail-banker-57.html" target="_blank" class="card-footer-item">Apply</a>
        </footer>
      </div>
    </div>
    </div>
    <div class="column is-half">
    <div class="card">
      <div class="card-content">
        <div class="media">
          <div class="media-left">
            <figure class="image is-48x48">
              <img src="https://files.realpython.com/media/real-python-logo-thumbnail.7f0db70c2ed2.jpg?__no_cf_polish=1" alt="Real Python Logo">
            </figure>
          </div>
          <div class="media-content">
            <h2 class="title is-5">Jewellery designer</h2>
            <h3 class="subtitle is-6 company">Li-Gregory</h3>
          </div>
        </div>
    
        <div class="content">
          <p class="location">
            Adamburgh, AA
          </p>
          <p class="is-small has-text-grey">
            <time datetime="2021-04-08">2021-04-08</time>
          </p>
        </div>
        <footer class="card-footer">
            <a href="https://www.realpython.com" target="_blank" class="card-footer-item">Learn</a>
            <a href="https://realpython.github.io/fake-jobs/jobs/jewellery-designer-58.html" target="_blank" class="card-footer-item">Apply</a>
        </footer>
      </div>
    </div>
    </div>
    <div class="column is-half">
    <div class="card">
      <div class="card-content">
        <div class="media">
          <div class="media-left">
            <figure class="image is-48x48">
              <img src="https://files.realpython.com/media/real-python-logo-thumbnail.7f0db70c2ed2.jpg?__no_cf_polish=1" alt="Real Python Logo">
            </figure>
          </div>
          <div class="media-content">
            <h2 class="title is-5">Ophthalmologist</h2>
            <h3 class="subtitle is-6 company">Fisher, Ryan and Coleman</h3>
          </div>
        </div>
    
        <div class="content">
          <p class="location">
            Wilsonmouth, AA
          </p>
          <p class="is-small has-text-grey">
            <time datetime="2021-04-08">2021-04-08</time>
          </p>
        </div>
        <footer class="card-footer">
            <a href="https://www.realpython.com" target="_blank" class="card-footer-item">Learn</a>
            <a href="https://realpython.github.io/fake-jobs/jobs/ophthalmologist-59.html" target="_blank" class="card-footer-item">Apply</a>
        </footer>
      </div>
    </div>
    </div>
    <div class="column is-half">
    <div class="card">
      <div class="card-content">
        <div class="media">
          <div class="media-left">
            <figure class="image is-48x48">
              <img src="https://files.realpython.com/media/real-python-logo-thumbnail.7f0db70c2ed2.jpg?__no_cf_polish=1" alt="Real Python Logo">
            </figure>
          </div>
          <div class="media-content">
            <h2 class="title is-5">Back-End Web Developer (Python, Django)</h2>
            <h3 class="subtitle is-6 company">Stewart-Alexander</h3>
          </div>
        </div>
    
        <div class="content">
          <p class="location">
            South Kimberly, AA
          </p>
          <p class="is-small has-text-grey">
            <time datetime="2021-04-08">2021-04-08</time>
          </p>
        </div>
        <footer class="card-footer">
            <a href="https://www.realpython.com" target="_blank" class="card-footer-item">Learn</a>
            <a href="https://realpython.github.io/fake-jobs/jobs/back-end-web-developer-python-django-60.html" target="_blank" class="card-footer-item">Apply</a>
        </footer>
      </div>
    </div>
    </div>
    <div class="column is-half">
    <div class="card">
      <div class="card-content">
        <div class="media">
          <div class="media-left">
            <figure class="image is-48x48">
              <img src="https://files.realpython.com/media/real-python-logo-thumbnail.7f0db70c2ed2.jpg?__no_cf_polish=1" alt="Real Python Logo">
            </figure>
          </div>
          <div class="media-content">
            <h2 class="title is-5">Licensed conveyancer</h2>
            <h3 class="subtitle is-6 company">Abbott and Sons</h3>
          </div>
        </div>
    
        <div class="content">
          <p class="location">
            Benjaminland, AP
          </p>
          <p class="is-small has-text-grey">
            <time datetime="2021-04-08">2021-04-08</time>
          </p>
        </div>
        <footer class="card-footer">
            <a href="https://www.realpython.com" target="_blank" class="card-footer-item">Learn</a>
            <a href="https://realpython.github.io/fake-jobs/jobs/licensed-conveyancer-61.html" target="_blank" class="card-footer-item">Apply</a>
        </footer>
      </div>
    </div>
    </div>
    <div class="column is-half">
    <div class="card">
      <div class="card-content">
        <div class="media">
          <div class="media-left">
            <figure class="image is-48x48">
              <img src="https://files.realpython.com/media/real-python-logo-thumbnail.7f0db70c2ed2.jpg?__no_cf_polish=1" alt="Real Python Logo">
            </figure>
          </div>
          <div class="media-content">
            <h2 class="title is-5">Futures trader</h2>
            <h3 class="subtitle is-6 company">Bryant, Santana and Davenport</h3>
          </div>
        </div>
    
        <div class="content">
          <p class="location">
            Zacharyport, AA
          </p>
          <p class="is-small has-text-grey">
            <time datetime="2021-04-08">2021-04-08</time>
          </p>
        </div>
        <footer class="card-footer">
            <a href="https://www.realpython.com" target="_blank" class="card-footer-item">Learn</a>
            <a href="https://realpython.github.io/fake-jobs/jobs/futures-trader-62.html" target="_blank" class="card-footer-item">Apply</a>
        </footer>
      </div>
    </div>
    </div>
    <div class="column is-half">
    <div class="card">
      <div class="card-content">
        <div class="media">
          <div class="media-left">
            <figure class="image is-48x48">
              <img src="https://files.realpython.com/media/real-python-logo-thumbnail.7f0db70c2ed2.jpg?__no_cf_polish=1" alt="Real Python Logo">
            </figure>
          </div>
          <div class="media-content">
            <h2 class="title is-5">Counselling psychologist</h2>
            <h3 class="subtitle is-6 company">Smith PLC</h3>
          </div>
        </div>
    
        <div class="content">
          <p class="location">
            Port Devonville, AE
          </p>
          <p class="is-small has-text-grey">
            <time datetime="2021-04-08">2021-04-08</time>
          </p>
        </div>
        <footer class="card-footer">
            <a href="https://www.realpython.com" target="_blank" class="card-footer-item">Learn</a>
            <a href="https://realpython.github.io/fake-jobs/jobs/counselling-psychologist-63.html" target="_blank" class="card-footer-item">Apply</a>
        </footer>
      </div>
    </div>
    </div>
    <div class="column is-half">
    <div class="card">
      <div class="card-content">
        <div class="media">
          <div class="media-left">
            <figure class="image is-48x48">
              <img src="https://files.realpython.com/media/real-python-logo-thumbnail.7f0db70c2ed2.jpg?__no_cf_polish=1" alt="Real Python Logo">
            </figure>
          </div>
          <div class="media-content">
            <h2 class="title is-5">Insurance underwriter</h2>
            <h3 class="subtitle is-6 company">Patterson-Singh</h3>
          </div>
        </div>
    
        <div class="content">
          <p class="location">
            East Thomas, AE
          </p>
          <p class="is-small has-text-grey">
            <time datetime="2021-04-08">2021-04-08</time>
          </p>
        </div>
        <footer class="card-footer">
            <a href="https://www.realpython.com" target="_blank" class="card-footer-item">Learn</a>
            <a href="https://realpython.github.io/fake-jobs/jobs/insurance-underwriter-64.html" target="_blank" class="card-footer-item">Apply</a>
        </footer>
      </div>
    </div>
    </div>
    <div class="column is-half">
    <div class="card">
      <div class="card-content">
        <div class="media">
          <div class="media-left">
            <figure class="image is-48x48">
              <img src="https://files.realpython.com/media/real-python-logo-thumbnail.7f0db70c2ed2.jpg?__no_cf_polish=1" alt="Real Python Logo">
            </figure>
          </div>
          <div class="media-content">
            <h2 class="title is-5">Engineer, automotive</h2>
            <h3 class="subtitle is-6 company">Martinez-Berry</h3>
          </div>
        </div>
    
        <div class="content">
          <p class="location">
            New Jeffrey, AP
          </p>
          <p class="is-small has-text-grey">
            <time datetime="2021-04-08">2021-04-08</time>
          </p>
        </div>
        <footer class="card-footer">
            <a href="https://www.realpython.com" target="_blank" class="card-footer-item">Learn</a>
            <a href="https://realpython.github.io/fake-jobs/jobs/engineer-automotive-65.html" target="_blank" class="card-footer-item">Apply</a>
        </footer>
      </div>
    </div>
    </div>
    <div class="column is-half">
    <div class="card">
      <div class="card-content">
        <div class="media">
          <div class="media-left">
            <figure class="image is-48x48">
              <img src="https://files.realpython.com/media/real-python-logo-thumbnail.7f0db70c2ed2.jpg?__no_cf_polish=1" alt="Real Python Logo">
            </figure>
          </div>
          <div class="media-content">
            <h2 class="title is-5">Producer, radio</h2>
            <h3 class="subtitle is-6 company">May, Taylor and Fisher</h3>
          </div>
        </div>
    
        <div class="content">
          <p class="location">
            Davidside, AA
          </p>
          <p class="is-small has-text-grey">
            <time datetime="2021-04-08">2021-04-08</time>
          </p>
        </div>
        <footer class="card-footer">
            <a href="https://www.realpython.com" target="_blank" class="card-footer-item">Learn</a>
            <a href="https://realpython.github.io/fake-jobs/jobs/producer-radio-66.html" target="_blank" class="card-footer-item">Apply</a>
        </footer>
      </div>
    </div>
    </div>
    <div class="column is-half">
    <div class="card">
      <div class="card-content">
        <div class="media">
          <div class="media-left">
            <figure class="image is-48x48">
              <img src="https://files.realpython.com/media/real-python-logo-thumbnail.7f0db70c2ed2.jpg?__no_cf_polish=1" alt="Real Python Logo">
            </figure>
          </div>
          <div class="media-content">
            <h2 class="title is-5">Dispensing optician</h2>
            <h3 class="subtitle is-6 company">Bailey, Owen and Thompson</h3>
          </div>
        </div>
    
        <div class="content">
          <p class="location">
            Jamesville, AA
          </p>
          <p class="is-small has-text-grey">
            <time datetime="2021-04-08">2021-04-08</time>
          </p>
        </div>
        <footer class="card-footer">
            <a href="https://www.realpython.com" target="_blank" class="card-footer-item">Learn</a>
            <a href="https://realpython.github.io/fake-jobs/jobs/dispensing-optician-67.html" target="_blank" class="card-footer-item">Apply</a>
        </footer>
      </div>
    </div>
    </div>
    <div class="column is-half">
    <div class="card">
      <div class="card-content">
        <div class="media">
          <div class="media-left">
            <figure class="image is-48x48">
              <img src="https://files.realpython.com/media/real-python-logo-thumbnail.7f0db70c2ed2.jpg?__no_cf_polish=1" alt="Real Python Logo">
            </figure>
          </div>
          <div class="media-content">
            <h2 class="title is-5">Designer, fashion/clothing</h2>
            <h3 class="subtitle is-6 company">Vasquez Ltd</h3>
          </div>
        </div>
    
        <div class="content">
          <p class="location">
            New Kelly, AP
          </p>
          <p class="is-small has-text-grey">
            <time datetime="2021-04-08">2021-04-08</time>
          </p>
        </div>
        <footer class="card-footer">
            <a href="https://www.realpython.com" target="_blank" class="card-footer-item">Learn</a>
            <a href="https://realpython.github.io/fake-jobs/jobs/designer-fashion-clothing-68.html" target="_blank" class="card-footer-item">Apply</a>
        </footer>
      </div>
    </div>
    </div>
    <div class="column is-half">
    <div class="card">
      <div class="card-content">
        <div class="media">
          <div class="media-left">
            <figure class="image is-48x48">
              <img src="https://files.realpython.com/media/real-python-logo-thumbnail.7f0db70c2ed2.jpg?__no_cf_polish=1" alt="Real Python Logo">
            </figure>
          </div>
          <div class="media-content">
            <h2 class="title is-5">Chartered loss adjuster</h2>
            <h3 class="subtitle is-6 company">Leblanc LLC</h3>
          </div>
        </div>
    
        <div class="content">
          <p class="location">
            Lake Antonio, AA
          </p>
          <p class="is-small has-text-grey">
            <time datetime="2021-04-08">2021-04-08</time>
          </p>
        </div>
        <footer class="card-footer">
            <a href="https://www.realpython.com" target="_blank" class="card-footer-item">Learn</a>
            <a href="https://realpython.github.io/fake-jobs/jobs/chartered-loss-adjuster-69.html" target="_blank" class="card-footer-item">Apply</a>
        </footer>
      </div>
    </div>
    </div>
    <div class="column is-half">
    <div class="card">
      <div class="card-content">
        <div class="media">
          <div class="media-left">
            <figure class="image is-48x48">
              <img src="https://files.realpython.com/media/real-python-logo-thumbnail.7f0db70c2ed2.jpg?__no_cf_polish=1" alt="Real Python Logo">
            </figure>
          </div>
          <div class="media-content">
            <h2 class="title is-5">Back-End Web Developer (Python, Django)</h2>
            <h3 class="subtitle is-6 company">Jackson, Ali and Mckee</h3>
          </div>
        </div>
    
        <div class="content">
          <p class="location">
            New Elizabethside, AA
          </p>
          <p class="is-small has-text-grey">
            <time datetime="2021-04-08">2021-04-08</time>
          </p>
        </div>
        <footer class="card-footer">
            <a href="https://www.realpython.com" target="_blank" class="card-footer-item">Learn</a>
            <a href="https://realpython.github.io/fake-jobs/jobs/back-end-web-developer-python-django-70.html" target="_blank" class="card-footer-item">Apply</a>
        </footer>
      </div>
    </div>
    </div>
    <div class="column is-half">
    <div class="card">
      <div class="card-content">
        <div class="media">
          <div class="media-left">
            <figure class="image is-48x48">
              <img src="https://files.realpython.com/media/real-python-logo-thumbnail.7f0db70c2ed2.jpg?__no_cf_polish=1" alt="Real Python Logo">
            </figure>
          </div>
          <div class="media-content">
            <h2 class="title is-5">Forest/woodland manager</h2>
            <h3 class="subtitle is-6 company">Blankenship, Knight and Powell</h3>
          </div>
        </div>
    
        <div class="content">
          <p class="location">
            Millsbury, AE
          </p>
          <p class="is-small has-text-grey">
            <time datetime="2021-04-08">2021-04-08</time>
          </p>
        </div>
        <footer class="card-footer">
            <a href="https://www.realpython.com" target="_blank" class="card-footer-item">Learn</a>
            <a href="https://realpython.github.io/fake-jobs/jobs/forest-woodland-manager-71.html" target="_blank" class="card-footer-item">Apply</a>
        </footer>
      </div>
    </div>
    </div>
    <div class="column is-half">
    <div class="card">
      <div class="card-content">
        <div class="media">
          <div class="media-left">
            <figure class="image is-48x48">
              <img src="https://files.realpython.com/media/real-python-logo-thumbnail.7f0db70c2ed2.jpg?__no_cf_polish=1" alt="Real Python Logo">
            </figure>
          </div>
          <div class="media-content">
            <h2 class="title is-5">Clinical cytogeneticist</h2>
            <h3 class="subtitle is-6 company">Patton, Haynes and Jones</h3>
          </div>
        </div>
    
        <div class="content">
          <p class="location">
            Lloydton, AP
          </p>
          <p class="is-small has-text-grey">
            <time datetime="2021-04-08">2021-04-08</time>
          </p>
        </div>
        <footer class="card-footer">
            <a href="https://www.realpython.com" target="_blank" class="card-footer-item">Learn</a>
            <a href="https://realpython.github.io/fake-jobs/jobs/clinical-cytogeneticist-72.html" target="_blank" class="card-footer-item">Apply</a>
        </footer>
      </div>
    </div>
    </div>
    <div class="column is-half">
    <div class="card">
      <div class="card-content">
        <div class="media">
          <div class="media-left">
            <figure class="image is-48x48">
              <img src="https://files.realpython.com/media/real-python-logo-thumbnail.7f0db70c2ed2.jpg?__no_cf_polish=1" alt="Real Python Logo">
            </figure>
          </div>
          <div class="media-content">
            <h2 class="title is-5">Print production planner</h2>
            <h3 class="subtitle is-6 company">Wood Inc</h3>
          </div>
        </div>
    
        <div class="content">
          <p class="location">
            Port Jeremy, AA
          </p>
          <p class="is-small has-text-grey">
            <time datetime="2021-04-08">2021-04-08</time>
          </p>
        </div>
        <footer class="card-footer">
            <a href="https://www.realpython.com" target="_blank" class="card-footer-item">Learn</a>
            <a href="https://realpython.github.io/fake-jobs/jobs/print-production-planner-73.html" target="_blank" class="card-footer-item">Apply</a>
        </footer>
      </div>
    </div>
    </div>
    <div class="column is-half">
    <div class="card">
      <div class="card-content">
        <div class="media">
          <div class="media-left">
            <figure class="image is-48x48">
              <img src="https://files.realpython.com/media/real-python-logo-thumbnail.7f0db70c2ed2.jpg?__no_cf_polish=1" alt="Real Python Logo">
            </figure>
          </div>
          <div class="media-content">
            <h2 class="title is-5">Systems developer</h2>
            <h3 class="subtitle is-6 company">Collins Group</h3>
          </div>
        </div>
    
        <div class="content">
          <p class="location">
            New Elizabethtown, AA
          </p>
          <p class="is-small has-text-grey">
            <time datetime="2021-04-08">2021-04-08</time>
          </p>
        </div>
        <footer class="card-footer">
            <a href="https://www.realpython.com" target="_blank" class="card-footer-item">Learn</a>
            <a href="https://realpython.github.io/fake-jobs/jobs/systems-developer-74.html" target="_blank" class="card-footer-item">Apply</a>
        </footer>
      </div>
    </div>
    </div>
    <div class="column is-half">
    <div class="card">
      <div class="card-content">
        <div class="media">
          <div class="media-left">
            <figure class="image is-48x48">
              <img src="https://files.realpython.com/media/real-python-logo-thumbnail.7f0db70c2ed2.jpg?__no_cf_polish=1" alt="Real Python Logo">
            </figure>
          </div>
          <div class="media-content">
            <h2 class="title is-5">Graphic designer</h2>
            <h3 class="subtitle is-6 company">Flores-Nelson</h3>
          </div>
        </div>
    
        <div class="content">
          <p class="location">
            Charlesstad, AE
          </p>
          <p class="is-small has-text-grey">
            <time datetime="2021-04-08">2021-04-08</time>
          </p>
        </div>
        <footer class="card-footer">
            <a href="https://www.realpython.com" target="_blank" class="card-footer-item">Learn</a>
            <a href="https://realpython.github.io/fake-jobs/jobs/graphic-designer-75.html" target="_blank" class="card-footer-item">Apply</a>
        </footer>
      </div>
    </div>
    </div>
    <div class="column is-half">
    <div class="card">
      <div class="card-content">
        <div class="media">
          <div class="media-left">
            <figure class="image is-48x48">
              <img src="https://files.realpython.com/media/real-python-logo-thumbnail.7f0db70c2ed2.jpg?__no_cf_polish=1" alt="Real Python Logo">
            </figure>
          </div>
          <div class="media-content">
            <h2 class="title is-5">Writer</h2>
            <h3 class="subtitle is-6 company">Mitchell, Jones and Olson</h3>
          </div>
        </div>
    
        <div class="content">
          <p class="location">
            Josephbury, AE
          </p>
          <p class="is-small has-text-grey">
            <time datetime="2021-04-08">2021-04-08</time>
          </p>
        </div>
        <footer class="card-footer">
            <a href="https://www.realpython.com" target="_blank" class="card-footer-item">Learn</a>
            <a href="https://realpython.github.io/fake-jobs/jobs/writer-76.html" target="_blank" class="card-footer-item">Apply</a>
        </footer>
      </div>
    </div>
    </div>
    <div class="column is-half">
    <div class="card">
      <div class="card-content">
        <div class="media">
          <div class="media-left">
            <figure class="image is-48x48">
              <img src="https://files.realpython.com/media/real-python-logo-thumbnail.7f0db70c2ed2.jpg?__no_cf_polish=1" alt="Real Python Logo">
            </figure>
          </div>
          <div class="media-content">
            <h2 class="title is-5">Field seismologist</h2>
            <h3 class="subtitle is-6 company">Howard Group</h3>
          </div>
        </div>
    
        <div class="content">
          <p class="location">
            Seanfurt, AA
          </p>
          <p class="is-small has-text-grey">
            <time datetime="2021-04-08">2021-04-08</time>
          </p>
        </div>
        <footer class="card-footer">
            <a href="https://www.realpython.com" target="_blank" class="card-footer-item">Learn</a>
            <a href="https://realpython.github.io/fake-jobs/jobs/field-seismologist-77.html" target="_blank" class="card-footer-item">Apply</a>
        </footer>
      </div>
    </div>
    </div>
    <div class="column is-half">
    <div class="card">
      <div class="card-content">
        <div class="media">
          <div class="media-left">
            <figure class="image is-48x48">
              <img src="https://files.realpython.com/media/real-python-logo-thumbnail.7f0db70c2ed2.jpg?__no_cf_polish=1" alt="Real Python Logo">
            </figure>
          </div>
          <div class="media-content">
            <h2 class="title is-5">Chief Strategy Officer</h2>
            <h3 class="subtitle is-6 company">Kramer-Edwards</h3>
          </div>
        </div>
    
        <div class="content">
          <p class="location">
            Williambury, AA
          </p>
          <p class="is-small has-text-grey">
            <time datetime="2021-04-08">2021-04-08</time>
          </p>
        </div>
        <footer class="card-footer">
            <a href="https://www.realpython.com" target="_blank" class="card-footer-item">Learn</a>
            <a href="https://realpython.github.io/fake-jobs/jobs/chief-strategy-officer-78.html" target="_blank" class="card-footer-item">Apply</a>
        </footer>
      </div>
    </div>
    </div>
    <div class="column is-half">
    <div class="card">
      <div class="card-content">
        <div class="media">
          <div class="media-left">
            <figure class="image is-48x48">
              <img src="https://files.realpython.com/media/real-python-logo-thumbnail.7f0db70c2ed2.jpg?__no_cf_polish=1" alt="Real Python Logo">
            </figure>
          </div>
          <div class="media-content">
            <h2 class="title is-5">Air cabin crew</h2>
            <h3 class="subtitle is-6 company">Berry-Houston</h3>
          </div>
        </div>
    
        <div class="content">
          <p class="location">
            South Jorgeside, AP
          </p>
          <p class="is-small has-text-grey">
            <time datetime="2021-04-08">2021-04-08</time>
          </p>
        </div>
        <footer class="card-footer">
            <a href="https://www.realpython.com" target="_blank" class="card-footer-item">Learn</a>
            <a href="https://realpython.github.io/fake-jobs/jobs/air-cabin-crew-79.html" target="_blank" class="card-footer-item">Apply</a>
        </footer>
      </div>
    </div>
    </div>
    <div class="column is-half">
    <div class="card">
      <div class="card-content">
        <div class="media">
          <div class="media-left">
            <figure class="image is-48x48">
              <img src="https://files.realpython.com/media/real-python-logo-thumbnail.7f0db70c2ed2.jpg?__no_cf_polish=1" alt="Real Python Logo">
            </figure>
          </div>
          <div class="media-content">
            <h2 class="title is-5">Python Programmer (Entry-Level)</h2>
            <h3 class="subtitle is-6 company">Mathews Inc</h3>
          </div>
        </div>
    
        <div class="content">
          <p class="location">
            Robertborough, AP
          </p>
          <p class="is-small has-text-grey">
            <time datetime="2021-04-08">2021-04-08</time>
          </p>
        </div>
        <footer class="card-footer">
            <a href="https://www.realpython.com" target="_blank" class="card-footer-item">Learn</a>
            <a href="https://realpython.github.io/fake-jobs/jobs/python-programmer-entry-level-80.html" target="_blank" class="card-footer-item">Apply</a>
        </footer>
      </div>
    </div>
    </div>
    <div class="column is-half">
    <div class="card">
      <div class="card-content">
        <div class="media">
          <div class="media-left">
            <figure class="image is-48x48">
              <img src="https://files.realpython.com/media/real-python-logo-thumbnail.7f0db70c2ed2.jpg?__no_cf_polish=1" alt="Real Python Logo">
            </figure>
          </div>
          <div class="media-content">
            <h2 class="title is-5">Warden/ranger</h2>
            <h3 class="subtitle is-6 company">Riley-Johnson</h3>
          </div>
        </div>
    
        <div class="content">
          <p class="location">
            South Saratown, AP
          </p>
          <p class="is-small has-text-grey">
            <time datetime="2021-04-08">2021-04-08</time>
          </p>
        </div>
        <footer class="card-footer">
            <a href="https://www.realpython.com" target="_blank" class="card-footer-item">Learn</a>
            <a href="https://realpython.github.io/fake-jobs/jobs/warden-ranger-81.html" target="_blank" class="card-footer-item">Apply</a>
        </footer>
      </div>
    </div>
    </div>
    <div class="column is-half">
    <div class="card">
      <div class="card-content">
        <div class="media">
          <div class="media-left">
            <figure class="image is-48x48">
              <img src="https://files.realpython.com/media/real-python-logo-thumbnail.7f0db70c2ed2.jpg?__no_cf_polish=1" alt="Real Python Logo">
            </figure>
          </div>
          <div class="media-content">
            <h2 class="title is-5">Sports therapist</h2>
            <h3 class="subtitle is-6 company">Spencer and Sons</h3>
          </div>
        </div>
    
        <div class="content">
          <p class="location">
            Hullview, AA
          </p>
          <p class="is-small has-text-grey">
            <time datetime="2021-04-08">2021-04-08</time>
          </p>
        </div>
        <footer class="card-footer">
            <a href="https://www.realpython.com" target="_blank" class="card-footer-item">Learn</a>
            <a href="https://realpython.github.io/fake-jobs/jobs/sports-therapist-82.html" target="_blank" class="card-footer-item">Apply</a>
        </footer>
      </div>
    </div>
    </div>
    <div class="column is-half">
    <div class="card">
      <div class="card-content">
        <div class="media">
          <div class="media-left">
            <figure class="image is-48x48">
              <img src="https://files.realpython.com/media/real-python-logo-thumbnail.7f0db70c2ed2.jpg?__no_cf_polish=1" alt="Real Python Logo">
            </figure>
          </div>
          <div class="media-content">
            <h2 class="title is-5">Arts development officer</h2>
            <h3 class="subtitle is-6 company">Camacho-Sanchez</h3>
          </div>
        </div>
    
        <div class="content">
          <p class="location">
            Philipland, AP
          </p>
          <p class="is-small has-text-grey">
            <time datetime="2021-04-08">2021-04-08</time>
          </p>
        </div>
        <footer class="card-footer">
            <a href="https://www.realpython.com" target="_blank" class="card-footer-item">Learn</a>
            <a href="https://realpython.github.io/fake-jobs/jobs/arts-development-officer-83.html" target="_blank" class="card-footer-item">Apply</a>
        </footer>
      </div>
    </div>
    </div>
    <div class="column is-half">
    <div class="card">
      <div class="card-content">
        <div class="media">
          <div class="media-left">
            <figure class="image is-48x48">
              <img src="https://files.realpython.com/media/real-python-logo-thumbnail.7f0db70c2ed2.jpg?__no_cf_polish=1" alt="Real Python Logo">
            </figure>
          </div>
          <div class="media-content">
            <h2 class="title is-5">Printmaker</h2>
            <h3 class="subtitle is-6 company">Oliver and Sons</h3>
          </div>
        </div>
    
        <div class="content">
          <p class="location">
            North Patty, AE
          </p>
          <p class="is-small has-text-grey">
            <time datetime="2021-04-08">2021-04-08</time>
          </p>
        </div>
        <footer class="card-footer">
            <a href="https://www.realpython.com" target="_blank" class="card-footer-item">Learn</a>
            <a href="https://realpython.github.io/fake-jobs/jobs/printmaker-84.html" target="_blank" class="card-footer-item">Apply</a>
        </footer>
      </div>
    </div>
    </div>
    <div class="column is-half">
    <div class="card">
      <div class="card-content">
        <div class="media">
          <div class="media-left">
            <figure class="image is-48x48">
              <img src="https://files.realpython.com/media/real-python-logo-thumbnail.7f0db70c2ed2.jpg?__no_cf_polish=1" alt="Real Python Logo">
            </figure>
          </div>
          <div class="media-content">
            <h2 class="title is-5">Health and safety adviser</h2>
            <h3 class="subtitle is-6 company">Eaton PLC</h3>
          </div>
        </div>
    
        <div class="content">
          <p class="location">
            North Stephen, AE
          </p>
          <p class="is-small has-text-grey">
            <time datetime="2021-04-08">2021-04-08</time>
          </p>
        </div>
        <footer class="card-footer">
            <a href="https://www.realpython.com" target="_blank" class="card-footer-item">Learn</a>
            <a href="https://realpython.github.io/fake-jobs/jobs/health-and-safety-adviser-85.html" target="_blank" class="card-footer-item">Apply</a>
        </footer>
      </div>
    </div>
    </div>
    <div class="column is-half">
    <div class="card">
      <div class="card-content">
        <div class="media">
          <div class="media-left">
            <figure class="image is-48x48">
              <img src="https://files.realpython.com/media/real-python-logo-thumbnail.7f0db70c2ed2.jpg?__no_cf_polish=1" alt="Real Python Logo">
            </figure>
          </div>
          <div class="media-content">
            <h2 class="title is-5">Manufacturing systems engineer</h2>
            <h3 class="subtitle is-6 company">Stanley-Frederick</h3>
          </div>
        </div>
    
        <div class="content">
          <p class="location">
            Stevensland, AP
          </p>
          <p class="is-small has-text-grey">
            <time datetime="2021-04-08">2021-04-08</time>
          </p>
        </div>
        <footer class="card-footer">
            <a href="https://www.realpython.com" target="_blank" class="card-footer-item">Learn</a>
            <a href="https://realpython.github.io/fake-jobs/jobs/manufacturing-systems-engineer-86.html" target="_blank" class="card-footer-item">Apply</a>
        </footer>
      </div>
    </div>
    </div>
    <div class="column is-half">
    <div class="card">
      <div class="card-content">
        <div class="media">
          <div class="media-left">
            <figure class="image is-48x48">
              <img src="https://files.realpython.com/media/real-python-logo-thumbnail.7f0db70c2ed2.jpg?__no_cf_polish=1" alt="Real Python Logo">
            </figure>
          </div>
          <div class="media-content">
            <h2 class="title is-5">Programmer, applications</h2>
            <h3 class="subtitle is-6 company">Bradley LLC</h3>
          </div>
        </div>
    
        <div class="content">
          <p class="location">
            Reyesstad, AE
          </p>
          <p class="is-small has-text-grey">
            <time datetime="2021-04-08">2021-04-08</time>
          </p>
        </div>
        <footer class="card-footer">
            <a href="https://www.realpython.com" target="_blank" class="card-footer-item">Learn</a>
            <a href="https://realpython.github.io/fake-jobs/jobs/programmer-applications-87.html" target="_blank" class="card-footer-item">Apply</a>
        </footer>
      </div>
    </div>
    </div>
    <div class="column is-half">
    <div class="card">
      <div class="card-content">
        <div class="media">
          <div class="media-left">
            <figure class="image is-48x48">
              <img src="https://files.realpython.com/media/real-python-logo-thumbnail.7f0db70c2ed2.jpg?__no_cf_polish=1" alt="Real Python Logo">
            </figure>
          </div>
          <div class="media-content">
            <h2 class="title is-5">Medical physicist</h2>
            <h3 class="subtitle is-6 company">Parker, Goodwin and Zavala</h3>
          </div>
        </div>
    
        <div class="content">
          <p class="location">
            Bellberg, AP
          </p>
          <p class="is-small has-text-grey">
            <time datetime="2021-04-08">2021-04-08</time>
          </p>
        </div>
        <footer class="card-footer">
            <a href="https://www.realpython.com" target="_blank" class="card-footer-item">Learn</a>
            <a href="https://realpython.github.io/fake-jobs/jobs/medical-physicist-88.html" target="_blank" class="card-footer-item">Apply</a>
        </footer>
      </div>
    </div>
    </div>
    <div class="column is-half">
    <div class="card">
      <div class="card-content">
        <div class="media">
          <div class="media-left">
            <figure class="image is-48x48">
              <img src="https://files.realpython.com/media/real-python-logo-thumbnail.7f0db70c2ed2.jpg?__no_cf_polish=1" alt="Real Python Logo">
            </figure>
          </div>
          <div class="media-content">
            <h2 class="title is-5">Media planner</h2>
            <h3 class="subtitle is-6 company">Kim-Miles</h3>
          </div>
        </div>
    
        <div class="content">
          <p class="location">
            North Johnland, AE
          </p>
          <p class="is-small has-text-grey">
            <time datetime="2021-04-08">2021-04-08</time>
          </p>
        </div>
        <footer class="card-footer">
            <a href="https://www.realpython.com" target="_blank" class="card-footer-item">Learn</a>
            <a href="https://realpython.github.io/fake-jobs/jobs/media-planner-89.html" target="_blank" class="card-footer-item">Apply</a>
        </footer>
      </div>
    </div>
    </div>
    <div class="column is-half">
    <div class="card">
      <div class="card-content">
        <div class="media">
          <div class="media-left">
            <figure class="image is-48x48">
              <img src="https://files.realpython.com/media/real-python-logo-thumbnail.7f0db70c2ed2.jpg?__no_cf_polish=1" alt="Real Python Logo">
            </figure>
          </div>
          <div class="media-content">
            <h2 class="title is-5">Software Developer (Python)</h2>
            <h3 class="subtitle is-6 company">Moreno-Rodriguez</h3>
          </div>
        </div>
    
        <div class="content">
          <p class="location">
            Martinezburgh, AE
          </p>
          <p class="is-small has-text-grey">
            <time datetime="2021-04-08">2021-04-08</time>
          </p>
        </div>
        <footer class="card-footer">
            <a href="https://www.realpython.com" target="_blank" class="card-footer-item">Learn</a>
            <a href="https://realpython.github.io/fake-jobs/jobs/software-developer-python-90.html" target="_blank" class="card-footer-item">Apply</a>
        </footer>
      </div>
    </div>
    </div>
    <div class="column is-half">
    <div class="card">
      <div class="card-content">
        <div class="media">
          <div class="media-left">
            <figure class="image is-48x48">
              <img src="https://files.realpython.com/media/real-python-logo-thumbnail.7f0db70c2ed2.jpg?__no_cf_polish=1" alt="Real Python Logo">
            </figure>
          </div>
          <div class="media-content">
            <h2 class="title is-5">Surveyor, land/geomatics</h2>
            <h3 class="subtitle is-6 company">Brown-Ortiz</h3>
          </div>
        </div>
    
        <div class="content">
          <p class="location">
            Joshuatown, AE
          </p>
          <p class="is-small has-text-grey">
            <time datetime="2021-04-08">2021-04-08</time>
          </p>
        </div>
        <footer class="card-footer">
            <a href="https://www.realpython.com" target="_blank" class="card-footer-item">Learn</a>
            <a href="https://realpython.github.io/fake-jobs/jobs/surveyor-land-geomatics-91.html" target="_blank" class="card-footer-item">Apply</a>
        </footer>
      </div>
    </div>
    </div>
    <div class="column is-half">
    <div class="card">
      <div class="card-content">
        <div class="media">
          <div class="media-left">
            <figure class="image is-48x48">
              <img src="https://files.realpython.com/media/real-python-logo-thumbnail.7f0db70c2ed2.jpg?__no_cf_polish=1" alt="Real Python Logo">
            </figure>
          </div>
          <div class="media-content">
            <h2 class="title is-5">Legal executive</h2>
            <h3 class="subtitle is-6 company">Hartman PLC</h3>
          </div>
        </div>
    
        <div class="content">
          <p class="location">
            West Ericstad, AA
          </p>
          <p class="is-small has-text-grey">
            <time datetime="2021-04-08">2021-04-08</time>
          </p>
        </div>
        <footer class="card-footer">
            <a href="https://www.realpython.com" target="_blank" class="card-footer-item">Learn</a>
            <a href="https://realpython.github.io/fake-jobs/jobs/legal-executive-92.html" target="_blank" class="card-footer-item">Apply</a>
        </footer>
      </div>
    </div>
    </div>
    <div class="column is-half">
    <div class="card">
      <div class="card-content">
        <div class="media">
          <div class="media-left">
            <figure class="image is-48x48">
              <img src="https://files.realpython.com/media/real-python-logo-thumbnail.7f0db70c2ed2.jpg?__no_cf_polish=1" alt="Real Python Logo">
            </figure>
          </div>
          <div class="media-content">
            <h2 class="title is-5">Librarian, academic</h2>
            <h3 class="subtitle is-6 company">Brooks Inc</h3>
          </div>
        </div>
    
        <div class="content">
          <p class="location">
            Tuckertown, AE
          </p>
          <p class="is-small has-text-grey">
            <time datetime="2021-04-08">2021-04-08</time>
          </p>
        </div>
        <footer class="card-footer">
            <a href="https://www.realpython.com" target="_blank" class="card-footer-item">Learn</a>
            <a href="https://realpython.github.io/fake-jobs/jobs/librarian-academic-93.html" target="_blank" class="card-footer-item">Apply</a>
        </footer>
      </div>
    </div>
    </div>
    <div class="column is-half">
    <div class="card">
      <div class="card-content">
        <div class="media">
          <div class="media-left">
            <figure class="image is-48x48">
              <img src="https://files.realpython.com/media/real-python-logo-thumbnail.7f0db70c2ed2.jpg?__no_cf_polish=1" alt="Real Python Logo">
            </figure>
          </div>
          <div class="media-content">
            <h2 class="title is-5">Barrister</h2>
            <h3 class="subtitle is-6 company">Washington-Castillo</h3>
          </div>
        </div>
    
        <div class="content">
          <p class="location">
            Perezton, AE
          </p>
          <p class="is-small has-text-grey">
            <time datetime="2021-04-08">2021-04-08</time>
          </p>
        </div>
        <footer class="card-footer">
            <a href="https://www.realpython.com" target="_blank" class="card-footer-item">Learn</a>
            <a href="https://realpython.github.io/fake-jobs/jobs/barrister-94.html" target="_blank" class="card-footer-item">Apply</a>
        </footer>
      </div>
    </div>
    </div>
    <div class="column is-half">
    <div class="card">
      <div class="card-content">
        <div class="media">
          <div class="media-left">
            <figure class="image is-48x48">
              <img src="https://files.realpython.com/media/real-python-logo-thumbnail.7f0db70c2ed2.jpg?__no_cf_polish=1" alt="Real Python Logo">
            </figure>
          </div>
          <div class="media-content">
            <h2 class="title is-5">Museum/gallery exhibitions officer</h2>
            <h3 class="subtitle is-6 company">Nguyen, Yoder and Petty</h3>
          </div>
        </div>
    
        <div class="content">
          <p class="location">
            Lake Abigail, AE
          </p>
          <p class="is-small has-text-grey">
            <time datetime="2021-04-08">2021-04-08</time>
          </p>
        </div>
        <footer class="card-footer">
            <a href="https://www.realpython.com" target="_blank" class="card-footer-item">Learn</a>
            <a href="https://realpython.github.io/fake-jobs/jobs/museum-gallery-exhibitions-officer-95.html" target="_blank" class="card-footer-item">Apply</a>
        </footer>
      </div>
    </div>
    </div>
    <div class="column is-half">
    <div class="card">
      <div class="card-content">
        <div class="media">
          <div class="media-left">
            <figure class="image is-48x48">
              <img src="https://files.realpython.com/media/real-python-logo-thumbnail.7f0db70c2ed2.jpg?__no_cf_polish=1" alt="Real Python Logo">
            </figure>
          </div>
          <div class="media-content">
            <h2 class="title is-5">Radiographer, diagnostic</h2>
            <h3 class="subtitle is-6 company">Holder LLC</h3>
          </div>
        </div>
    
        <div class="content">
          <p class="location">
            Jacobshire, AP
          </p>
          <p class="is-small has-text-grey">
            <time datetime="2021-04-08">2021-04-08</time>
          </p>
        </div>
        <footer class="card-footer">
            <a href="https://www.realpython.com" target="_blank" class="card-footer-item">Learn</a>
            <a href="https://realpython.github.io/fake-jobs/jobs/radiographer-diagnostic-96.html" target="_blank" class="card-footer-item">Apply</a>
        </footer>
      </div>
    </div>
    </div>
    <div class="column is-half">
    <div class="card">
      <div class="card-content">
        <div class="media">
          <div class="media-left">
            <figure class="image is-48x48">
              <img src="https://files.realpython.com/media/real-python-logo-thumbnail.7f0db70c2ed2.jpg?__no_cf_polish=1" alt="Real Python Logo">
            </figure>
          </div>
          <div class="media-content">
            <h2 class="title is-5">Database administrator</h2>
            <h3 class="subtitle is-6 company">Yates-Ferguson</h3>
          </div>
        </div>
    
        <div class="content">
          <p class="location">
            Port Susan, AE
          </p>
          <p class="is-small has-text-grey">
            <time datetime="2021-04-08">2021-04-08</time>
          </p>
        </div>
        <footer class="card-footer">
            <a href="https://www.realpython.com" target="_blank" class="card-footer-item">Learn</a>
            <a href="https://realpython.github.io/fake-jobs/jobs/database-administrator-97.html" target="_blank" class="card-footer-item">Apply</a>
        </footer>
      </div>
    </div>
    </div>
    <div class="column is-half">
    <div class="card">
      <div class="card-content">
        <div class="media">
          <div class="media-left">
            <figure class="image is-48x48">
              <img src="https://files.realpython.com/media/real-python-logo-thumbnail.7f0db70c2ed2.jpg?__no_cf_polish=1" alt="Real Python Logo">
            </figure>
          </div>
          <div class="media-content">
            <h2 class="title is-5">Furniture designer</h2>
            <h3 class="subtitle is-6 company">Ortega-Lawrence</h3>
          </div>
        </div>
    
        <div class="content">
          <p class="location">
            North Tiffany, AA
          </p>
          <p class="is-small has-text-grey">
            <time datetime="2021-04-08">2021-04-08</time>
          </p>
        </div>
        <footer class="card-footer">
            <a href="https://www.realpython.com" target="_blank" class="card-footer-item">Learn</a>
            <a href="https://realpython.github.io/fake-jobs/jobs/furniture-designer-98.html" target="_blank" class="card-footer-item">Apply</a>
        </footer>
      </div>
    </div>
    </div>
    <div class="column is-half">
    <div class="card">
      <div class="card-content">
        <div class="media">
          <div class="media-left">
            <figure class="image is-48x48">
              <img src="https://files.realpython.com/media/real-python-logo-thumbnail.7f0db70c2ed2.jpg?__no_cf_polish=1" alt="Real Python Logo">
            </figure>
          </div>
          <div class="media-content">
            <h2 class="title is-5">Ship broker</h2>
            <h3 class="subtitle is-6 company">Fuentes, Walls and Castro</h3>
          </div>
        </div>
    
        <div class="content">
          <p class="location">
            Michelleville, AP
          </p>
          <p class="is-small has-text-grey">
            <time datetime="2021-04-08">2021-04-08</time>
          </p>
        </div>
        <footer class="card-footer">
            <a href="https://www.realpython.com" target="_blank" class="card-footer-item">Learn</a>
            <a href="https://realpython.github.io/fake-jobs/jobs/ship-broker-99.html" target="_blank" class="card-footer-item">Apply</a>
        </footer>
      </div>
    </div>
    </div>
    
        </div>
        </div>
      </section>
      </body>
    </html>
    



```python
from bs4 import BeautifulSoup

# Give the HTML to bs4 to parse
soup = BeautifulSoup(site.text, 'html.parser')
```

Let's go through some essential functions:

## Find Elements by ID


In HTML, the `id` attribute is used to assign a unique identifier to an HTML element, no two elements should have the same `id` value in a single page.

If you inspect the webpage, you can find the HTML object that contains all the job postings. Notice the 

``` <div id="ResultsContainer" class="columns is-multiline">```

![Image](webscraping_pngs/ID.png)


```python
# find the ResultsContainer id
ids = soup.find(id="ResultsContainer")
```

If you call .prettify() on the ids variable, then you’ll see all the HTML contained within the div element, in a formatted and readable way (as opposed to ids.text).


```python
print(ids.prettify())
```

    <div class="columns is-multiline" id="ResultsContainer">
     <div class="column is-half">
      <div class="card">
       <div class="card-content">
        <div class="media">
         <div class="media-left">
          <figure class="image is-48x48">
           <img alt="Real Python Logo" src="https://files.realpython.com/media/real-python-logo-thumbnail.7f0db70c2ed2.jpg?__no_cf_polish=1"/>
          </figure>
         </div>
         <div class="media-content">
          <h2 class="title is-5">
           Senior Python Developer
          </h2>
          <h3 class="subtitle is-6 company">
           Payne, Roberts and Davis
          </h3>
         </div>
        </div>
        <div class="content">
         <p class="location">
          Stewartbury, AA
         </p>
         <p class="is-small has-text-grey">
          <time datetime="2021-04-08">
           2021-04-08
          </time>
         </p>
        </div>
        <footer class="card-footer">
         <a class="card-footer-item" href="https://www.realpython.com" target="_blank">
          Learn
         </a>
         <a class="card-footer-item" href="https://realpython.github.io/fake-jobs/jobs/senior-python-developer-0.html" target="_blank">
          Apply
         </a>
        </footer>
       </div>
      </div>
     </div>
     <div class="column is-half">
      <div class="card">
       <div class="card-content">
        <div class="media">
         <div class="media-left">
          <figure class="image is-48x48">
           <img alt="Real Python Logo" src="https://files.realpython.com/media/real-python-logo-thumbnail.7f0db70c2ed2.jpg?__no_cf_polish=1"/>
          </figure>
         </div>
         <div class="media-content">
          <h2 class="title is-5">
           Energy engineer
          </h2>
          <h3 class="subtitle is-6 company">
           Vasquez-Davidson
          </h3>
         </div>
        </div>
        <div class="content">
         <p class="location">
          Christopherville, AA
         </p>
         <p class="is-small has-text-grey">
          <time datetime="2021-04-08">
           2021-04-08
          </time>
         </p>
        </div>
        <footer class="card-footer">
         <a class="card-footer-item" href="https://www.realpython.com" target="_blank">
          Learn
         </a>
         <a class="card-footer-item" href="https://realpython.github.io/fake-jobs/jobs/energy-engineer-1.html" target="_blank">
          Apply
         </a>
        </footer>
       </div>
      </div>
     </div>
     <div class="column is-half">
      <div class="card">
       <div class="card-content">
        <div class="media">
         <div class="media-left">
          <figure class="image is-48x48">
           <img alt="Real Python Logo" src="https://files.realpython.com/media/real-python-logo-thumbnail.7f0db70c2ed2.jpg?__no_cf_polish=1"/>
          </figure>
         </div>
         <div class="media-content">
          <h2 class="title is-5">
           Legal executive
          </h2>
          <h3 class="subtitle is-6 company">
           Jackson, Chambers and Levy
          </h3>
         </div>
        </div>
        <div class="content">
         <p class="location">
          Port Ericaburgh, AA
         </p>
         <p class="is-small has-text-grey">
          <time datetime="2021-04-08">
           2021-04-08
          </time>
         </p>
        </div>
        <footer class="card-footer">
         <a class="card-footer-item" href="https://www.realpython.com" target="_blank">
          Learn
         </a>
         <a class="card-footer-item" href="https://realpython.github.io/fake-jobs/jobs/legal-executive-2.html" target="_blank">
          Apply
         </a>
        </footer>
       </div>
      </div>
     </div>
     <div class="column is-half">
      <div class="card">
       <div class="card-content">
        <div class="media">
         <div class="media-left">
          <figure class="image is-48x48">
           <img alt="Real Python Logo" src="https://files.realpython.com/media/real-python-logo-thumbnail.7f0db70c2ed2.jpg?__no_cf_polish=1"/>
          </figure>
         </div>
         <div class="media-content">
          <h2 class="title is-5">
           Fitness centre manager
          </h2>
          <h3 class="subtitle is-6 company">
           Savage-Bradley
          </h3>
         </div>
        </div>
        <div class="content">
         <p class="location">
          East Seanview, AP
         </p>
         <p class="is-small has-text-grey">
          <time datetime="2021-04-08">
           2021-04-08
          </time>
         </p>
        </div>
        <footer class="card-footer">
         <a class="card-footer-item" href="https://www.realpython.com" target="_blank">
          Learn
         </a>
         <a class="card-footer-item" href="https://realpython.github.io/fake-jobs/jobs/fitness-centre-manager-3.html" target="_blank">
          Apply
         </a>
        </footer>
       </div>
      </div>
     </div>
     <div class="column is-half">
      <div class="card">
       <div class="card-content">
        <div class="media">
         <div class="media-left">
          <figure class="image is-48x48">
           <img alt="Real Python Logo" src="https://files.realpython.com/media/real-python-logo-thumbnail.7f0db70c2ed2.jpg?__no_cf_polish=1"/>
          </figure>
         </div>
         <div class="media-content">
          <h2 class="title is-5">
           Product manager
          </h2>
          <h3 class="subtitle is-6 company">
           Ramirez Inc
          </h3>
         </div>
        </div>
        <div class="content">
         <p class="location">
          North Jamieview, AP
         </p>
         <p class="is-small has-text-grey">
          <time datetime="2021-04-08">
           2021-04-08
          </time>
         </p>
        </div>
        <footer class="card-footer">
         <a class="card-footer-item" href="https://www.realpython.com" target="_blank">
          Learn
         </a>
         <a class="card-footer-item" href="https://realpython.github.io/fake-jobs/jobs/product-manager-4.html" target="_blank">
          Apply
         </a>
        </footer>
       </div>
      </div>
     </div>
     <div class="column is-half">
      <div class="card">
       <div class="card-content">
        <div class="media">
         <div class="media-left">
          <figure class="image is-48x48">
           <img alt="Real Python Logo" src="https://files.realpython.com/media/real-python-logo-thumbnail.7f0db70c2ed2.jpg?__no_cf_polish=1"/>
          </figure>
         </div>
         <div class="media-content">
          <h2 class="title is-5">
           Medical technical officer
          </h2>
          <h3 class="subtitle is-6 company">
           Rogers-Yates
          </h3>
         </div>
        </div>
        <div class="content">
         <p class="location">
          Davidville, AP
         </p>
         <p class="is-small has-text-grey">
          <time datetime="2021-04-08">
           2021-04-08
          </time>
         </p>
        </div>
        <footer class="card-footer">
         <a class="card-footer-item" href="https://www.realpython.com" target="_blank">
          Learn
         </a>
         <a class="card-footer-item" href="https://realpython.github.io/fake-jobs/jobs/medical-technical-officer-5.html" target="_blank">
          Apply
         </a>
        </footer>
       </div>
      </div>
     </div>
     <div class="column is-half">
      <div class="card">
       <div class="card-content">
        <div class="media">
         <div class="media-left">
          <figure class="image is-48x48">
           <img alt="Real Python Logo" src="https://files.realpython.com/media/real-python-logo-thumbnail.7f0db70c2ed2.jpg?__no_cf_polish=1"/>
          </figure>
         </div>
         <div class="media-content">
          <h2 class="title is-5">
           Physiological scientist
          </h2>
          <h3 class="subtitle is-6 company">
           Kramer-Klein
          </h3>
         </div>
        </div>
        <div class="content">
         <p class="location">
          South Christopher, AE
         </p>
         <p class="is-small has-text-grey">
          <time datetime="2021-04-08">
           2021-04-08
          </time>
         </p>
        </div>
        <footer class="card-footer">
         <a class="card-footer-item" href="https://www.realpython.com" target="_blank">
          Learn
         </a>
         <a class="card-footer-item" href="https://realpython.github.io/fake-jobs/jobs/physiological-scientist-6.html" target="_blank">
          Apply
         </a>
        </footer>
       </div>
      </div>
     </div>
     <div class="column is-half">
      <div class="card">
       <div class="card-content">
        <div class="media">
         <div class="media-left">
          <figure class="image is-48x48">
           <img alt="Real Python Logo" src="https://files.realpython.com/media/real-python-logo-thumbnail.7f0db70c2ed2.jpg?__no_cf_polish=1"/>
          </figure>
         </div>
         <div class="media-content">
          <h2 class="title is-5">
           Textile designer
          </h2>
          <h3 class="subtitle is-6 company">
           Meyers-Johnson
          </h3>
         </div>
        </div>
        <div class="content">
         <p class="location">
          Port Jonathan, AE
         </p>
         <p class="is-small has-text-grey">
          <time datetime="2021-04-08">
           2021-04-08
          </time>
         </p>
        </div>
        <footer class="card-footer">
         <a class="card-footer-item" href="https://www.realpython.com" target="_blank">
          Learn
         </a>
         <a class="card-footer-item" href="https://realpython.github.io/fake-jobs/jobs/textile-designer-7.html" target="_blank">
          Apply
         </a>
        </footer>
       </div>
      </div>
     </div>
     <div class="column is-half">
      <div class="card">
       <div class="card-content">
        <div class="media">
         <div class="media-left">
          <figure class="image is-48x48">
           <img alt="Real Python Logo" src="https://files.realpython.com/media/real-python-logo-thumbnail.7f0db70c2ed2.jpg?__no_cf_polish=1"/>
          </figure>
         </div>
         <div class="media-content">
          <h2 class="title is-5">
           Television floor manager
          </h2>
          <h3 class="subtitle is-6 company">
           Hughes-Williams
          </h3>
         </div>
        </div>
        <div class="content">
         <p class="location">
          Osbornetown, AE
         </p>
         <p class="is-small has-text-grey">
          <time datetime="2021-04-08">
           2021-04-08
          </time>
         </p>
        </div>
        <footer class="card-footer">
         <a class="card-footer-item" href="https://www.realpython.com" target="_blank">
          Learn
         </a>
         <a class="card-footer-item" href="https://realpython.github.io/fake-jobs/jobs/television-floor-manager-8.html" target="_blank">
          Apply
         </a>
        </footer>
       </div>
      </div>
     </div>
     <div class="column is-half">
      <div class="card">
       <div class="card-content">
        <div class="media">
         <div class="media-left">
          <figure class="image is-48x48">
           <img alt="Real Python Logo" src="https://files.realpython.com/media/real-python-logo-thumbnail.7f0db70c2ed2.jpg?__no_cf_polish=1"/>
          </figure>
         </div>
         <div class="media-content">
          <h2 class="title is-5">
           Waste management officer
          </h2>
          <h3 class="subtitle is-6 company">
           Jones, Williams and Villa
          </h3>
         </div>
        </div>
        <div class="content">
         <p class="location">
          Scotttown, AP
         </p>
         <p class="is-small has-text-grey">
          <time datetime="2021-04-08">
           2021-04-08
          </time>
         </p>
        </div>
        <footer class="card-footer">
         <a class="card-footer-item" href="https://www.realpython.com" target="_blank">
          Learn
         </a>
         <a class="card-footer-item" href="https://realpython.github.io/fake-jobs/jobs/waste-management-officer-9.html" target="_blank">
          Apply
         </a>
        </footer>
       </div>
      </div>
     </div>
     <div class="column is-half">
      <div class="card">
       <div class="card-content">
        <div class="media">
         <div class="media-left">
          <figure class="image is-48x48">
           <img alt="Real Python Logo" src="https://files.realpython.com/media/real-python-logo-thumbnail.7f0db70c2ed2.jpg?__no_cf_polish=1"/>
          </figure>
         </div>
         <div class="media-content">
          <h2 class="title is-5">
           Software Engineer (Python)
          </h2>
          <h3 class="subtitle is-6 company">
           Garcia PLC
          </h3>
         </div>
        </div>
        <div class="content">
         <p class="location">
          Ericberg, AE
         </p>
         <p class="is-small has-text-grey">
          <time datetime="2021-04-08">
           2021-04-08
          </time>
         </p>
        </div>
        <footer class="card-footer">
         <a class="card-footer-item" href="https://www.realpython.com" target="_blank">
          Learn
         </a>
         <a class="card-footer-item" href="https://realpython.github.io/fake-jobs/jobs/software-engineer-python-10.html" target="_blank">
          Apply
         </a>
        </footer>
       </div>
      </div>
     </div>
     <div class="column is-half">
      <div class="card">
       <div class="card-content">
        <div class="media">
         <div class="media-left">
          <figure class="image is-48x48">
           <img alt="Real Python Logo" src="https://files.realpython.com/media/real-python-logo-thumbnail.7f0db70c2ed2.jpg?__no_cf_polish=1"/>
          </figure>
         </div>
         <div class="media-content">
          <h2 class="title is-5">
           Interpreter
          </h2>
          <h3 class="subtitle is-6 company">
           Gregory and Sons
          </h3>
         </div>
        </div>
        <div class="content">
         <p class="location">
          Ramireztown, AE
         </p>
         <p class="is-small has-text-grey">
          <time datetime="2021-04-08">
           2021-04-08
          </time>
         </p>
        </div>
        <footer class="card-footer">
         <a class="card-footer-item" href="https://www.realpython.com" target="_blank">
          Learn
         </a>
         <a class="card-footer-item" href="https://realpython.github.io/fake-jobs/jobs/interpreter-11.html" target="_blank">
          Apply
         </a>
        </footer>
       </div>
      </div>
     </div>
     <div class="column is-half">
      <div class="card">
       <div class="card-content">
        <div class="media">
         <div class="media-left">
          <figure class="image is-48x48">
           <img alt="Real Python Logo" src="https://files.realpython.com/media/real-python-logo-thumbnail.7f0db70c2ed2.jpg?__no_cf_polish=1"/>
          </figure>
         </div>
         <div class="media-content">
          <h2 class="title is-5">
           Architect
          </h2>
          <h3 class="subtitle is-6 company">
           Clark, Garcia and Sosa
          </h3>
         </div>
        </div>
        <div class="content">
         <p class="location">
          Figueroaview, AA
         </p>
         <p class="is-small has-text-grey">
          <time datetime="2021-04-08">
           2021-04-08
          </time>
         </p>
        </div>
        <footer class="card-footer">
         <a class="card-footer-item" href="https://www.realpython.com" target="_blank">
          Learn
         </a>
         <a class="card-footer-item" href="https://realpython.github.io/fake-jobs/jobs/architect-12.html" target="_blank">
          Apply
         </a>
        </footer>
       </div>
      </div>
     </div>
     <div class="column is-half">
      <div class="card">
       <div class="card-content">
        <div class="media">
         <div class="media-left">
          <figure class="image is-48x48">
           <img alt="Real Python Logo" src="https://files.realpython.com/media/real-python-logo-thumbnail.7f0db70c2ed2.jpg?__no_cf_polish=1"/>
          </figure>
         </div>
         <div class="media-content">
          <h2 class="title is-5">
           Meteorologist
          </h2>
          <h3 class="subtitle is-6 company">
           Bush PLC
          </h3>
         </div>
        </div>
        <div class="content">
         <p class="location">
          Kelseystad, AA
         </p>
         <p class="is-small has-text-grey">
          <time datetime="2021-04-08">
           2021-04-08
          </time>
         </p>
        </div>
        <footer class="card-footer">
         <a class="card-footer-item" href="https://www.realpython.com" target="_blank">
          Learn
         </a>
         <a class="card-footer-item" href="https://realpython.github.io/fake-jobs/jobs/meteorologist-13.html" target="_blank">
          Apply
         </a>
        </footer>
       </div>
      </div>
     </div>
     <div class="column is-half">
      <div class="card">
       <div class="card-content">
        <div class="media">
         <div class="media-left">
          <figure class="image is-48x48">
           <img alt="Real Python Logo" src="https://files.realpython.com/media/real-python-logo-thumbnail.7f0db70c2ed2.jpg?__no_cf_polish=1"/>
          </figure>
         </div>
         <div class="media-content">
          <h2 class="title is-5">
           Audiological scientist
          </h2>
          <h3 class="subtitle is-6 company">
           Salazar-Meyers
          </h3>
         </div>
        </div>
        <div class="content">
         <p class="location">
          Williamsburgh, AE
         </p>
         <p class="is-small has-text-grey">
          <time datetime="2021-04-08">
           2021-04-08
          </time>
         </p>
        </div>
        <footer class="card-footer">
         <a class="card-footer-item" href="https://www.realpython.com" target="_blank">
          Learn
         </a>
         <a class="card-footer-item" href="https://realpython.github.io/fake-jobs/jobs/audiological-scientist-14.html" target="_blank">
          Apply
         </a>
        </footer>
       </div>
      </div>
     </div>
     <div class="column is-half">
      <div class="card">
       <div class="card-content">
        <div class="media">
         <div class="media-left">
          <figure class="image is-48x48">
           <img alt="Real Python Logo" src="https://files.realpython.com/media/real-python-logo-thumbnail.7f0db70c2ed2.jpg?__no_cf_polish=1"/>
          </figure>
         </div>
         <div class="media-content">
          <h2 class="title is-5">
           English as a second language teacher
          </h2>
          <h3 class="subtitle is-6 company">
           Parker, Murphy and Brooks
          </h3>
         </div>
        </div>
        <div class="content">
         <p class="location">
          Mitchellburgh, AE
         </p>
         <p class="is-small has-text-grey">
          <time datetime="2021-04-08">
           2021-04-08
          </time>
         </p>
        </div>
        <footer class="card-footer">
         <a class="card-footer-item" href="https://www.realpython.com" target="_blank">
          Learn
         </a>
         <a class="card-footer-item" href="https://realpython.github.io/fake-jobs/jobs/english-as-a-second-language-teacher-15.html" target="_blank">
          Apply
         </a>
        </footer>
       </div>
      </div>
     </div>
     <div class="column is-half">
      <div class="card">
       <div class="card-content">
        <div class="media">
         <div class="media-left">
          <figure class="image is-48x48">
           <img alt="Real Python Logo" src="https://files.realpython.com/media/real-python-logo-thumbnail.7f0db70c2ed2.jpg?__no_cf_polish=1"/>
          </figure>
         </div>
         <div class="media-content">
          <h2 class="title is-5">
           Surgeon
          </h2>
          <h3 class="subtitle is-6 company">
           Cruz-Brown
          </h3>
         </div>
        </div>
        <div class="content">
         <p class="location">
          West Jessicabury, AA
         </p>
         <p class="is-small has-text-grey">
          <time datetime="2021-04-08">
           2021-04-08
          </time>
         </p>
        </div>
        <footer class="card-footer">
         <a class="card-footer-item" href="https://www.realpython.com" target="_blank">
          Learn
         </a>
         <a class="card-footer-item" href="https://realpython.github.io/fake-jobs/jobs/surgeon-16.html" target="_blank">
          Apply
         </a>
        </footer>
       </div>
      </div>
     </div>
     <div class="column is-half">
      <div class="card">
       <div class="card-content">
        <div class="media">
         <div class="media-left">
          <figure class="image is-48x48">
           <img alt="Real Python Logo" src="https://files.realpython.com/media/real-python-logo-thumbnail.7f0db70c2ed2.jpg?__no_cf_polish=1"/>
          </figure>
         </div>
         <div class="media-content">
          <h2 class="title is-5">
           Equities trader
          </h2>
          <h3 class="subtitle is-6 company">
           Macdonald-Ferguson
          </h3>
         </div>
        </div>
        <div class="content">
         <p class="location">
          Maloneshire, AE
         </p>
         <p class="is-small has-text-grey">
          <time datetime="2021-04-08">
           2021-04-08
          </time>
         </p>
        </div>
        <footer class="card-footer">
         <a class="card-footer-item" href="https://www.realpython.com" target="_blank">
          Learn
         </a>
         <a class="card-footer-item" href="https://realpython.github.io/fake-jobs/jobs/equities-trader-17.html" target="_blank">
          Apply
         </a>
        </footer>
       </div>
      </div>
     </div>
     <div class="column is-half">
      <div class="card">
       <div class="card-content">
        <div class="media">
         <div class="media-left">
          <figure class="image is-48x48">
           <img alt="Real Python Logo" src="https://files.realpython.com/media/real-python-logo-thumbnail.7f0db70c2ed2.jpg?__no_cf_polish=1"/>
          </figure>
         </div>
         <div class="media-content">
          <h2 class="title is-5">
           Newspaper journalist
          </h2>
          <h3 class="subtitle is-6 company">
           Williams, Peterson and Rojas
          </h3>
         </div>
        </div>
        <div class="content">
         <p class="location">
          Johnsonton, AA
         </p>
         <p class="is-small has-text-grey">
          <time datetime="2021-04-08">
           2021-04-08
          </time>
         </p>
        </div>
        <footer class="card-footer">
         <a class="card-footer-item" href="https://www.realpython.com" target="_blank">
          Learn
         </a>
         <a class="card-footer-item" href="https://realpython.github.io/fake-jobs/jobs/newspaper-journalist-18.html" target="_blank">
          Apply
         </a>
        </footer>
       </div>
      </div>
     </div>
     <div class="column is-half">
      <div class="card">
       <div class="card-content">
        <div class="media">
         <div class="media-left">
          <figure class="image is-48x48">
           <img alt="Real Python Logo" src="https://files.realpython.com/media/real-python-logo-thumbnail.7f0db70c2ed2.jpg?__no_cf_polish=1"/>
          </figure>
         </div>
         <div class="media-content">
          <h2 class="title is-5">
           Materials engineer
          </h2>
          <h3 class="subtitle is-6 company">
           Smith and Sons
          </h3>
         </div>
        </div>
        <div class="content">
         <p class="location">
          South Davidtown, AP
         </p>
         <p class="is-small has-text-grey">
          <time datetime="2021-04-08">
           2021-04-08
          </time>
         </p>
        </div>
        <footer class="card-footer">
         <a class="card-footer-item" href="https://www.realpython.com" target="_blank">
          Learn
         </a>
         <a class="card-footer-item" href="https://realpython.github.io/fake-jobs/jobs/materials-engineer-19.html" target="_blank">
          Apply
         </a>
        </footer>
       </div>
      </div>
     </div>
     <div class="column is-half">
      <div class="card">
       <div class="card-content">
        <div class="media">
         <div class="media-left">
          <figure class="image is-48x48">
           <img alt="Real Python Logo" src="https://files.realpython.com/media/real-python-logo-thumbnail.7f0db70c2ed2.jpg?__no_cf_polish=1"/>
          </figure>
         </div>
         <div class="media-content">
          <h2 class="title is-5">
           Python Programmer (Entry-Level)
          </h2>
          <h3 class="subtitle is-6 company">
           Moss, Duncan and Allen
          </h3>
         </div>
        </div>
        <div class="content">
         <p class="location">
          Port Sara, AE
         </p>
         <p class="is-small has-text-grey">
          <time datetime="2021-04-08">
           2021-04-08
          </time>
         </p>
        </div>
        <footer class="card-footer">
         <a class="card-footer-item" href="https://www.realpython.com" target="_blank">
          Learn
         </a>
         <a class="card-footer-item" href="https://realpython.github.io/fake-jobs/jobs/python-programmer-entry-level-20.html" target="_blank">
          Apply
         </a>
        </footer>
       </div>
      </div>
     </div>
     <div class="column is-half">
      <div class="card">
       <div class="card-content">
        <div class="media">
         <div class="media-left">
          <figure class="image is-48x48">
           <img alt="Real Python Logo" src="https://files.realpython.com/media/real-python-logo-thumbnail.7f0db70c2ed2.jpg?__no_cf_polish=1"/>
          </figure>
         </div>
         <div class="media-content">
          <h2 class="title is-5">
           Product/process development scientist
          </h2>
          <h3 class="subtitle is-6 company">
           Gomez-Carroll
          </h3>
         </div>
        </div>
        <div class="content">
         <p class="location">
          Marktown, AA
         </p>
         <p class="is-small has-text-grey">
          <time datetime="2021-04-08">
           2021-04-08
          </time>
         </p>
        </div>
        <footer class="card-footer">
         <a class="card-footer-item" href="https://www.realpython.com" target="_blank">
          Learn
         </a>
         <a class="card-footer-item" href="https://realpython.github.io/fake-jobs/jobs/product-process-development-scientist-21.html" target="_blank">
          Apply
         </a>
        </footer>
       </div>
      </div>
     </div>
     <div class="column is-half">
      <div class="card">
       <div class="card-content">
        <div class="media">
         <div class="media-left">
          <figure class="image is-48x48">
           <img alt="Real Python Logo" src="https://files.realpython.com/media/real-python-logo-thumbnail.7f0db70c2ed2.jpg?__no_cf_polish=1"/>
          </figure>
         </div>
         <div class="media-content">
          <h2 class="title is-5">
           Scientist, research (maths)
          </h2>
          <h3 class="subtitle is-6 company">
           Manning, Welch and Herring
          </h3>
         </div>
        </div>
        <div class="content">
         <p class="location">
          Laurenland, AE
         </p>
         <p class="is-small has-text-grey">
          <time datetime="2021-04-08">
           2021-04-08
          </time>
         </p>
        </div>
        <footer class="card-footer">
         <a class="card-footer-item" href="https://www.realpython.com" target="_blank">
          Learn
         </a>
         <a class="card-footer-item" href="https://realpython.github.io/fake-jobs/jobs/scientist-research-maths-22.html" target="_blank">
          Apply
         </a>
        </footer>
       </div>
      </div>
     </div>
     <div class="column is-half">
      <div class="card">
       <div class="card-content">
        <div class="media">
         <div class="media-left">
          <figure class="image is-48x48">
           <img alt="Real Python Logo" src="https://files.realpython.com/media/real-python-logo-thumbnail.7f0db70c2ed2.jpg?__no_cf_polish=1"/>
          </figure>
         </div>
         <div class="media-content">
          <h2 class="title is-5">
           Ecologist
          </h2>
          <h3 class="subtitle is-6 company">
           Lee, Gutierrez and Brown
          </h3>
         </div>
        </div>
        <div class="content">
         <p class="location">
          Lauraton, AP
         </p>
         <p class="is-small has-text-grey">
          <time datetime="2021-04-08">
           2021-04-08
          </time>
         </p>
        </div>
        <footer class="card-footer">
         <a class="card-footer-item" href="https://www.realpython.com" target="_blank">
          Learn
         </a>
         <a class="card-footer-item" href="https://realpython.github.io/fake-jobs/jobs/ecologist-23.html" target="_blank">
          Apply
         </a>
        </footer>
       </div>
      </div>
     </div>
     <div class="column is-half">
      <div class="card">
       <div class="card-content">
        <div class="media">
         <div class="media-left">
          <figure class="image is-48x48">
           <img alt="Real Python Logo" src="https://files.realpython.com/media/real-python-logo-thumbnail.7f0db70c2ed2.jpg?__no_cf_polish=1"/>
          </figure>
         </div>
         <div class="media-content">
          <h2 class="title is-5">
           Materials engineer
          </h2>
          <h3 class="subtitle is-6 company">
           Davis, Serrano and Cook
          </h3>
         </div>
        </div>
        <div class="content">
         <p class="location">
          South Tammyberg, AP
         </p>
         <p class="is-small has-text-grey">
          <time datetime="2021-04-08">
           2021-04-08
          </time>
         </p>
        </div>
        <footer class="card-footer">
         <a class="card-footer-item" href="https://www.realpython.com" target="_blank">
          Learn
         </a>
         <a class="card-footer-item" href="https://realpython.github.io/fake-jobs/jobs/materials-engineer-24.html" target="_blank">
          Apply
         </a>
        </footer>
       </div>
      </div>
     </div>
     <div class="column is-half">
      <div class="card">
       <div class="card-content">
        <div class="media">
         <div class="media-left">
          <figure class="image is-48x48">
           <img alt="Real Python Logo" src="https://files.realpython.com/media/real-python-logo-thumbnail.7f0db70c2ed2.jpg?__no_cf_polish=1"/>
          </figure>
         </div>
         <div class="media-content">
          <h2 class="title is-5">
           Historic buildings inspector/conservation officer
          </h2>
          <h3 class="subtitle is-6 company">
           Smith LLC
          </h3>
         </div>
        </div>
        <div class="content">
         <p class="location">
          North Brandonville, AP
         </p>
         <p class="is-small has-text-grey">
          <time datetime="2021-04-08">
           2021-04-08
          </time>
         </p>
        </div>
        <footer class="card-footer">
         <a class="card-footer-item" href="https://www.realpython.com" target="_blank">
          Learn
         </a>
         <a class="card-footer-item" href="https://realpython.github.io/fake-jobs/jobs/historic-buildings-inspector-conservation-officer-25.html" target="_blank">
          Apply
         </a>
        </footer>
       </div>
      </div>
     </div>
     <div class="column is-half">
      <div class="card">
       <div class="card-content">
        <div class="media">
         <div class="media-left">
          <figure class="image is-48x48">
           <img alt="Real Python Logo" src="https://files.realpython.com/media/real-python-logo-thumbnail.7f0db70c2ed2.jpg?__no_cf_polish=1"/>
          </figure>
         </div>
         <div class="media-content">
          <h2 class="title is-5">
           Data scientist
          </h2>
          <h3 class="subtitle is-6 company">
           Thomas Group
          </h3>
         </div>
        </div>
        <div class="content">
         <p class="location">
          Port Robertfurt, AA
         </p>
         <p class="is-small has-text-grey">
          <time datetime="2021-04-08">
           2021-04-08
          </time>
         </p>
        </div>
        <footer class="card-footer">
         <a class="card-footer-item" href="https://www.realpython.com" target="_blank">
          Learn
         </a>
         <a class="card-footer-item" href="https://realpython.github.io/fake-jobs/jobs/data-scientist-26.html" target="_blank">
          Apply
         </a>
        </footer>
       </div>
      </div>
     </div>
     <div class="column is-half">
      <div class="card">
       <div class="card-content">
        <div class="media">
         <div class="media-left">
          <figure class="image is-48x48">
           <img alt="Real Python Logo" src="https://files.realpython.com/media/real-python-logo-thumbnail.7f0db70c2ed2.jpg?__no_cf_polish=1"/>
          </figure>
         </div>
         <div class="media-content">
          <h2 class="title is-5">
           Psychiatrist
          </h2>
          <h3 class="subtitle is-6 company">
           Silva-King
          </h3>
         </div>
        </div>
        <div class="content">
         <p class="location">
          Burnettbury, AE
         </p>
         <p class="is-small has-text-grey">
          <time datetime="2021-04-08">
           2021-04-08
          </time>
         </p>
        </div>
        <footer class="card-footer">
         <a class="card-footer-item" href="https://www.realpython.com" target="_blank">
          Learn
         </a>
         <a class="card-footer-item" href="https://realpython.github.io/fake-jobs/jobs/psychiatrist-27.html" target="_blank">
          Apply
         </a>
        </footer>
       </div>
      </div>
     </div>
     <div class="column is-half">
      <div class="card">
       <div class="card-content">
        <div class="media">
         <div class="media-left">
          <figure class="image is-48x48">
           <img alt="Real Python Logo" src="https://files.realpython.com/media/real-python-logo-thumbnail.7f0db70c2ed2.jpg?__no_cf_polish=1"/>
          </figure>
         </div>
         <div class="media-content">
          <h2 class="title is-5">
           Structural engineer
          </h2>
          <h3 class="subtitle is-6 company">
           Pierce-Long
          </h3>
         </div>
        </div>
        <div class="content">
         <p class="location">
          Herbertside, AA
         </p>
         <p class="is-small has-text-grey">
          <time datetime="2021-04-08">
           2021-04-08
          </time>
         </p>
        </div>
        <footer class="card-footer">
         <a class="card-footer-item" href="https://www.realpython.com" target="_blank">
          Learn
         </a>
         <a class="card-footer-item" href="https://realpython.github.io/fake-jobs/jobs/structural-engineer-28.html" target="_blank">
          Apply
         </a>
        </footer>
       </div>
      </div>
     </div>
     <div class="column is-half">
      <div class="card">
       <div class="card-content">
        <div class="media">
         <div class="media-left">
          <figure class="image is-48x48">
           <img alt="Real Python Logo" src="https://files.realpython.com/media/real-python-logo-thumbnail.7f0db70c2ed2.jpg?__no_cf_polish=1"/>
          </figure>
         </div>
         <div class="media-content">
          <h2 class="title is-5">
           Immigration officer
          </h2>
          <h3 class="subtitle is-6 company">
           Walker-Simpson
          </h3>
         </div>
        </div>
        <div class="content">
         <p class="location">
          Christopherport, AP
         </p>
         <p class="is-small has-text-grey">
          <time datetime="2021-04-08">
           2021-04-08
          </time>
         </p>
        </div>
        <footer class="card-footer">
         <a class="card-footer-item" href="https://www.realpython.com" target="_blank">
          Learn
         </a>
         <a class="card-footer-item" href="https://realpython.github.io/fake-jobs/jobs/immigration-officer-29.html" target="_blank">
          Apply
         </a>
        </footer>
       </div>
      </div>
     </div>
     <div class="column is-half">
      <div class="card">
       <div class="card-content">
        <div class="media">
         <div class="media-left">
          <figure class="image is-48x48">
           <img alt="Real Python Logo" src="https://files.realpython.com/media/real-python-logo-thumbnail.7f0db70c2ed2.jpg?__no_cf_polish=1"/>
          </figure>
         </div>
         <div class="media-content">
          <h2 class="title is-5">
           Python Programmer (Entry-Level)
          </h2>
          <h3 class="subtitle is-6 company">
           Cooper and Sons
          </h3>
         </div>
        </div>
        <div class="content">
         <p class="location">
          West Victor, AE
         </p>
         <p class="is-small has-text-grey">
          <time datetime="2021-04-08">
           2021-04-08
          </time>
         </p>
        </div>
        <footer class="card-footer">
         <a class="card-footer-item" href="https://www.realpython.com" target="_blank">
          Learn
         </a>
         <a class="card-footer-item" href="https://realpython.github.io/fake-jobs/jobs/python-programmer-entry-level-30.html" target="_blank">
          Apply
         </a>
        </footer>
       </div>
      </div>
     </div>
     <div class="column is-half">
      <div class="card">
       <div class="card-content">
        <div class="media">
         <div class="media-left">
          <figure class="image is-48x48">
           <img alt="Real Python Logo" src="https://files.realpython.com/media/real-python-logo-thumbnail.7f0db70c2ed2.jpg?__no_cf_polish=1"/>
          </figure>
         </div>
         <div class="media-content">
          <h2 class="title is-5">
           Neurosurgeon
          </h2>
          <h3 class="subtitle is-6 company">
           Donovan, Gonzalez and Figueroa
          </h3>
         </div>
        </div>
        <div class="content">
         <p class="location">
          Port Aaron, AP
         </p>
         <p class="is-small has-text-grey">
          <time datetime="2021-04-08">
           2021-04-08
          </time>
         </p>
        </div>
        <footer class="card-footer">
         <a class="card-footer-item" href="https://www.realpython.com" target="_blank">
          Learn
         </a>
         <a class="card-footer-item" href="https://realpython.github.io/fake-jobs/jobs/neurosurgeon-31.html" target="_blank">
          Apply
         </a>
        </footer>
       </div>
      </div>
     </div>
     <div class="column is-half">
      <div class="card">
       <div class="card-content">
        <div class="media">
         <div class="media-left">
          <figure class="image is-48x48">
           <img alt="Real Python Logo" src="https://files.realpython.com/media/real-python-logo-thumbnail.7f0db70c2ed2.jpg?__no_cf_polish=1"/>
          </figure>
         </div>
         <div class="media-content">
          <h2 class="title is-5">
           Broadcast engineer
          </h2>
          <h3 class="subtitle is-6 company">
           Morgan, Butler and Bennett
          </h3>
         </div>
        </div>
        <div class="content">
         <p class="location">
          Loribury, AA
         </p>
         <p class="is-small has-text-grey">
          <time datetime="2021-04-08">
           2021-04-08
          </time>
         </p>
        </div>
        <footer class="card-footer">
         <a class="card-footer-item" href="https://www.realpython.com" target="_blank">
          Learn
         </a>
         <a class="card-footer-item" href="https://realpython.github.io/fake-jobs/jobs/broadcast-engineer-32.html" target="_blank">
          Apply
         </a>
        </footer>
       </div>
      </div>
     </div>
     <div class="column is-half">
      <div class="card">
       <div class="card-content">
        <div class="media">
         <div class="media-left">
          <figure class="image is-48x48">
           <img alt="Real Python Logo" src="https://files.realpython.com/media/real-python-logo-thumbnail.7f0db70c2ed2.jpg?__no_cf_polish=1"/>
          </figure>
         </div>
         <div class="media-content">
          <h2 class="title is-5">
           Make
          </h2>
          <h3 class="subtitle is-6 company">
           Snyder-Lee
          </h3>
         </div>
        </div>
        <div class="content">
         <p class="location">
          Angelastad, AP
         </p>
         <p class="is-small has-text-grey">
          <time datetime="2021-04-08">
           2021-04-08
          </time>
         </p>
        </div>
        <footer class="card-footer">
         <a class="card-footer-item" href="https://www.realpython.com" target="_blank">
          Learn
         </a>
         <a class="card-footer-item" href="https://realpython.github.io/fake-jobs/jobs/make-33.html" target="_blank">
          Apply
         </a>
        </footer>
       </div>
      </div>
     </div>
     <div class="column is-half">
      <div class="card">
       <div class="card-content">
        <div class="media">
         <div class="media-left">
          <figure class="image is-48x48">
           <img alt="Real Python Logo" src="https://files.realpython.com/media/real-python-logo-thumbnail.7f0db70c2ed2.jpg?__no_cf_polish=1"/>
          </figure>
         </div>
         <div class="media-content">
          <h2 class="title is-5">
           Nurse, adult
          </h2>
          <h3 class="subtitle is-6 company">
           Harris PLC
          </h3>
         </div>
        </div>
        <div class="content">
         <p class="location">
          Larrytown, AE
         </p>
         <p class="is-small has-text-grey">
          <time datetime="2021-04-08">
           2021-04-08
          </time>
         </p>
        </div>
        <footer class="card-footer">
         <a class="card-footer-item" href="https://www.realpython.com" target="_blank">
          Learn
         </a>
         <a class="card-footer-item" href="https://realpython.github.io/fake-jobs/jobs/nurse-adult-34.html" target="_blank">
          Apply
         </a>
        </footer>
       </div>
      </div>
     </div>
     <div class="column is-half">
      <div class="card">
       <div class="card-content">
        <div class="media">
         <div class="media-left">
          <figure class="image is-48x48">
           <img alt="Real Python Logo" src="https://files.realpython.com/media/real-python-logo-thumbnail.7f0db70c2ed2.jpg?__no_cf_polish=1"/>
          </figure>
         </div>
         <div class="media-content">
          <h2 class="title is-5">
           Air broker
          </h2>
          <h3 class="subtitle is-6 company">
           Washington PLC
          </h3>
         </div>
        </div>
        <div class="content">
         <p class="location">
          West Colin, AP
         </p>
         <p class="is-small has-text-grey">
          <time datetime="2021-04-08">
           2021-04-08
          </time>
         </p>
        </div>
        <footer class="card-footer">
         <a class="card-footer-item" href="https://www.realpython.com" target="_blank">
          Learn
         </a>
         <a class="card-footer-item" href="https://realpython.github.io/fake-jobs/jobs/air-broker-35.html" target="_blank">
          Apply
         </a>
        </footer>
       </div>
      </div>
     </div>
     <div class="column is-half">
      <div class="card">
       <div class="card-content">
        <div class="media">
         <div class="media-left">
          <figure class="image is-48x48">
           <img alt="Real Python Logo" src="https://files.realpython.com/media/real-python-logo-thumbnail.7f0db70c2ed2.jpg?__no_cf_polish=1"/>
          </figure>
         </div>
         <div class="media-content">
          <h2 class="title is-5">
           Editor, film/video
          </h2>
          <h3 class="subtitle is-6 company">
           Brown, Price and Campbell
          </h3>
         </div>
        </div>
        <div class="content">
         <p class="location">
          West Stephanie, AP
         </p>
         <p class="is-small has-text-grey">
          <time datetime="2021-04-08">
           2021-04-08
          </time>
         </p>
        </div>
        <footer class="card-footer">
         <a class="card-footer-item" href="https://www.realpython.com" target="_blank">
          Learn
         </a>
         <a class="card-footer-item" href="https://realpython.github.io/fake-jobs/jobs/editor-film-video-36.html" target="_blank">
          Apply
         </a>
        </footer>
       </div>
      </div>
     </div>
     <div class="column is-half">
      <div class="card">
       <div class="card-content">
        <div class="media">
         <div class="media-left">
          <figure class="image is-48x48">
           <img alt="Real Python Logo" src="https://files.realpython.com/media/real-python-logo-thumbnail.7f0db70c2ed2.jpg?__no_cf_polish=1"/>
          </figure>
         </div>
         <div class="media-content">
          <h2 class="title is-5">
           Production assistant, radio
          </h2>
          <h3 class="subtitle is-6 company">
           Mcgee PLC
          </h3>
         </div>
        </div>
        <div class="content">
         <p class="location">
          Laurentown, AP
         </p>
         <p class="is-small has-text-grey">
          <time datetime="2021-04-08">
           2021-04-08
          </time>
         </p>
        </div>
        <footer class="card-footer">
         <a class="card-footer-item" href="https://www.realpython.com" target="_blank">
          Learn
         </a>
         <a class="card-footer-item" href="https://realpython.github.io/fake-jobs/jobs/production-assistant-radio-37.html" target="_blank">
          Apply
         </a>
        </footer>
       </div>
      </div>
     </div>
     <div class="column is-half">
      <div class="card">
       <div class="card-content">
        <div class="media">
         <div class="media-left">
          <figure class="image is-48x48">
           <img alt="Real Python Logo" src="https://files.realpython.com/media/real-python-logo-thumbnail.7f0db70c2ed2.jpg?__no_cf_polish=1"/>
          </figure>
         </div>
         <div class="media-content">
          <h2 class="title is-5">
           Engineer, communications
          </h2>
          <h3 class="subtitle is-6 company">
           Dixon Inc
          </h3>
         </div>
        </div>
        <div class="content">
         <p class="location">
          Wrightberg, AP
         </p>
         <p class="is-small has-text-grey">
          <time datetime="2021-04-08">
           2021-04-08
          </time>
         </p>
        </div>
        <footer class="card-footer">
         <a class="card-footer-item" href="https://www.realpython.com" target="_blank">
          Learn
         </a>
         <a class="card-footer-item" href="https://realpython.github.io/fake-jobs/jobs/engineer-communications-38.html" target="_blank">
          Apply
         </a>
        </footer>
       </div>
      </div>
     </div>
     <div class="column is-half">
      <div class="card">
       <div class="card-content">
        <div class="media">
         <div class="media-left">
          <figure class="image is-48x48">
           <img alt="Real Python Logo" src="https://files.realpython.com/media/real-python-logo-thumbnail.7f0db70c2ed2.jpg?__no_cf_polish=1"/>
          </figure>
         </div>
         <div class="media-content">
          <h2 class="title is-5">
           Sales executive
          </h2>
          <h3 class="subtitle is-6 company">
           Thompson, Sheppard and Ward
          </h3>
         </div>
        </div>
        <div class="content">
         <p class="location">
          Alberttown, AE
         </p>
         <p class="is-small has-text-grey">
          <time datetime="2021-04-08">
           2021-04-08
          </time>
         </p>
        </div>
        <footer class="card-footer">
         <a class="card-footer-item" href="https://www.realpython.com" target="_blank">
          Learn
         </a>
         <a class="card-footer-item" href="https://realpython.github.io/fake-jobs/jobs/sales-executive-39.html" target="_blank">
          Apply
         </a>
        </footer>
       </div>
      </div>
     </div>
     <div class="column is-half">
      <div class="card">
       <div class="card-content">
        <div class="media">
         <div class="media-left">
          <figure class="image is-48x48">
           <img alt="Real Python Logo" src="https://files.realpython.com/media/real-python-logo-thumbnail.7f0db70c2ed2.jpg?__no_cf_polish=1"/>
          </figure>
         </div>
         <div class="media-content">
          <h2 class="title is-5">
           Software Developer (Python)
          </h2>
          <h3 class="subtitle is-6 company">
           Adams-Brewer
          </h3>
         </div>
        </div>
        <div class="content">
         <p class="location">
          Brockburgh, AE
         </p>
         <p class="is-small has-text-grey">
          <time datetime="2021-04-08">
           2021-04-08
          </time>
         </p>
        </div>
        <footer class="card-footer">
         <a class="card-footer-item" href="https://www.realpython.com" target="_blank">
          Learn
         </a>
         <a class="card-footer-item" href="https://realpython.github.io/fake-jobs/jobs/software-developer-python-40.html" target="_blank">
          Apply
         </a>
        </footer>
       </div>
      </div>
     </div>
     <div class="column is-half">
      <div class="card">
       <div class="card-content">
        <div class="media">
         <div class="media-left">
          <figure class="image is-48x48">
           <img alt="Real Python Logo" src="https://files.realpython.com/media/real-python-logo-thumbnail.7f0db70c2ed2.jpg?__no_cf_polish=1"/>
          </figure>
         </div>
         <div class="media-content">
          <h2 class="title is-5">
           Futures trader
          </h2>
          <h3 class="subtitle is-6 company">
           Schneider-Brady
          </h3>
         </div>
        </div>
        <div class="content">
         <p class="location">
          North Jason, AE
         </p>
         <p class="is-small has-text-grey">
          <time datetime="2021-04-08">
           2021-04-08
          </time>
         </p>
        </div>
        <footer class="card-footer">
         <a class="card-footer-item" href="https://www.realpython.com" target="_blank">
          Learn
         </a>
         <a class="card-footer-item" href="https://realpython.github.io/fake-jobs/jobs/futures-trader-41.html" target="_blank">
          Apply
         </a>
        </footer>
       </div>
      </div>
     </div>
     <div class="column is-half">
      <div class="card">
       <div class="card-content">
        <div class="media">
         <div class="media-left">
          <figure class="image is-48x48">
           <img alt="Real Python Logo" src="https://files.realpython.com/media/real-python-logo-thumbnail.7f0db70c2ed2.jpg?__no_cf_polish=1"/>
          </figure>
         </div>
         <div class="media-content">
          <h2 class="title is-5">
           Tour manager
          </h2>
          <h3 class="subtitle is-6 company">
           Gonzales-Frank
          </h3>
         </div>
        </div>
        <div class="content">
         <p class="location">
          Arnoldhaven, AE
         </p>
         <p class="is-small has-text-grey">
          <time datetime="2021-04-08">
           2021-04-08
          </time>
         </p>
        </div>
        <footer class="card-footer">
         <a class="card-footer-item" href="https://www.realpython.com" target="_blank">
          Learn
         </a>
         <a class="card-footer-item" href="https://realpython.github.io/fake-jobs/jobs/tour-manager-42.html" target="_blank">
          Apply
         </a>
        </footer>
       </div>
      </div>
     </div>
     <div class="column is-half">
      <div class="card">
       <div class="card-content">
        <div class="media">
         <div class="media-left">
          <figure class="image is-48x48">
           <img alt="Real Python Logo" src="https://files.realpython.com/media/real-python-logo-thumbnail.7f0db70c2ed2.jpg?__no_cf_polish=1"/>
          </figure>
         </div>
         <div class="media-content">
          <h2 class="title is-5">
           Cytogeneticist
          </h2>
          <h3 class="subtitle is-6 company">
           Smith-Wong
          </h3>
         </div>
        </div>
        <div class="content">
         <p class="location">
          Lake Destiny, AP
         </p>
         <p class="is-small has-text-grey">
          <time datetime="2021-04-08">
           2021-04-08
          </time>
         </p>
        </div>
        <footer class="card-footer">
         <a class="card-footer-item" href="https://www.realpython.com" target="_blank">
          Learn
         </a>
         <a class="card-footer-item" href="https://realpython.github.io/fake-jobs/jobs/cytogeneticist-43.html" target="_blank">
          Apply
         </a>
        </footer>
       </div>
      </div>
     </div>
     <div class="column is-half">
      <div class="card">
       <div class="card-content">
        <div class="media">
         <div class="media-left">
          <figure class="image is-48x48">
           <img alt="Real Python Logo" src="https://files.realpython.com/media/real-python-logo-thumbnail.7f0db70c2ed2.jpg?__no_cf_polish=1"/>
          </figure>
         </div>
         <div class="media-content">
          <h2 class="title is-5">
           Designer, multimedia
          </h2>
          <h3 class="subtitle is-6 company">
           Pierce-Herrera
          </h3>
         </div>
        </div>
        <div class="content">
         <p class="location">
          South Timothyburgh, AP
         </p>
         <p class="is-small has-text-grey">
          <time datetime="2021-04-08">
           2021-04-08
          </time>
         </p>
        </div>
        <footer class="card-footer">
         <a class="card-footer-item" href="https://www.realpython.com" target="_blank">
          Learn
         </a>
         <a class="card-footer-item" href="https://realpython.github.io/fake-jobs/jobs/designer-multimedia-44.html" target="_blank">
          Apply
         </a>
        </footer>
       </div>
      </div>
     </div>
     <div class="column is-half">
      <div class="card">
       <div class="card-content">
        <div class="media">
         <div class="media-left">
          <figure class="image is-48x48">
           <img alt="Real Python Logo" src="https://files.realpython.com/media/real-python-logo-thumbnail.7f0db70c2ed2.jpg?__no_cf_polish=1"/>
          </figure>
         </div>
         <div class="media-content">
          <h2 class="title is-5">
           Trade union research officer
          </h2>
          <h3 class="subtitle is-6 company">
           Aguilar, Rivera and Quinn
          </h3>
         </div>
        </div>
        <div class="content">
         <p class="location">
          New Jimmyton, AE
         </p>
         <p class="is-small has-text-grey">
          <time datetime="2021-04-08">
           2021-04-08
          </time>
         </p>
        </div>
        <footer class="card-footer">
         <a class="card-footer-item" href="https://www.realpython.com" target="_blank">
          Learn
         </a>
         <a class="card-footer-item" href="https://realpython.github.io/fake-jobs/jobs/trade-union-research-officer-45.html" target="_blank">
          Apply
         </a>
        </footer>
       </div>
      </div>
     </div>
     <div class="column is-half">
      <div class="card">
       <div class="card-content">
        <div class="media">
         <div class="media-left">
          <figure class="image is-48x48">
           <img alt="Real Python Logo" src="https://files.realpython.com/media/real-python-logo-thumbnail.7f0db70c2ed2.jpg?__no_cf_polish=1"/>
          </figure>
         </div>
         <div class="media-content">
          <h2 class="title is-5">
           Chemist, analytical
          </h2>
          <h3 class="subtitle is-6 company">
           Lowe, Barnes and Thomas
          </h3>
         </div>
        </div>
        <div class="content">
         <p class="location">
          New Lucasbury, AP
         </p>
         <p class="is-small has-text-grey">
          <time datetime="2021-04-08">
           2021-04-08
          </time>
         </p>
        </div>
        <footer class="card-footer">
         <a class="card-footer-item" href="https://www.realpython.com" target="_blank">
          Learn
         </a>
         <a class="card-footer-item" href="https://realpython.github.io/fake-jobs/jobs/chemist-analytical-46.html" target="_blank">
          Apply
         </a>
        </footer>
       </div>
      </div>
     </div>
     <div class="column is-half">
      <div class="card">
       <div class="card-content">
        <div class="media">
         <div class="media-left">
          <figure class="image is-48x48">
           <img alt="Real Python Logo" src="https://files.realpython.com/media/real-python-logo-thumbnail.7f0db70c2ed2.jpg?__no_cf_polish=1"/>
          </figure>
         </div>
         <div class="media-content">
          <h2 class="title is-5">
           Programmer, multimedia
          </h2>
          <h3 class="subtitle is-6 company">
           Lewis, Gonzalez and Vasquez
          </h3>
         </div>
        </div>
        <div class="content">
         <p class="location">
          Port Cory, AE
         </p>
         <p class="is-small has-text-grey">
          <time datetime="2021-04-08">
           2021-04-08
          </time>
         </p>
        </div>
        <footer class="card-footer">
         <a class="card-footer-item" href="https://www.realpython.com" target="_blank">
          Learn
         </a>
         <a class="card-footer-item" href="https://realpython.github.io/fake-jobs/jobs/programmer-multimedia-47.html" target="_blank">
          Apply
         </a>
        </footer>
       </div>
      </div>
     </div>
     <div class="column is-half">
      <div class="card">
       <div class="card-content">
        <div class="media">
         <div class="media-left">
          <figure class="image is-48x48">
           <img alt="Real Python Logo" src="https://files.realpython.com/media/real-python-logo-thumbnail.7f0db70c2ed2.jpg?__no_cf_polish=1"/>
          </figure>
         </div>
         <div class="media-content">
          <h2 class="title is-5">
           Engineer, broadcasting (operations)
          </h2>
          <h3 class="subtitle is-6 company">
           Taylor PLC
          </h3>
         </div>
        </div>
        <div class="content">
         <p class="location">
          Gileston, AA
         </p>
         <p class="is-small has-text-grey">
          <time datetime="2021-04-08">
           2021-04-08
          </time>
         </p>
        </div>
        <footer class="card-footer">
         <a class="card-footer-item" href="https://www.realpython.com" target="_blank">
          Learn
         </a>
         <a class="card-footer-item" href="https://realpython.github.io/fake-jobs/jobs/engineer-broadcasting-operations-48.html" target="_blank">
          Apply
         </a>
        </footer>
       </div>
      </div>
     </div>
     <div class="column is-half">
      <div class="card">
       <div class="card-content">
        <div class="media">
         <div class="media-left">
          <figure class="image is-48x48">
           <img alt="Real Python Logo" src="https://files.realpython.com/media/real-python-logo-thumbnail.7f0db70c2ed2.jpg?__no_cf_polish=1"/>
          </figure>
         </div>
         <div class="media-content">
          <h2 class="title is-5">
           Teacher, primary school
          </h2>
          <h3 class="subtitle is-6 company">
           Oliver, Jones and Ramirez
          </h3>
         </div>
        </div>
        <div class="content">
         <p class="location">
          Cindyshire, AA
         </p>
         <p class="is-small has-text-grey">
          <time datetime="2021-04-08">
           2021-04-08
          </time>
         </p>
        </div>
        <footer class="card-footer">
         <a class="card-footer-item" href="https://www.realpython.com" target="_blank">
          Learn
         </a>
         <a class="card-footer-item" href="https://realpython.github.io/fake-jobs/jobs/teacher-primary-school-49.html" target="_blank">
          Apply
         </a>
        </footer>
       </div>
      </div>
     </div>
     <div class="column is-half">
      <div class="card">
       <div class="card-content">
        <div class="media">
         <div class="media-left">
          <figure class="image is-48x48">
           <img alt="Real Python Logo" src="https://files.realpython.com/media/real-python-logo-thumbnail.7f0db70c2ed2.jpg?__no_cf_polish=1"/>
          </figure>
         </div>
         <div class="media-content">
          <h2 class="title is-5">
           Python Developer
          </h2>
          <h3 class="subtitle is-6 company">
           Rivera and Sons
          </h3>
         </div>
        </div>
        <div class="content">
         <p class="location">
          East Michaelfort, AA
         </p>
         <p class="is-small has-text-grey">
          <time datetime="2021-04-08">
           2021-04-08
          </time>
         </p>
        </div>
        <footer class="card-footer">
         <a class="card-footer-item" href="https://www.realpython.com" target="_blank">
          Learn
         </a>
         <a class="card-footer-item" href="https://realpython.github.io/fake-jobs/jobs/python-developer-50.html" target="_blank">
          Apply
         </a>
        </footer>
       </div>
      </div>
     </div>
     <div class="column is-half">
      <div class="card">
       <div class="card-content">
        <div class="media">
         <div class="media-left">
          <figure class="image is-48x48">
           <img alt="Real Python Logo" src="https://files.realpython.com/media/real-python-logo-thumbnail.7f0db70c2ed2.jpg?__no_cf_polish=1"/>
          </figure>
         </div>
         <div class="media-content">
          <h2 class="title is-5">
           Manufacturing systems engineer
          </h2>
          <h3 class="subtitle is-6 company">
           Garcia PLC
          </h3>
         </div>
        </div>
        <div class="content">
         <p class="location">
          Joybury, AE
         </p>
         <p class="is-small has-text-grey">
          <time datetime="2021-04-08">
           2021-04-08
          </time>
         </p>
        </div>
        <footer class="card-footer">
         <a class="card-footer-item" href="https://www.realpython.com" target="_blank">
          Learn
         </a>
         <a class="card-footer-item" href="https://realpython.github.io/fake-jobs/jobs/manufacturing-systems-engineer-51.html" target="_blank">
          Apply
         </a>
        </footer>
       </div>
      </div>
     </div>
     <div class="column is-half">
      <div class="card">
       <div class="card-content">
        <div class="media">
         <div class="media-left">
          <figure class="image is-48x48">
           <img alt="Real Python Logo" src="https://files.realpython.com/media/real-python-logo-thumbnail.7f0db70c2ed2.jpg?__no_cf_polish=1"/>
          </figure>
         </div>
         <div class="media-content">
          <h2 class="title is-5">
           Producer, television/film/video
          </h2>
          <h3 class="subtitle is-6 company">
           Johnson, Wells and Kramer
          </h3>
         </div>
        </div>
        <div class="content">
         <p class="location">
          Emmatown, AE
         </p>
         <p class="is-small has-text-grey">
          <time datetime="2021-04-08">
           2021-04-08
          </time>
         </p>
        </div>
        <footer class="card-footer">
         <a class="card-footer-item" href="https://www.realpython.com" target="_blank">
          Learn
         </a>
         <a class="card-footer-item" href="https://realpython.github.io/fake-jobs/jobs/producer-television-film-video-52.html" target="_blank">
          Apply
         </a>
        </footer>
       </div>
      </div>
     </div>
     <div class="column is-half">
      <div class="card">
       <div class="card-content">
        <div class="media">
         <div class="media-left">
          <figure class="image is-48x48">
           <img alt="Real Python Logo" src="https://files.realpython.com/media/real-python-logo-thumbnail.7f0db70c2ed2.jpg?__no_cf_polish=1"/>
          </figure>
         </div>
         <div class="media-content">
          <h2 class="title is-5">
           Scientist, forensic
          </h2>
          <h3 class="subtitle is-6 company">
           Gonzalez LLC
          </h3>
         </div>
        </div>
        <div class="content">
         <p class="location">
          Colehaven, AP
         </p>
         <p class="is-small has-text-grey">
          <time datetime="2021-04-08">
           2021-04-08
          </time>
         </p>
        </div>
        <footer class="card-footer">
         <a class="card-footer-item" href="https://www.realpython.com" target="_blank">
          Learn
         </a>
         <a class="card-footer-item" href="https://realpython.github.io/fake-jobs/jobs/scientist-forensic-53.html" target="_blank">
          Apply
         </a>
        </footer>
       </div>
      </div>
     </div>
     <div class="column is-half">
      <div class="card">
       <div class="card-content">
        <div class="media">
         <div class="media-left">
          <figure class="image is-48x48">
           <img alt="Real Python Logo" src="https://files.realpython.com/media/real-python-logo-thumbnail.7f0db70c2ed2.jpg?__no_cf_polish=1"/>
          </figure>
         </div>
         <div class="media-content">
          <h2 class="title is-5">
           Bonds trader
          </h2>
          <h3 class="subtitle is-6 company">
           Morgan, White and Macdonald
          </h3>
         </div>
        </div>
        <div class="content">
         <p class="location">
          Port Coryton, AE
         </p>
         <p class="is-small has-text-grey">
          <time datetime="2021-04-08">
           2021-04-08
          </time>
         </p>
        </div>
        <footer class="card-footer">
         <a class="card-footer-item" href="https://www.realpython.com" target="_blank">
          Learn
         </a>
         <a class="card-footer-item" href="https://realpython.github.io/fake-jobs/jobs/bonds-trader-54.html" target="_blank">
          Apply
         </a>
        </footer>
       </div>
      </div>
     </div>
     <div class="column is-half">
      <div class="card">
       <div class="card-content">
        <div class="media">
         <div class="media-left">
          <figure class="image is-48x48">
           <img alt="Real Python Logo" src="https://files.realpython.com/media/real-python-logo-thumbnail.7f0db70c2ed2.jpg?__no_cf_polish=1"/>
          </figure>
         </div>
         <div class="media-content">
          <h2 class="title is-5">
           Editorial assistant
          </h2>
          <h3 class="subtitle is-6 company">
           Robinson-Fitzpatrick
          </h3>
         </div>
        </div>
        <div class="content">
         <p class="location">
          Amyborough, AA
         </p>
         <p class="is-small has-text-grey">
          <time datetime="2021-04-08">
           2021-04-08
          </time>
         </p>
        </div>
        <footer class="card-footer">
         <a class="card-footer-item" href="https://www.realpython.com" target="_blank">
          Learn
         </a>
         <a class="card-footer-item" href="https://realpython.github.io/fake-jobs/jobs/editorial-assistant-55.html" target="_blank">
          Apply
         </a>
        </footer>
       </div>
      </div>
     </div>
     <div class="column is-half">
      <div class="card">
       <div class="card-content">
        <div class="media">
         <div class="media-left">
          <figure class="image is-48x48">
           <img alt="Real Python Logo" src="https://files.realpython.com/media/real-python-logo-thumbnail.7f0db70c2ed2.jpg?__no_cf_polish=1"/>
          </figure>
         </div>
         <div class="media-content">
          <h2 class="title is-5">
           Photographer
          </h2>
          <h3 class="subtitle is-6 company">
           Waters, Wilson and Hoover
          </h3>
         </div>
        </div>
        <div class="content">
         <p class="location">
          Reynoldsville, AA
         </p>
         <p class="is-small has-text-grey">
          <time datetime="2021-04-08">
           2021-04-08
          </time>
         </p>
        </div>
        <footer class="card-footer">
         <a class="card-footer-item" href="https://www.realpython.com" target="_blank">
          Learn
         </a>
         <a class="card-footer-item" href="https://realpython.github.io/fake-jobs/jobs/photographer-56.html" target="_blank">
          Apply
         </a>
        </footer>
       </div>
      </div>
     </div>
     <div class="column is-half">
      <div class="card">
       <div class="card-content">
        <div class="media">
         <div class="media-left">
          <figure class="image is-48x48">
           <img alt="Real Python Logo" src="https://files.realpython.com/media/real-python-logo-thumbnail.7f0db70c2ed2.jpg?__no_cf_polish=1"/>
          </figure>
         </div>
         <div class="media-content">
          <h2 class="title is-5">
           Retail banker
          </h2>
          <h3 class="subtitle is-6 company">
           Hill LLC
          </h3>
         </div>
        </div>
        <div class="content">
         <p class="location">
          Port Billy, AP
         </p>
         <p class="is-small has-text-grey">
          <time datetime="2021-04-08">
           2021-04-08
          </time>
         </p>
        </div>
        <footer class="card-footer">
         <a class="card-footer-item" href="https://www.realpython.com" target="_blank">
          Learn
         </a>
         <a class="card-footer-item" href="https://realpython.github.io/fake-jobs/jobs/retail-banker-57.html" target="_blank">
          Apply
         </a>
        </footer>
       </div>
      </div>
     </div>
     <div class="column is-half">
      <div class="card">
       <div class="card-content">
        <div class="media">
         <div class="media-left">
          <figure class="image is-48x48">
           <img alt="Real Python Logo" src="https://files.realpython.com/media/real-python-logo-thumbnail.7f0db70c2ed2.jpg?__no_cf_polish=1"/>
          </figure>
         </div>
         <div class="media-content">
          <h2 class="title is-5">
           Jewellery designer
          </h2>
          <h3 class="subtitle is-6 company">
           Li-Gregory
          </h3>
         </div>
        </div>
        <div class="content">
         <p class="location">
          Adamburgh, AA
         </p>
         <p class="is-small has-text-grey">
          <time datetime="2021-04-08">
           2021-04-08
          </time>
         </p>
        </div>
        <footer class="card-footer">
         <a class="card-footer-item" href="https://www.realpython.com" target="_blank">
          Learn
         </a>
         <a class="card-footer-item" href="https://realpython.github.io/fake-jobs/jobs/jewellery-designer-58.html" target="_blank">
          Apply
         </a>
        </footer>
       </div>
      </div>
     </div>
     <div class="column is-half">
      <div class="card">
       <div class="card-content">
        <div class="media">
         <div class="media-left">
          <figure class="image is-48x48">
           <img alt="Real Python Logo" src="https://files.realpython.com/media/real-python-logo-thumbnail.7f0db70c2ed2.jpg?__no_cf_polish=1"/>
          </figure>
         </div>
         <div class="media-content">
          <h2 class="title is-5">
           Ophthalmologist
          </h2>
          <h3 class="subtitle is-6 company">
           Fisher, Ryan and Coleman
          </h3>
         </div>
        </div>
        <div class="content">
         <p class="location">
          Wilsonmouth, AA
         </p>
         <p class="is-small has-text-grey">
          <time datetime="2021-04-08">
           2021-04-08
          </time>
         </p>
        </div>
        <footer class="card-footer">
         <a class="card-footer-item" href="https://www.realpython.com" target="_blank">
          Learn
         </a>
         <a class="card-footer-item" href="https://realpython.github.io/fake-jobs/jobs/ophthalmologist-59.html" target="_blank">
          Apply
         </a>
        </footer>
       </div>
      </div>
     </div>
     <div class="column is-half">
      <div class="card">
       <div class="card-content">
        <div class="media">
         <div class="media-left">
          <figure class="image is-48x48">
           <img alt="Real Python Logo" src="https://files.realpython.com/media/real-python-logo-thumbnail.7f0db70c2ed2.jpg?__no_cf_polish=1"/>
          </figure>
         </div>
         <div class="media-content">
          <h2 class="title is-5">
           Back-End Web Developer (Python, Django)
          </h2>
          <h3 class="subtitle is-6 company">
           Stewart-Alexander
          </h3>
         </div>
        </div>
        <div class="content">
         <p class="location">
          South Kimberly, AA
         </p>
         <p class="is-small has-text-grey">
          <time datetime="2021-04-08">
           2021-04-08
          </time>
         </p>
        </div>
        <footer class="card-footer">
         <a class="card-footer-item" href="https://www.realpython.com" target="_blank">
          Learn
         </a>
         <a class="card-footer-item" href="https://realpython.github.io/fake-jobs/jobs/back-end-web-developer-python-django-60.html" target="_blank">
          Apply
         </a>
        </footer>
       </div>
      </div>
     </div>
     <div class="column is-half">
      <div class="card">
       <div class="card-content">
        <div class="media">
         <div class="media-left">
          <figure class="image is-48x48">
           <img alt="Real Python Logo" src="https://files.realpython.com/media/real-python-logo-thumbnail.7f0db70c2ed2.jpg?__no_cf_polish=1"/>
          </figure>
         </div>
         <div class="media-content">
          <h2 class="title is-5">
           Licensed conveyancer
          </h2>
          <h3 class="subtitle is-6 company">
           Abbott and Sons
          </h3>
         </div>
        </div>
        <div class="content">
         <p class="location">
          Benjaminland, AP
         </p>
         <p class="is-small has-text-grey">
          <time datetime="2021-04-08">
           2021-04-08
          </time>
         </p>
        </div>
        <footer class="card-footer">
         <a class="card-footer-item" href="https://www.realpython.com" target="_blank">
          Learn
         </a>
         <a class="card-footer-item" href="https://realpython.github.io/fake-jobs/jobs/licensed-conveyancer-61.html" target="_blank">
          Apply
         </a>
        </footer>
       </div>
      </div>
     </div>
     <div class="column is-half">
      <div class="card">
       <div class="card-content">
        <div class="media">
         <div class="media-left">
          <figure class="image is-48x48">
           <img alt="Real Python Logo" src="https://files.realpython.com/media/real-python-logo-thumbnail.7f0db70c2ed2.jpg?__no_cf_polish=1"/>
          </figure>
         </div>
         <div class="media-content">
          <h2 class="title is-5">
           Futures trader
          </h2>
          <h3 class="subtitle is-6 company">
           Bryant, Santana and Davenport
          </h3>
         </div>
        </div>
        <div class="content">
         <p class="location">
          Zacharyport, AA
         </p>
         <p class="is-small has-text-grey">
          <time datetime="2021-04-08">
           2021-04-08
          </time>
         </p>
        </div>
        <footer class="card-footer">
         <a class="card-footer-item" href="https://www.realpython.com" target="_blank">
          Learn
         </a>
         <a class="card-footer-item" href="https://realpython.github.io/fake-jobs/jobs/futures-trader-62.html" target="_blank">
          Apply
         </a>
        </footer>
       </div>
      </div>
     </div>
     <div class="column is-half">
      <div class="card">
       <div class="card-content">
        <div class="media">
         <div class="media-left">
          <figure class="image is-48x48">
           <img alt="Real Python Logo" src="https://files.realpython.com/media/real-python-logo-thumbnail.7f0db70c2ed2.jpg?__no_cf_polish=1"/>
          </figure>
         </div>
         <div class="media-content">
          <h2 class="title is-5">
           Counselling psychologist
          </h2>
          <h3 class="subtitle is-6 company">
           Smith PLC
          </h3>
         </div>
        </div>
        <div class="content">
         <p class="location">
          Port Devonville, AE
         </p>
         <p class="is-small has-text-grey">
          <time datetime="2021-04-08">
           2021-04-08
          </time>
         </p>
        </div>
        <footer class="card-footer">
         <a class="card-footer-item" href="https://www.realpython.com" target="_blank">
          Learn
         </a>
         <a class="card-footer-item" href="https://realpython.github.io/fake-jobs/jobs/counselling-psychologist-63.html" target="_blank">
          Apply
         </a>
        </footer>
       </div>
      </div>
     </div>
     <div class="column is-half">
      <div class="card">
       <div class="card-content">
        <div class="media">
         <div class="media-left">
          <figure class="image is-48x48">
           <img alt="Real Python Logo" src="https://files.realpython.com/media/real-python-logo-thumbnail.7f0db70c2ed2.jpg?__no_cf_polish=1"/>
          </figure>
         </div>
         <div class="media-content">
          <h2 class="title is-5">
           Insurance underwriter
          </h2>
          <h3 class="subtitle is-6 company">
           Patterson-Singh
          </h3>
         </div>
        </div>
        <div class="content">
         <p class="location">
          East Thomas, AE
         </p>
         <p class="is-small has-text-grey">
          <time datetime="2021-04-08">
           2021-04-08
          </time>
         </p>
        </div>
        <footer class="card-footer">
         <a class="card-footer-item" href="https://www.realpython.com" target="_blank">
          Learn
         </a>
         <a class="card-footer-item" href="https://realpython.github.io/fake-jobs/jobs/insurance-underwriter-64.html" target="_blank">
          Apply
         </a>
        </footer>
       </div>
      </div>
     </div>
     <div class="column is-half">
      <div class="card">
       <div class="card-content">
        <div class="media">
         <div class="media-left">
          <figure class="image is-48x48">
           <img alt="Real Python Logo" src="https://files.realpython.com/media/real-python-logo-thumbnail.7f0db70c2ed2.jpg?__no_cf_polish=1"/>
          </figure>
         </div>
         <div class="media-content">
          <h2 class="title is-5">
           Engineer, automotive
          </h2>
          <h3 class="subtitle is-6 company">
           Martinez-Berry
          </h3>
         </div>
        </div>
        <div class="content">
         <p class="location">
          New Jeffrey, AP
         </p>
         <p class="is-small has-text-grey">
          <time datetime="2021-04-08">
           2021-04-08
          </time>
         </p>
        </div>
        <footer class="card-footer">
         <a class="card-footer-item" href="https://www.realpython.com" target="_blank">
          Learn
         </a>
         <a class="card-footer-item" href="https://realpython.github.io/fake-jobs/jobs/engineer-automotive-65.html" target="_blank">
          Apply
         </a>
        </footer>
       </div>
      </div>
     </div>
     <div class="column is-half">
      <div class="card">
       <div class="card-content">
        <div class="media">
         <div class="media-left">
          <figure class="image is-48x48">
           <img alt="Real Python Logo" src="https://files.realpython.com/media/real-python-logo-thumbnail.7f0db70c2ed2.jpg?__no_cf_polish=1"/>
          </figure>
         </div>
         <div class="media-content">
          <h2 class="title is-5">
           Producer, radio
          </h2>
          <h3 class="subtitle is-6 company">
           May, Taylor and Fisher
          </h3>
         </div>
        </div>
        <div class="content">
         <p class="location">
          Davidside, AA
         </p>
         <p class="is-small has-text-grey">
          <time datetime="2021-04-08">
           2021-04-08
          </time>
         </p>
        </div>
        <footer class="card-footer">
         <a class="card-footer-item" href="https://www.realpython.com" target="_blank">
          Learn
         </a>
         <a class="card-footer-item" href="https://realpython.github.io/fake-jobs/jobs/producer-radio-66.html" target="_blank">
          Apply
         </a>
        </footer>
       </div>
      </div>
     </div>
     <div class="column is-half">
      <div class="card">
       <div class="card-content">
        <div class="media">
         <div class="media-left">
          <figure class="image is-48x48">
           <img alt="Real Python Logo" src="https://files.realpython.com/media/real-python-logo-thumbnail.7f0db70c2ed2.jpg?__no_cf_polish=1"/>
          </figure>
         </div>
         <div class="media-content">
          <h2 class="title is-5">
           Dispensing optician
          </h2>
          <h3 class="subtitle is-6 company">
           Bailey, Owen and Thompson
          </h3>
         </div>
        </div>
        <div class="content">
         <p class="location">
          Jamesville, AA
         </p>
         <p class="is-small has-text-grey">
          <time datetime="2021-04-08">
           2021-04-08
          </time>
         </p>
        </div>
        <footer class="card-footer">
         <a class="card-footer-item" href="https://www.realpython.com" target="_blank">
          Learn
         </a>
         <a class="card-footer-item" href="https://realpython.github.io/fake-jobs/jobs/dispensing-optician-67.html" target="_blank">
          Apply
         </a>
        </footer>
       </div>
      </div>
     </div>
     <div class="column is-half">
      <div class="card">
       <div class="card-content">
        <div class="media">
         <div class="media-left">
          <figure class="image is-48x48">
           <img alt="Real Python Logo" src="https://files.realpython.com/media/real-python-logo-thumbnail.7f0db70c2ed2.jpg?__no_cf_polish=1"/>
          </figure>
         </div>
         <div class="media-content">
          <h2 class="title is-5">
           Designer, fashion/clothing
          </h2>
          <h3 class="subtitle is-6 company">
           Vasquez Ltd
          </h3>
         </div>
        </div>
        <div class="content">
         <p class="location">
          New Kelly, AP
         </p>
         <p class="is-small has-text-grey">
          <time datetime="2021-04-08">
           2021-04-08
          </time>
         </p>
        </div>
        <footer class="card-footer">
         <a class="card-footer-item" href="https://www.realpython.com" target="_blank">
          Learn
         </a>
         <a class="card-footer-item" href="https://realpython.github.io/fake-jobs/jobs/designer-fashion-clothing-68.html" target="_blank">
          Apply
         </a>
        </footer>
       </div>
      </div>
     </div>
     <div class="column is-half">
      <div class="card">
       <div class="card-content">
        <div class="media">
         <div class="media-left">
          <figure class="image is-48x48">
           <img alt="Real Python Logo" src="https://files.realpython.com/media/real-python-logo-thumbnail.7f0db70c2ed2.jpg?__no_cf_polish=1"/>
          </figure>
         </div>
         <div class="media-content">
          <h2 class="title is-5">
           Chartered loss adjuster
          </h2>
          <h3 class="subtitle is-6 company">
           Leblanc LLC
          </h3>
         </div>
        </div>
        <div class="content">
         <p class="location">
          Lake Antonio, AA
         </p>
         <p class="is-small has-text-grey">
          <time datetime="2021-04-08">
           2021-04-08
          </time>
         </p>
        </div>
        <footer class="card-footer">
         <a class="card-footer-item" href="https://www.realpython.com" target="_blank">
          Learn
         </a>
         <a class="card-footer-item" href="https://realpython.github.io/fake-jobs/jobs/chartered-loss-adjuster-69.html" target="_blank">
          Apply
         </a>
        </footer>
       </div>
      </div>
     </div>
     <div class="column is-half">
      <div class="card">
       <div class="card-content">
        <div class="media">
         <div class="media-left">
          <figure class="image is-48x48">
           <img alt="Real Python Logo" src="https://files.realpython.com/media/real-python-logo-thumbnail.7f0db70c2ed2.jpg?__no_cf_polish=1"/>
          </figure>
         </div>
         <div class="media-content">
          <h2 class="title is-5">
           Back-End Web Developer (Python, Django)
          </h2>
          <h3 class="subtitle is-6 company">
           Jackson, Ali and Mckee
          </h3>
         </div>
        </div>
        <div class="content">
         <p class="location">
          New Elizabethside, AA
         </p>
         <p class="is-small has-text-grey">
          <time datetime="2021-04-08">
           2021-04-08
          </time>
         </p>
        </div>
        <footer class="card-footer">
         <a class="card-footer-item" href="https://www.realpython.com" target="_blank">
          Learn
         </a>
         <a class="card-footer-item" href="https://realpython.github.io/fake-jobs/jobs/back-end-web-developer-python-django-70.html" target="_blank">
          Apply
         </a>
        </footer>
       </div>
      </div>
     </div>
     <div class="column is-half">
      <div class="card">
       <div class="card-content">
        <div class="media">
         <div class="media-left">
          <figure class="image is-48x48">
           <img alt="Real Python Logo" src="https://files.realpython.com/media/real-python-logo-thumbnail.7f0db70c2ed2.jpg?__no_cf_polish=1"/>
          </figure>
         </div>
         <div class="media-content">
          <h2 class="title is-5">
           Forest/woodland manager
          </h2>
          <h3 class="subtitle is-6 company">
           Blankenship, Knight and Powell
          </h3>
         </div>
        </div>
        <div class="content">
         <p class="location">
          Millsbury, AE
         </p>
         <p class="is-small has-text-grey">
          <time datetime="2021-04-08">
           2021-04-08
          </time>
         </p>
        </div>
        <footer class="card-footer">
         <a class="card-footer-item" href="https://www.realpython.com" target="_blank">
          Learn
         </a>
         <a class="card-footer-item" href="https://realpython.github.io/fake-jobs/jobs/forest-woodland-manager-71.html" target="_blank">
          Apply
         </a>
        </footer>
       </div>
      </div>
     </div>
     <div class="column is-half">
      <div class="card">
       <div class="card-content">
        <div class="media">
         <div class="media-left">
          <figure class="image is-48x48">
           <img alt="Real Python Logo" src="https://files.realpython.com/media/real-python-logo-thumbnail.7f0db70c2ed2.jpg?__no_cf_polish=1"/>
          </figure>
         </div>
         <div class="media-content">
          <h2 class="title is-5">
           Clinical cytogeneticist
          </h2>
          <h3 class="subtitle is-6 company">
           Patton, Haynes and Jones
          </h3>
         </div>
        </div>
        <div class="content">
         <p class="location">
          Lloydton, AP
         </p>
         <p class="is-small has-text-grey">
          <time datetime="2021-04-08">
           2021-04-08
          </time>
         </p>
        </div>
        <footer class="card-footer">
         <a class="card-footer-item" href="https://www.realpython.com" target="_blank">
          Learn
         </a>
         <a class="card-footer-item" href="https://realpython.github.io/fake-jobs/jobs/clinical-cytogeneticist-72.html" target="_blank">
          Apply
         </a>
        </footer>
       </div>
      </div>
     </div>
     <div class="column is-half">
      <div class="card">
       <div class="card-content">
        <div class="media">
         <div class="media-left">
          <figure class="image is-48x48">
           <img alt="Real Python Logo" src="https://files.realpython.com/media/real-python-logo-thumbnail.7f0db70c2ed2.jpg?__no_cf_polish=1"/>
          </figure>
         </div>
         <div class="media-content">
          <h2 class="title is-5">
           Print production planner
          </h2>
          <h3 class="subtitle is-6 company">
           Wood Inc
          </h3>
         </div>
        </div>
        <div class="content">
         <p class="location">
          Port Jeremy, AA
         </p>
         <p class="is-small has-text-grey">
          <time datetime="2021-04-08">
           2021-04-08
          </time>
         </p>
        </div>
        <footer class="card-footer">
         <a class="card-footer-item" href="https://www.realpython.com" target="_blank">
          Learn
         </a>
         <a class="card-footer-item" href="https://realpython.github.io/fake-jobs/jobs/print-production-planner-73.html" target="_blank">
          Apply
         </a>
        </footer>
       </div>
      </div>
     </div>
     <div class="column is-half">
      <div class="card">
       <div class="card-content">
        <div class="media">
         <div class="media-left">
          <figure class="image is-48x48">
           <img alt="Real Python Logo" src="https://files.realpython.com/media/real-python-logo-thumbnail.7f0db70c2ed2.jpg?__no_cf_polish=1"/>
          </figure>
         </div>
         <div class="media-content">
          <h2 class="title is-5">
           Systems developer
          </h2>
          <h3 class="subtitle is-6 company">
           Collins Group
          </h3>
         </div>
        </div>
        <div class="content">
         <p class="location">
          New Elizabethtown, AA
         </p>
         <p class="is-small has-text-grey">
          <time datetime="2021-04-08">
           2021-04-08
          </time>
         </p>
        </div>
        <footer class="card-footer">
         <a class="card-footer-item" href="https://www.realpython.com" target="_blank">
          Learn
         </a>
         <a class="card-footer-item" href="https://realpython.github.io/fake-jobs/jobs/systems-developer-74.html" target="_blank">
          Apply
         </a>
        </footer>
       </div>
      </div>
     </div>
     <div class="column is-half">
      <div class="card">
       <div class="card-content">
        <div class="media">
         <div class="media-left">
          <figure class="image is-48x48">
           <img alt="Real Python Logo" src="https://files.realpython.com/media/real-python-logo-thumbnail.7f0db70c2ed2.jpg?__no_cf_polish=1"/>
          </figure>
         </div>
         <div class="media-content">
          <h2 class="title is-5">
           Graphic designer
          </h2>
          <h3 class="subtitle is-6 company">
           Flores-Nelson
          </h3>
         </div>
        </div>
        <div class="content">
         <p class="location">
          Charlesstad, AE
         </p>
         <p class="is-small has-text-grey">
          <time datetime="2021-04-08">
           2021-04-08
          </time>
         </p>
        </div>
        <footer class="card-footer">
         <a class="card-footer-item" href="https://www.realpython.com" target="_blank">
          Learn
         </a>
         <a class="card-footer-item" href="https://realpython.github.io/fake-jobs/jobs/graphic-designer-75.html" target="_blank">
          Apply
         </a>
        </footer>
       </div>
      </div>
     </div>
     <div class="column is-half">
      <div class="card">
       <div class="card-content">
        <div class="media">
         <div class="media-left">
          <figure class="image is-48x48">
           <img alt="Real Python Logo" src="https://files.realpython.com/media/real-python-logo-thumbnail.7f0db70c2ed2.jpg?__no_cf_polish=1"/>
          </figure>
         </div>
         <div class="media-content">
          <h2 class="title is-5">
           Writer
          </h2>
          <h3 class="subtitle is-6 company">
           Mitchell, Jones and Olson
          </h3>
         </div>
        </div>
        <div class="content">
         <p class="location">
          Josephbury, AE
         </p>
         <p class="is-small has-text-grey">
          <time datetime="2021-04-08">
           2021-04-08
          </time>
         </p>
        </div>
        <footer class="card-footer">
         <a class="card-footer-item" href="https://www.realpython.com" target="_blank">
          Learn
         </a>
         <a class="card-footer-item" href="https://realpython.github.io/fake-jobs/jobs/writer-76.html" target="_blank">
          Apply
         </a>
        </footer>
       </div>
      </div>
     </div>
     <div class="column is-half">
      <div class="card">
       <div class="card-content">
        <div class="media">
         <div class="media-left">
          <figure class="image is-48x48">
           <img alt="Real Python Logo" src="https://files.realpython.com/media/real-python-logo-thumbnail.7f0db70c2ed2.jpg?__no_cf_polish=1"/>
          </figure>
         </div>
         <div class="media-content">
          <h2 class="title is-5">
           Field seismologist
          </h2>
          <h3 class="subtitle is-6 company">
           Howard Group
          </h3>
         </div>
        </div>
        <div class="content">
         <p class="location">
          Seanfurt, AA
         </p>
         <p class="is-small has-text-grey">
          <time datetime="2021-04-08">
           2021-04-08
          </time>
         </p>
        </div>
        <footer class="card-footer">
         <a class="card-footer-item" href="https://www.realpython.com" target="_blank">
          Learn
         </a>
         <a class="card-footer-item" href="https://realpython.github.io/fake-jobs/jobs/field-seismologist-77.html" target="_blank">
          Apply
         </a>
        </footer>
       </div>
      </div>
     </div>
     <div class="column is-half">
      <div class="card">
       <div class="card-content">
        <div class="media">
         <div class="media-left">
          <figure class="image is-48x48">
           <img alt="Real Python Logo" src="https://files.realpython.com/media/real-python-logo-thumbnail.7f0db70c2ed2.jpg?__no_cf_polish=1"/>
          </figure>
         </div>
         <div class="media-content">
          <h2 class="title is-5">
           Chief Strategy Officer
          </h2>
          <h3 class="subtitle is-6 company">
           Kramer-Edwards
          </h3>
         </div>
        </div>
        <div class="content">
         <p class="location">
          Williambury, AA
         </p>
         <p class="is-small has-text-grey">
          <time datetime="2021-04-08">
           2021-04-08
          </time>
         </p>
        </div>
        <footer class="card-footer">
         <a class="card-footer-item" href="https://www.realpython.com" target="_blank">
          Learn
         </a>
         <a class="card-footer-item" href="https://realpython.github.io/fake-jobs/jobs/chief-strategy-officer-78.html" target="_blank">
          Apply
         </a>
        </footer>
       </div>
      </div>
     </div>
     <div class="column is-half">
      <div class="card">
       <div class="card-content">
        <div class="media">
         <div class="media-left">
          <figure class="image is-48x48">
           <img alt="Real Python Logo" src="https://files.realpython.com/media/real-python-logo-thumbnail.7f0db70c2ed2.jpg?__no_cf_polish=1"/>
          </figure>
         </div>
         <div class="media-content">
          <h2 class="title is-5">
           Air cabin crew
          </h2>
          <h3 class="subtitle is-6 company">
           Berry-Houston
          </h3>
         </div>
        </div>
        <div class="content">
         <p class="location">
          South Jorgeside, AP
         </p>
         <p class="is-small has-text-grey">
          <time datetime="2021-04-08">
           2021-04-08
          </time>
         </p>
        </div>
        <footer class="card-footer">
         <a class="card-footer-item" href="https://www.realpython.com" target="_blank">
          Learn
         </a>
         <a class="card-footer-item" href="https://realpython.github.io/fake-jobs/jobs/air-cabin-crew-79.html" target="_blank">
          Apply
         </a>
        </footer>
       </div>
      </div>
     </div>
     <div class="column is-half">
      <div class="card">
       <div class="card-content">
        <div class="media">
         <div class="media-left">
          <figure class="image is-48x48">
           <img alt="Real Python Logo" src="https://files.realpython.com/media/real-python-logo-thumbnail.7f0db70c2ed2.jpg?__no_cf_polish=1"/>
          </figure>
         </div>
         <div class="media-content">
          <h2 class="title is-5">
           Python Programmer (Entry-Level)
          </h2>
          <h3 class="subtitle is-6 company">
           Mathews Inc
          </h3>
         </div>
        </div>
        <div class="content">
         <p class="location">
          Robertborough, AP
         </p>
         <p class="is-small has-text-grey">
          <time datetime="2021-04-08">
           2021-04-08
          </time>
         </p>
        </div>
        <footer class="card-footer">
         <a class="card-footer-item" href="https://www.realpython.com" target="_blank">
          Learn
         </a>
         <a class="card-footer-item" href="https://realpython.github.io/fake-jobs/jobs/python-programmer-entry-level-80.html" target="_blank">
          Apply
         </a>
        </footer>
       </div>
      </div>
     </div>
     <div class="column is-half">
      <div class="card">
       <div class="card-content">
        <div class="media">
         <div class="media-left">
          <figure class="image is-48x48">
           <img alt="Real Python Logo" src="https://files.realpython.com/media/real-python-logo-thumbnail.7f0db70c2ed2.jpg?__no_cf_polish=1"/>
          </figure>
         </div>
         <div class="media-content">
          <h2 class="title is-5">
           Warden/ranger
          </h2>
          <h3 class="subtitle is-6 company">
           Riley-Johnson
          </h3>
         </div>
        </div>
        <div class="content">
         <p class="location">
          South Saratown, AP
         </p>
         <p class="is-small has-text-grey">
          <time datetime="2021-04-08">
           2021-04-08
          </time>
         </p>
        </div>
        <footer class="card-footer">
         <a class="card-footer-item" href="https://www.realpython.com" target="_blank">
          Learn
         </a>
         <a class="card-footer-item" href="https://realpython.github.io/fake-jobs/jobs/warden-ranger-81.html" target="_blank">
          Apply
         </a>
        </footer>
       </div>
      </div>
     </div>
     <div class="column is-half">
      <div class="card">
       <div class="card-content">
        <div class="media">
         <div class="media-left">
          <figure class="image is-48x48">
           <img alt="Real Python Logo" src="https://files.realpython.com/media/real-python-logo-thumbnail.7f0db70c2ed2.jpg?__no_cf_polish=1"/>
          </figure>
         </div>
         <div class="media-content">
          <h2 class="title is-5">
           Sports therapist
          </h2>
          <h3 class="subtitle is-6 company">
           Spencer and Sons
          </h3>
         </div>
        </div>
        <div class="content">
         <p class="location">
          Hullview, AA
         </p>
         <p class="is-small has-text-grey">
          <time datetime="2021-04-08">
           2021-04-08
          </time>
         </p>
        </div>
        <footer class="card-footer">
         <a class="card-footer-item" href="https://www.realpython.com" target="_blank">
          Learn
         </a>
         <a class="card-footer-item" href="https://realpython.github.io/fake-jobs/jobs/sports-therapist-82.html" target="_blank">
          Apply
         </a>
        </footer>
       </div>
      </div>
     </div>
     <div class="column is-half">
      <div class="card">
       <div class="card-content">
        <div class="media">
         <div class="media-left">
          <figure class="image is-48x48">
           <img alt="Real Python Logo" src="https://files.realpython.com/media/real-python-logo-thumbnail.7f0db70c2ed2.jpg?__no_cf_polish=1"/>
          </figure>
         </div>
         <div class="media-content">
          <h2 class="title is-5">
           Arts development officer
          </h2>
          <h3 class="subtitle is-6 company">
           Camacho-Sanchez
          </h3>
         </div>
        </div>
        <div class="content">
         <p class="location">
          Philipland, AP
         </p>
         <p class="is-small has-text-grey">
          <time datetime="2021-04-08">
           2021-04-08
          </time>
         </p>
        </div>
        <footer class="card-footer">
         <a class="card-footer-item" href="https://www.realpython.com" target="_blank">
          Learn
         </a>
         <a class="card-footer-item" href="https://realpython.github.io/fake-jobs/jobs/arts-development-officer-83.html" target="_blank">
          Apply
         </a>
        </footer>
       </div>
      </div>
     </div>
     <div class="column is-half">
      <div class="card">
       <div class="card-content">
        <div class="media">
         <div class="media-left">
          <figure class="image is-48x48">
           <img alt="Real Python Logo" src="https://files.realpython.com/media/real-python-logo-thumbnail.7f0db70c2ed2.jpg?__no_cf_polish=1"/>
          </figure>
         </div>
         <div class="media-content">
          <h2 class="title is-5">
           Printmaker
          </h2>
          <h3 class="subtitle is-6 company">
           Oliver and Sons
          </h3>
         </div>
        </div>
        <div class="content">
         <p class="location">
          North Patty, AE
         </p>
         <p class="is-small has-text-grey">
          <time datetime="2021-04-08">
           2021-04-08
          </time>
         </p>
        </div>
        <footer class="card-footer">
         <a class="card-footer-item" href="https://www.realpython.com" target="_blank">
          Learn
         </a>
         <a class="card-footer-item" href="https://realpython.github.io/fake-jobs/jobs/printmaker-84.html" target="_blank">
          Apply
         </a>
        </footer>
       </div>
      </div>
     </div>
     <div class="column is-half">
      <div class="card">
       <div class="card-content">
        <div class="media">
         <div class="media-left">
          <figure class="image is-48x48">
           <img alt="Real Python Logo" src="https://files.realpython.com/media/real-python-logo-thumbnail.7f0db70c2ed2.jpg?__no_cf_polish=1"/>
          </figure>
         </div>
         <div class="media-content">
          <h2 class="title is-5">
           Health and safety adviser
          </h2>
          <h3 class="subtitle is-6 company">
           Eaton PLC
          </h3>
         </div>
        </div>
        <div class="content">
         <p class="location">
          North Stephen, AE
         </p>
         <p class="is-small has-text-grey">
          <time datetime="2021-04-08">
           2021-04-08
          </time>
         </p>
        </div>
        <footer class="card-footer">
         <a class="card-footer-item" href="https://www.realpython.com" target="_blank">
          Learn
         </a>
         <a class="card-footer-item" href="https://realpython.github.io/fake-jobs/jobs/health-and-safety-adviser-85.html" target="_blank">
          Apply
         </a>
        </footer>
       </div>
      </div>
     </div>
     <div class="column is-half">
      <div class="card">
       <div class="card-content">
        <div class="media">
         <div class="media-left">
          <figure class="image is-48x48">
           <img alt="Real Python Logo" src="https://files.realpython.com/media/real-python-logo-thumbnail.7f0db70c2ed2.jpg?__no_cf_polish=1"/>
          </figure>
         </div>
         <div class="media-content">
          <h2 class="title is-5">
           Manufacturing systems engineer
          </h2>
          <h3 class="subtitle is-6 company">
           Stanley-Frederick
          </h3>
         </div>
        </div>
        <div class="content">
         <p class="location">
          Stevensland, AP
         </p>
         <p class="is-small has-text-grey">
          <time datetime="2021-04-08">
           2021-04-08
          </time>
         </p>
        </div>
        <footer class="card-footer">
         <a class="card-footer-item" href="https://www.realpython.com" target="_blank">
          Learn
         </a>
         <a class="card-footer-item" href="https://realpython.github.io/fake-jobs/jobs/manufacturing-systems-engineer-86.html" target="_blank">
          Apply
         </a>
        </footer>
       </div>
      </div>
     </div>
     <div class="column is-half">
      <div class="card">
       <div class="card-content">
        <div class="media">
         <div class="media-left">
          <figure class="image is-48x48">
           <img alt="Real Python Logo" src="https://files.realpython.com/media/real-python-logo-thumbnail.7f0db70c2ed2.jpg?__no_cf_polish=1"/>
          </figure>
         </div>
         <div class="media-content">
          <h2 class="title is-5">
           Programmer, applications
          </h2>
          <h3 class="subtitle is-6 company">
           Bradley LLC
          </h3>
         </div>
        </div>
        <div class="content">
         <p class="location">
          Reyesstad, AE
         </p>
         <p class="is-small has-text-grey">
          <time datetime="2021-04-08">
           2021-04-08
          </time>
         </p>
        </div>
        <footer class="card-footer">
         <a class="card-footer-item" href="https://www.realpython.com" target="_blank">
          Learn
         </a>
         <a class="card-footer-item" href="https://realpython.github.io/fake-jobs/jobs/programmer-applications-87.html" target="_blank">
          Apply
         </a>
        </footer>
       </div>
      </div>
     </div>
     <div class="column is-half">
      <div class="card">
       <div class="card-content">
        <div class="media">
         <div class="media-left">
          <figure class="image is-48x48">
           <img alt="Real Python Logo" src="https://files.realpython.com/media/real-python-logo-thumbnail.7f0db70c2ed2.jpg?__no_cf_polish=1"/>
          </figure>
         </div>
         <div class="media-content">
          <h2 class="title is-5">
           Medical physicist
          </h2>
          <h3 class="subtitle is-6 company">
           Parker, Goodwin and Zavala
          </h3>
         </div>
        </div>
        <div class="content">
         <p class="location">
          Bellberg, AP
         </p>
         <p class="is-small has-text-grey">
          <time datetime="2021-04-08">
           2021-04-08
          </time>
         </p>
        </div>
        <footer class="card-footer">
         <a class="card-footer-item" href="https://www.realpython.com" target="_blank">
          Learn
         </a>
         <a class="card-footer-item" href="https://realpython.github.io/fake-jobs/jobs/medical-physicist-88.html" target="_blank">
          Apply
         </a>
        </footer>
       </div>
      </div>
     </div>
     <div class="column is-half">
      <div class="card">
       <div class="card-content">
        <div class="media">
         <div class="media-left">
          <figure class="image is-48x48">
           <img alt="Real Python Logo" src="https://files.realpython.com/media/real-python-logo-thumbnail.7f0db70c2ed2.jpg?__no_cf_polish=1"/>
          </figure>
         </div>
         <div class="media-content">
          <h2 class="title is-5">
           Media planner
          </h2>
          <h3 class="subtitle is-6 company">
           Kim-Miles
          </h3>
         </div>
        </div>
        <div class="content">
         <p class="location">
          North Johnland, AE
         </p>
         <p class="is-small has-text-grey">
          <time datetime="2021-04-08">
           2021-04-08
          </time>
         </p>
        </div>
        <footer class="card-footer">
         <a class="card-footer-item" href="https://www.realpython.com" target="_blank">
          Learn
         </a>
         <a class="card-footer-item" href="https://realpython.github.io/fake-jobs/jobs/media-planner-89.html" target="_blank">
          Apply
         </a>
        </footer>
       </div>
      </div>
     </div>
     <div class="column is-half">
      <div class="card">
       <div class="card-content">
        <div class="media">
         <div class="media-left">
          <figure class="image is-48x48">
           <img alt="Real Python Logo" src="https://files.realpython.com/media/real-python-logo-thumbnail.7f0db70c2ed2.jpg?__no_cf_polish=1"/>
          </figure>
         </div>
         <div class="media-content">
          <h2 class="title is-5">
           Software Developer (Python)
          </h2>
          <h3 class="subtitle is-6 company">
           Moreno-Rodriguez
          </h3>
         </div>
        </div>
        <div class="content">
         <p class="location">
          Martinezburgh, AE
         </p>
         <p class="is-small has-text-grey">
          <time datetime="2021-04-08">
           2021-04-08
          </time>
         </p>
        </div>
        <footer class="card-footer">
         <a class="card-footer-item" href="https://www.realpython.com" target="_blank">
          Learn
         </a>
         <a class="card-footer-item" href="https://realpython.github.io/fake-jobs/jobs/software-developer-python-90.html" target="_blank">
          Apply
         </a>
        </footer>
       </div>
      </div>
     </div>
     <div class="column is-half">
      <div class="card">
       <div class="card-content">
        <div class="media">
         <div class="media-left">
          <figure class="image is-48x48">
           <img alt="Real Python Logo" src="https://files.realpython.com/media/real-python-logo-thumbnail.7f0db70c2ed2.jpg?__no_cf_polish=1"/>
          </figure>
         </div>
         <div class="media-content">
          <h2 class="title is-5">
           Surveyor, land/geomatics
          </h2>
          <h3 class="subtitle is-6 company">
           Brown-Ortiz
          </h3>
         </div>
        </div>
        <div class="content">
         <p class="location">
          Joshuatown, AE
         </p>
         <p class="is-small has-text-grey">
          <time datetime="2021-04-08">
           2021-04-08
          </time>
         </p>
        </div>
        <footer class="card-footer">
         <a class="card-footer-item" href="https://www.realpython.com" target="_blank">
          Learn
         </a>
         <a class="card-footer-item" href="https://realpython.github.io/fake-jobs/jobs/surveyor-land-geomatics-91.html" target="_blank">
          Apply
         </a>
        </footer>
       </div>
      </div>
     </div>
     <div class="column is-half">
      <div class="card">
       <div class="card-content">
        <div class="media">
         <div class="media-left">
          <figure class="image is-48x48">
           <img alt="Real Python Logo" src="https://files.realpython.com/media/real-python-logo-thumbnail.7f0db70c2ed2.jpg?__no_cf_polish=1"/>
          </figure>
         </div>
         <div class="media-content">
          <h2 class="title is-5">
           Legal executive
          </h2>
          <h3 class="subtitle is-6 company">
           Hartman PLC
          </h3>
         </div>
        </div>
        <div class="content">
         <p class="location">
          West Ericstad, AA
         </p>
         <p class="is-small has-text-grey">
          <time datetime="2021-04-08">
           2021-04-08
          </time>
         </p>
        </div>
        <footer class="card-footer">
         <a class="card-footer-item" href="https://www.realpython.com" target="_blank">
          Learn
         </a>
         <a class="card-footer-item" href="https://realpython.github.io/fake-jobs/jobs/legal-executive-92.html" target="_blank">
          Apply
         </a>
        </footer>
       </div>
      </div>
     </div>
     <div class="column is-half">
      <div class="card">
       <div class="card-content">
        <div class="media">
         <div class="media-left">
          <figure class="image is-48x48">
           <img alt="Real Python Logo" src="https://files.realpython.com/media/real-python-logo-thumbnail.7f0db70c2ed2.jpg?__no_cf_polish=1"/>
          </figure>
         </div>
         <div class="media-content">
          <h2 class="title is-5">
           Librarian, academic
          </h2>
          <h3 class="subtitle is-6 company">
           Brooks Inc
          </h3>
         </div>
        </div>
        <div class="content">
         <p class="location">
          Tuckertown, AE
         </p>
         <p class="is-small has-text-grey">
          <time datetime="2021-04-08">
           2021-04-08
          </time>
         </p>
        </div>
        <footer class="card-footer">
         <a class="card-footer-item" href="https://www.realpython.com" target="_blank">
          Learn
         </a>
         <a class="card-footer-item" href="https://realpython.github.io/fake-jobs/jobs/librarian-academic-93.html" target="_blank">
          Apply
         </a>
        </footer>
       </div>
      </div>
     </div>
     <div class="column is-half">
      <div class="card">
       <div class="card-content">
        <div class="media">
         <div class="media-left">
          <figure class="image is-48x48">
           <img alt="Real Python Logo" src="https://files.realpython.com/media/real-python-logo-thumbnail.7f0db70c2ed2.jpg?__no_cf_polish=1"/>
          </figure>
         </div>
         <div class="media-content">
          <h2 class="title is-5">
           Barrister
          </h2>
          <h3 class="subtitle is-6 company">
           Washington-Castillo
          </h3>
         </div>
        </div>
        <div class="content">
         <p class="location">
          Perezton, AE
         </p>
         <p class="is-small has-text-grey">
          <time datetime="2021-04-08">
           2021-04-08
          </time>
         </p>
        </div>
        <footer class="card-footer">
         <a class="card-footer-item" href="https://www.realpython.com" target="_blank">
          Learn
         </a>
         <a class="card-footer-item" href="https://realpython.github.io/fake-jobs/jobs/barrister-94.html" target="_blank">
          Apply
         </a>
        </footer>
       </div>
      </div>
     </div>
     <div class="column is-half">
      <div class="card">
       <div class="card-content">
        <div class="media">
         <div class="media-left">
          <figure class="image is-48x48">
           <img alt="Real Python Logo" src="https://files.realpython.com/media/real-python-logo-thumbnail.7f0db70c2ed2.jpg?__no_cf_polish=1"/>
          </figure>
         </div>
         <div class="media-content">
          <h2 class="title is-5">
           Museum/gallery exhibitions officer
          </h2>
          <h3 class="subtitle is-6 company">
           Nguyen, Yoder and Petty
          </h3>
         </div>
        </div>
        <div class="content">
         <p class="location">
          Lake Abigail, AE
         </p>
         <p class="is-small has-text-grey">
          <time datetime="2021-04-08">
           2021-04-08
          </time>
         </p>
        </div>
        <footer class="card-footer">
         <a class="card-footer-item" href="https://www.realpython.com" target="_blank">
          Learn
         </a>
         <a class="card-footer-item" href="https://realpython.github.io/fake-jobs/jobs/museum-gallery-exhibitions-officer-95.html" target="_blank">
          Apply
         </a>
        </footer>
       </div>
      </div>
     </div>
     <div class="column is-half">
      <div class="card">
       <div class="card-content">
        <div class="media">
         <div class="media-left">
          <figure class="image is-48x48">
           <img alt="Real Python Logo" src="https://files.realpython.com/media/real-python-logo-thumbnail.7f0db70c2ed2.jpg?__no_cf_polish=1"/>
          </figure>
         </div>
         <div class="media-content">
          <h2 class="title is-5">
           Radiographer, diagnostic
          </h2>
          <h3 class="subtitle is-6 company">
           Holder LLC
          </h3>
         </div>
        </div>
        <div class="content">
         <p class="location">
          Jacobshire, AP
         </p>
         <p class="is-small has-text-grey">
          <time datetime="2021-04-08">
           2021-04-08
          </time>
         </p>
        </div>
        <footer class="card-footer">
         <a class="card-footer-item" href="https://www.realpython.com" target="_blank">
          Learn
         </a>
         <a class="card-footer-item" href="https://realpython.github.io/fake-jobs/jobs/radiographer-diagnostic-96.html" target="_blank">
          Apply
         </a>
        </footer>
       </div>
      </div>
     </div>
     <div class="column is-half">
      <div class="card">
       <div class="card-content">
        <div class="media">
         <div class="media-left">
          <figure class="image is-48x48">
           <img alt="Real Python Logo" src="https://files.realpython.com/media/real-python-logo-thumbnail.7f0db70c2ed2.jpg?__no_cf_polish=1"/>
          </figure>
         </div>
         <div class="media-content">
          <h2 class="title is-5">
           Database administrator
          </h2>
          <h3 class="subtitle is-6 company">
           Yates-Ferguson
          </h3>
         </div>
        </div>
        <div class="content">
         <p class="location">
          Port Susan, AE
         </p>
         <p class="is-small has-text-grey">
          <time datetime="2021-04-08">
           2021-04-08
          </time>
         </p>
        </div>
        <footer class="card-footer">
         <a class="card-footer-item" href="https://www.realpython.com" target="_blank">
          Learn
         </a>
         <a class="card-footer-item" href="https://realpython.github.io/fake-jobs/jobs/database-administrator-97.html" target="_blank">
          Apply
         </a>
        </footer>
       </div>
      </div>
     </div>
     <div class="column is-half">
      <div class="card">
       <div class="card-content">
        <div class="media">
         <div class="media-left">
          <figure class="image is-48x48">
           <img alt="Real Python Logo" src="https://files.realpython.com/media/real-python-logo-thumbnail.7f0db70c2ed2.jpg?__no_cf_polish=1"/>
          </figure>
         </div>
         <div class="media-content">
          <h2 class="title is-5">
           Furniture designer
          </h2>
          <h3 class="subtitle is-6 company">
           Ortega-Lawrence
          </h3>
         </div>
        </div>
        <div class="content">
         <p class="location">
          North Tiffany, AA
         </p>
         <p class="is-small has-text-grey">
          <time datetime="2021-04-08">
           2021-04-08
          </time>
         </p>
        </div>
        <footer class="card-footer">
         <a class="card-footer-item" href="https://www.realpython.com" target="_blank">
          Learn
         </a>
         <a class="card-footer-item" href="https://realpython.github.io/fake-jobs/jobs/furniture-designer-98.html" target="_blank">
          Apply
         </a>
        </footer>
       </div>
      </div>
     </div>
     <div class="column is-half">
      <div class="card">
       <div class="card-content">
        <div class="media">
         <div class="media-left">
          <figure class="image is-48x48">
           <img alt="Real Python Logo" src="https://files.realpython.com/media/real-python-logo-thumbnail.7f0db70c2ed2.jpg?__no_cf_polish=1"/>
          </figure>
         </div>
         <div class="media-content">
          <h2 class="title is-5">
           Ship broker
          </h2>
          <h3 class="subtitle is-6 company">
           Fuentes, Walls and Castro
          </h3>
         </div>
        </div>
        <div class="content">
         <p class="location">
          Michelleville, AP
         </p>
         <p class="is-small has-text-grey">
          <time datetime="2021-04-08">
           2021-04-08
          </time>
         </p>
        </div>
        <footer class="card-footer">
         <a class="card-footer-item" href="https://www.realpython.com" target="_blank">
          Learn
         </a>
         <a class="card-footer-item" href="https://realpython.github.io/fake-jobs/jobs/ship-broker-99.html" target="_blank">
          Apply
         </a>
        </footer>
       </div>
      </div>
     </div>
    </div>
    


## Find Elements by HTML Class Name

Now that we have this object that holds the individual job listings, we can access the individual cards and all of the information in them.


```python
# finds all the divs within the container, with class "card-content"
job_elements = ids.find_all("div", class_="card-content")
```


```python
# loop through each div, and print its contents

for job_element in job_elements:
    print(job_element.prettify())
    print("------")
```

    <div class="card-content">
     <div class="media">
      <div class="media-left">
       <figure class="image is-48x48">
        <img alt="Real Python Logo" src="https://files.realpython.com/media/real-python-logo-thumbnail.7f0db70c2ed2.jpg?__no_cf_polish=1"/>
       </figure>
      </div>
      <div class="media-content">
       <h2 class="title is-5">
        Senior Python Developer
       </h2>
       <h3 class="subtitle is-6 company">
        Payne, Roberts and Davis
       </h3>
      </div>
     </div>
     <div class="content">
      <p class="location">
       Stewartbury, AA
      </p>
      <p class="is-small has-text-grey">
       <time datetime="2021-04-08">
        2021-04-08
       </time>
      </p>
     </div>
     <footer class="card-footer">
      <a class="card-footer-item" href="https://www.realpython.com" target="_blank">
       Learn
      </a>
      <a class="card-footer-item" href="https://realpython.github.io/fake-jobs/jobs/senior-python-developer-0.html" target="_blank">
       Apply
      </a>
     </footer>
    </div>
    
    ------
    <div class="card-content">
     <div class="media">
      <div class="media-left">
       <figure class="image is-48x48">
        <img alt="Real Python Logo" src="https://files.realpython.com/media/real-python-logo-thumbnail.7f0db70c2ed2.jpg?__no_cf_polish=1"/>
       </figure>
      </div>
      <div class="media-content">
       <h2 class="title is-5">
        Energy engineer
       </h2>
       <h3 class="subtitle is-6 company">
        Vasquez-Davidson
       </h3>
      </div>
     </div>
     <div class="content">
      <p class="location">
       Christopherville, AA
      </p>
      <p class="is-small has-text-grey">
       <time datetime="2021-04-08">
        2021-04-08
       </time>
      </p>
     </div>
     <footer class="card-footer">
      <a class="card-footer-item" href="https://www.realpython.com" target="_blank">
       Learn
      </a>
      <a class="card-footer-item" href="https://realpython.github.io/fake-jobs/jobs/energy-engineer-1.html" target="_blank">
       Apply
      </a>
     </footer>
    </div>
    
    ------
    <div class="card-content">
     <div class="media">
      <div class="media-left">
       <figure class="image is-48x48">
        <img alt="Real Python Logo" src="https://files.realpython.com/media/real-python-logo-thumbnail.7f0db70c2ed2.jpg?__no_cf_polish=1"/>
       </figure>
      </div>
      <div class="media-content">
       <h2 class="title is-5">
        Legal executive
       </h2>
       <h3 class="subtitle is-6 company">
        Jackson, Chambers and Levy
       </h3>
      </div>
     </div>
     <div class="content">
      <p class="location">
       Port Ericaburgh, AA
      </p>
      <p class="is-small has-text-grey">
       <time datetime="2021-04-08">
        2021-04-08
       </time>
      </p>
     </div>
     <footer class="card-footer">
      <a class="card-footer-item" href="https://www.realpython.com" target="_blank">
       Learn
      </a>
      <a class="card-footer-item" href="https://realpython.github.io/fake-jobs/jobs/legal-executive-2.html" target="_blank">
       Apply
      </a>
     </footer>
    </div>
    
    ------
    <div class="card-content">
     <div class="media">
      <div class="media-left">
       <figure class="image is-48x48">
        <img alt="Real Python Logo" src="https://files.realpython.com/media/real-python-logo-thumbnail.7f0db70c2ed2.jpg?__no_cf_polish=1"/>
       </figure>
      </div>
      <div class="media-content">
       <h2 class="title is-5">
        Fitness centre manager
       </h2>
       <h3 class="subtitle is-6 company">
        Savage-Bradley
       </h3>
      </div>
     </div>
     <div class="content">
      <p class="location">
       East Seanview, AP
      </p>
      <p class="is-small has-text-grey">
       <time datetime="2021-04-08">
        2021-04-08
       </time>
      </p>
     </div>
     <footer class="card-footer">
      <a class="card-footer-item" href="https://www.realpython.com" target="_blank">
       Learn
      </a>
      <a class="card-footer-item" href="https://realpython.github.io/fake-jobs/jobs/fitness-centre-manager-3.html" target="_blank">
       Apply
      </a>
     </footer>
    </div>
    
    ------
    <div class="card-content">
     <div class="media">
      <div class="media-left">
       <figure class="image is-48x48">
        <img alt="Real Python Logo" src="https://files.realpython.com/media/real-python-logo-thumbnail.7f0db70c2ed2.jpg?__no_cf_polish=1"/>
       </figure>
      </div>
      <div class="media-content">
       <h2 class="title is-5">
        Product manager
       </h2>
       <h3 class="subtitle is-6 company">
        Ramirez Inc
       </h3>
      </div>
     </div>
     <div class="content">
      <p class="location">
       North Jamieview, AP
      </p>
      <p class="is-small has-text-grey">
       <time datetime="2021-04-08">
        2021-04-08
       </time>
      </p>
     </div>
     <footer class="card-footer">
      <a class="card-footer-item" href="https://www.realpython.com" target="_blank">
       Learn
      </a>
      <a class="card-footer-item" href="https://realpython.github.io/fake-jobs/jobs/product-manager-4.html" target="_blank">
       Apply
      </a>
     </footer>
    </div>
    
    ------
    <div class="card-content">
     <div class="media">
      <div class="media-left">
       <figure class="image is-48x48">
        <img alt="Real Python Logo" src="https://files.realpython.com/media/real-python-logo-thumbnail.7f0db70c2ed2.jpg?__no_cf_polish=1"/>
       </figure>
      </div>
      <div class="media-content">
       <h2 class="title is-5">
        Medical technical officer
       </h2>
       <h3 class="subtitle is-6 company">
        Rogers-Yates
       </h3>
      </div>
     </div>
     <div class="content">
      <p class="location">
       Davidville, AP
      </p>
      <p class="is-small has-text-grey">
       <time datetime="2021-04-08">
        2021-04-08
       </time>
      </p>
     </div>
     <footer class="card-footer">
      <a class="card-footer-item" href="https://www.realpython.com" target="_blank">
       Learn
      </a>
      <a class="card-footer-item" href="https://realpython.github.io/fake-jobs/jobs/medical-technical-officer-5.html" target="_blank">
       Apply
      </a>
     </footer>
    </div>
    
    ------
    <div class="card-content">
     <div class="media">
      <div class="media-left">
       <figure class="image is-48x48">
        <img alt="Real Python Logo" src="https://files.realpython.com/media/real-python-logo-thumbnail.7f0db70c2ed2.jpg?__no_cf_polish=1"/>
       </figure>
      </div>
      <div class="media-content">
       <h2 class="title is-5">
        Physiological scientist
       </h2>
       <h3 class="subtitle is-6 company">
        Kramer-Klein
       </h3>
      </div>
     </div>
     <div class="content">
      <p class="location">
       South Christopher, AE
      </p>
      <p class="is-small has-text-grey">
       <time datetime="2021-04-08">
        2021-04-08
       </time>
      </p>
     </div>
     <footer class="card-footer">
      <a class="card-footer-item" href="https://www.realpython.com" target="_blank">
       Learn
      </a>
      <a class="card-footer-item" href="https://realpython.github.io/fake-jobs/jobs/physiological-scientist-6.html" target="_blank">
       Apply
      </a>
     </footer>
    </div>
    
    ------
    <div class="card-content">
     <div class="media">
      <div class="media-left">
       <figure class="image is-48x48">
        <img alt="Real Python Logo" src="https://files.realpython.com/media/real-python-logo-thumbnail.7f0db70c2ed2.jpg?__no_cf_polish=1"/>
       </figure>
      </div>
      <div class="media-content">
       <h2 class="title is-5">
        Textile designer
       </h2>
       <h3 class="subtitle is-6 company">
        Meyers-Johnson
       </h3>
      </div>
     </div>
     <div class="content">
      <p class="location">
       Port Jonathan, AE
      </p>
      <p class="is-small has-text-grey">
       <time datetime="2021-04-08">
        2021-04-08
       </time>
      </p>
     </div>
     <footer class="card-footer">
      <a class="card-footer-item" href="https://www.realpython.com" target="_blank">
       Learn
      </a>
      <a class="card-footer-item" href="https://realpython.github.io/fake-jobs/jobs/textile-designer-7.html" target="_blank">
       Apply
      </a>
     </footer>
    </div>
    
    ------
    <div class="card-content">
     <div class="media">
      <div class="media-left">
       <figure class="image is-48x48">
        <img alt="Real Python Logo" src="https://files.realpython.com/media/real-python-logo-thumbnail.7f0db70c2ed2.jpg?__no_cf_polish=1"/>
       </figure>
      </div>
      <div class="media-content">
       <h2 class="title is-5">
        Television floor manager
       </h2>
       <h3 class="subtitle is-6 company">
        Hughes-Williams
       </h3>
      </div>
     </div>
     <div class="content">
      <p class="location">
       Osbornetown, AE
      </p>
      <p class="is-small has-text-grey">
       <time datetime="2021-04-08">
        2021-04-08
       </time>
      </p>
     </div>
     <footer class="card-footer">
      <a class="card-footer-item" href="https://www.realpython.com" target="_blank">
       Learn
      </a>
      <a class="card-footer-item" href="https://realpython.github.io/fake-jobs/jobs/television-floor-manager-8.html" target="_blank">
       Apply
      </a>
     </footer>
    </div>
    
    ------
    <div class="card-content">
     <div class="media">
      <div class="media-left">
       <figure class="image is-48x48">
        <img alt="Real Python Logo" src="https://files.realpython.com/media/real-python-logo-thumbnail.7f0db70c2ed2.jpg?__no_cf_polish=1"/>
       </figure>
      </div>
      <div class="media-content">
       <h2 class="title is-5">
        Waste management officer
       </h2>
       <h3 class="subtitle is-6 company">
        Jones, Williams and Villa
       </h3>
      </div>
     </div>
     <div class="content">
      <p class="location">
       Scotttown, AP
      </p>
      <p class="is-small has-text-grey">
       <time datetime="2021-04-08">
        2021-04-08
       </time>
      </p>
     </div>
     <footer class="card-footer">
      <a class="card-footer-item" href="https://www.realpython.com" target="_blank">
       Learn
      </a>
      <a class="card-footer-item" href="https://realpython.github.io/fake-jobs/jobs/waste-management-officer-9.html" target="_blank">
       Apply
      </a>
     </footer>
    </div>
    
    ------
    <div class="card-content">
     <div class="media">
      <div class="media-left">
       <figure class="image is-48x48">
        <img alt="Real Python Logo" src="https://files.realpython.com/media/real-python-logo-thumbnail.7f0db70c2ed2.jpg?__no_cf_polish=1"/>
       </figure>
      </div>
      <div class="media-content">
       <h2 class="title is-5">
        Software Engineer (Python)
       </h2>
       <h3 class="subtitle is-6 company">
        Garcia PLC
       </h3>
      </div>
     </div>
     <div class="content">
      <p class="location">
       Ericberg, AE
      </p>
      <p class="is-small has-text-grey">
       <time datetime="2021-04-08">
        2021-04-08
       </time>
      </p>
     </div>
     <footer class="card-footer">
      <a class="card-footer-item" href="https://www.realpython.com" target="_blank">
       Learn
      </a>
      <a class="card-footer-item" href="https://realpython.github.io/fake-jobs/jobs/software-engineer-python-10.html" target="_blank">
       Apply
      </a>
     </footer>
    </div>
    
    ------
    <div class="card-content">
     <div class="media">
      <div class="media-left">
       <figure class="image is-48x48">
        <img alt="Real Python Logo" src="https://files.realpython.com/media/real-python-logo-thumbnail.7f0db70c2ed2.jpg?__no_cf_polish=1"/>
       </figure>
      </div>
      <div class="media-content">
       <h2 class="title is-5">
        Interpreter
       </h2>
       <h3 class="subtitle is-6 company">
        Gregory and Sons
       </h3>
      </div>
     </div>
     <div class="content">
      <p class="location">
       Ramireztown, AE
      </p>
      <p class="is-small has-text-grey">
       <time datetime="2021-04-08">
        2021-04-08
       </time>
      </p>
     </div>
     <footer class="card-footer">
      <a class="card-footer-item" href="https://www.realpython.com" target="_blank">
       Learn
      </a>
      <a class="card-footer-item" href="https://realpython.github.io/fake-jobs/jobs/interpreter-11.html" target="_blank">
       Apply
      </a>
     </footer>
    </div>
    
    ------
    <div class="card-content">
     <div class="media">
      <div class="media-left">
       <figure class="image is-48x48">
        <img alt="Real Python Logo" src="https://files.realpython.com/media/real-python-logo-thumbnail.7f0db70c2ed2.jpg?__no_cf_polish=1"/>
       </figure>
      </div>
      <div class="media-content">
       <h2 class="title is-5">
        Architect
       </h2>
       <h3 class="subtitle is-6 company">
        Clark, Garcia and Sosa
       </h3>
      </div>
     </div>
     <div class="content">
      <p class="location">
       Figueroaview, AA
      </p>
      <p class="is-small has-text-grey">
       <time datetime="2021-04-08">
        2021-04-08
       </time>
      </p>
     </div>
     <footer class="card-footer">
      <a class="card-footer-item" href="https://www.realpython.com" target="_blank">
       Learn
      </a>
      <a class="card-footer-item" href="https://realpython.github.io/fake-jobs/jobs/architect-12.html" target="_blank">
       Apply
      </a>
     </footer>
    </div>
    
    ------
    <div class="card-content">
     <div class="media">
      <div class="media-left">
       <figure class="image is-48x48">
        <img alt="Real Python Logo" src="https://files.realpython.com/media/real-python-logo-thumbnail.7f0db70c2ed2.jpg?__no_cf_polish=1"/>
       </figure>
      </div>
      <div class="media-content">
       <h2 class="title is-5">
        Meteorologist
       </h2>
       <h3 class="subtitle is-6 company">
        Bush PLC
       </h3>
      </div>
     </div>
     <div class="content">
      <p class="location">
       Kelseystad, AA
      </p>
      <p class="is-small has-text-grey">
       <time datetime="2021-04-08">
        2021-04-08
       </time>
      </p>
     </div>
     <footer class="card-footer">
      <a class="card-footer-item" href="https://www.realpython.com" target="_blank">
       Learn
      </a>
      <a class="card-footer-item" href="https://realpython.github.io/fake-jobs/jobs/meteorologist-13.html" target="_blank">
       Apply
      </a>
     </footer>
    </div>
    
    ------
    <div class="card-content">
     <div class="media">
      <div class="media-left">
       <figure class="image is-48x48">
        <img alt="Real Python Logo" src="https://files.realpython.com/media/real-python-logo-thumbnail.7f0db70c2ed2.jpg?__no_cf_polish=1"/>
       </figure>
      </div>
      <div class="media-content">
       <h2 class="title is-5">
        Audiological scientist
       </h2>
       <h3 class="subtitle is-6 company">
        Salazar-Meyers
       </h3>
      </div>
     </div>
     <div class="content">
      <p class="location">
       Williamsburgh, AE
      </p>
      <p class="is-small has-text-grey">
       <time datetime="2021-04-08">
        2021-04-08
       </time>
      </p>
     </div>
     <footer class="card-footer">
      <a class="card-footer-item" href="https://www.realpython.com" target="_blank">
       Learn
      </a>
      <a class="card-footer-item" href="https://realpython.github.io/fake-jobs/jobs/audiological-scientist-14.html" target="_blank">
       Apply
      </a>
     </footer>
    </div>
    
    ------
    <div class="card-content">
     <div class="media">
      <div class="media-left">
       <figure class="image is-48x48">
        <img alt="Real Python Logo" src="https://files.realpython.com/media/real-python-logo-thumbnail.7f0db70c2ed2.jpg?__no_cf_polish=1"/>
       </figure>
      </div>
      <div class="media-content">
       <h2 class="title is-5">
        English as a second language teacher
       </h2>
       <h3 class="subtitle is-6 company">
        Parker, Murphy and Brooks
       </h3>
      </div>
     </div>
     <div class="content">
      <p class="location">
       Mitchellburgh, AE
      </p>
      <p class="is-small has-text-grey">
       <time datetime="2021-04-08">
        2021-04-08
       </time>
      </p>
     </div>
     <footer class="card-footer">
      <a class="card-footer-item" href="https://www.realpython.com" target="_blank">
       Learn
      </a>
      <a class="card-footer-item" href="https://realpython.github.io/fake-jobs/jobs/english-as-a-second-language-teacher-15.html" target="_blank">
       Apply
      </a>
     </footer>
    </div>
    
    ------
    <div class="card-content">
     <div class="media">
      <div class="media-left">
       <figure class="image is-48x48">
        <img alt="Real Python Logo" src="https://files.realpython.com/media/real-python-logo-thumbnail.7f0db70c2ed2.jpg?__no_cf_polish=1"/>
       </figure>
      </div>
      <div class="media-content">
       <h2 class="title is-5">
        Surgeon
       </h2>
       <h3 class="subtitle is-6 company">
        Cruz-Brown
       </h3>
      </div>
     </div>
     <div class="content">
      <p class="location">
       West Jessicabury, AA
      </p>
      <p class="is-small has-text-grey">
       <time datetime="2021-04-08">
        2021-04-08
       </time>
      </p>
     </div>
     <footer class="card-footer">
      <a class="card-footer-item" href="https://www.realpython.com" target="_blank">
       Learn
      </a>
      <a class="card-footer-item" href="https://realpython.github.io/fake-jobs/jobs/surgeon-16.html" target="_blank">
       Apply
      </a>
     </footer>
    </div>
    
    ------
    <div class="card-content">
     <div class="media">
      <div class="media-left">
       <figure class="image is-48x48">
        <img alt="Real Python Logo" src="https://files.realpython.com/media/real-python-logo-thumbnail.7f0db70c2ed2.jpg?__no_cf_polish=1"/>
       </figure>
      </div>
      <div class="media-content">
       <h2 class="title is-5">
        Equities trader
       </h2>
       <h3 class="subtitle is-6 company">
        Macdonald-Ferguson
       </h3>
      </div>
     </div>
     <div class="content">
      <p class="location">
       Maloneshire, AE
      </p>
      <p class="is-small has-text-grey">
       <time datetime="2021-04-08">
        2021-04-08
       </time>
      </p>
     </div>
     <footer class="card-footer">
      <a class="card-footer-item" href="https://www.realpython.com" target="_blank">
       Learn
      </a>
      <a class="card-footer-item" href="https://realpython.github.io/fake-jobs/jobs/equities-trader-17.html" target="_blank">
       Apply
      </a>
     </footer>
    </div>
    
    ------
    <div class="card-content">
     <div class="media">
      <div class="media-left">
       <figure class="image is-48x48">
        <img alt="Real Python Logo" src="https://files.realpython.com/media/real-python-logo-thumbnail.7f0db70c2ed2.jpg?__no_cf_polish=1"/>
       </figure>
      </div>
      <div class="media-content">
       <h2 class="title is-5">
        Newspaper journalist
       </h2>
       <h3 class="subtitle is-6 company">
        Williams, Peterson and Rojas
       </h3>
      </div>
     </div>
     <div class="content">
      <p class="location">
       Johnsonton, AA
      </p>
      <p class="is-small has-text-grey">
       <time datetime="2021-04-08">
        2021-04-08
       </time>
      </p>
     </div>
     <footer class="card-footer">
      <a class="card-footer-item" href="https://www.realpython.com" target="_blank">
       Learn
      </a>
      <a class="card-footer-item" href="https://realpython.github.io/fake-jobs/jobs/newspaper-journalist-18.html" target="_blank">
       Apply
      </a>
     </footer>
    </div>
    
    ------
    <div class="card-content">
     <div class="media">
      <div class="media-left">
       <figure class="image is-48x48">
        <img alt="Real Python Logo" src="https://files.realpython.com/media/real-python-logo-thumbnail.7f0db70c2ed2.jpg?__no_cf_polish=1"/>
       </figure>
      </div>
      <div class="media-content">
       <h2 class="title is-5">
        Materials engineer
       </h2>
       <h3 class="subtitle is-6 company">
        Smith and Sons
       </h3>
      </div>
     </div>
     <div class="content">
      <p class="location">
       South Davidtown, AP
      </p>
      <p class="is-small has-text-grey">
       <time datetime="2021-04-08">
        2021-04-08
       </time>
      </p>
     </div>
     <footer class="card-footer">
      <a class="card-footer-item" href="https://www.realpython.com" target="_blank">
       Learn
      </a>
      <a class="card-footer-item" href="https://realpython.github.io/fake-jobs/jobs/materials-engineer-19.html" target="_blank">
       Apply
      </a>
     </footer>
    </div>
    
    ------
    <div class="card-content">
     <div class="media">
      <div class="media-left">
       <figure class="image is-48x48">
        <img alt="Real Python Logo" src="https://files.realpython.com/media/real-python-logo-thumbnail.7f0db70c2ed2.jpg?__no_cf_polish=1"/>
       </figure>
      </div>
      <div class="media-content">
       <h2 class="title is-5">
        Python Programmer (Entry-Level)
       </h2>
       <h3 class="subtitle is-6 company">
        Moss, Duncan and Allen
       </h3>
      </div>
     </div>
     <div class="content">
      <p class="location">
       Port Sara, AE
      </p>
      <p class="is-small has-text-grey">
       <time datetime="2021-04-08">
        2021-04-08
       </time>
      </p>
     </div>
     <footer class="card-footer">
      <a class="card-footer-item" href="https://www.realpython.com" target="_blank">
       Learn
      </a>
      <a class="card-footer-item" href="https://realpython.github.io/fake-jobs/jobs/python-programmer-entry-level-20.html" target="_blank">
       Apply
      </a>
     </footer>
    </div>
    
    ------
    <div class="card-content">
     <div class="media">
      <div class="media-left">
       <figure class="image is-48x48">
        <img alt="Real Python Logo" src="https://files.realpython.com/media/real-python-logo-thumbnail.7f0db70c2ed2.jpg?__no_cf_polish=1"/>
       </figure>
      </div>
      <div class="media-content">
       <h2 class="title is-5">
        Product/process development scientist
       </h2>
       <h3 class="subtitle is-6 company">
        Gomez-Carroll
       </h3>
      </div>
     </div>
     <div class="content">
      <p class="location">
       Marktown, AA
      </p>
      <p class="is-small has-text-grey">
       <time datetime="2021-04-08">
        2021-04-08
       </time>
      </p>
     </div>
     <footer class="card-footer">
      <a class="card-footer-item" href="https://www.realpython.com" target="_blank">
       Learn
      </a>
      <a class="card-footer-item" href="https://realpython.github.io/fake-jobs/jobs/product-process-development-scientist-21.html" target="_blank">
       Apply
      </a>
     </footer>
    </div>
    
    ------
    <div class="card-content">
     <div class="media">
      <div class="media-left">
       <figure class="image is-48x48">
        <img alt="Real Python Logo" src="https://files.realpython.com/media/real-python-logo-thumbnail.7f0db70c2ed2.jpg?__no_cf_polish=1"/>
       </figure>
      </div>
      <div class="media-content">
       <h2 class="title is-5">
        Scientist, research (maths)
       </h2>
       <h3 class="subtitle is-6 company">
        Manning, Welch and Herring
       </h3>
      </div>
     </div>
     <div class="content">
      <p class="location">
       Laurenland, AE
      </p>
      <p class="is-small has-text-grey">
       <time datetime="2021-04-08">
        2021-04-08
       </time>
      </p>
     </div>
     <footer class="card-footer">
      <a class="card-footer-item" href="https://www.realpython.com" target="_blank">
       Learn
      </a>
      <a class="card-footer-item" href="https://realpython.github.io/fake-jobs/jobs/scientist-research-maths-22.html" target="_blank">
       Apply
      </a>
     </footer>
    </div>
    
    ------
    <div class="card-content">
     <div class="media">
      <div class="media-left">
       <figure class="image is-48x48">
        <img alt="Real Python Logo" src="https://files.realpython.com/media/real-python-logo-thumbnail.7f0db70c2ed2.jpg?__no_cf_polish=1"/>
       </figure>
      </div>
      <div class="media-content">
       <h2 class="title is-5">
        Ecologist
       </h2>
       <h3 class="subtitle is-6 company">
        Lee, Gutierrez and Brown
       </h3>
      </div>
     </div>
     <div class="content">
      <p class="location">
       Lauraton, AP
      </p>
      <p class="is-small has-text-grey">
       <time datetime="2021-04-08">
        2021-04-08
       </time>
      </p>
     </div>
     <footer class="card-footer">
      <a class="card-footer-item" href="https://www.realpython.com" target="_blank">
       Learn
      </a>
      <a class="card-footer-item" href="https://realpython.github.io/fake-jobs/jobs/ecologist-23.html" target="_blank">
       Apply
      </a>
     </footer>
    </div>
    
    ------
    <div class="card-content">
     <div class="media">
      <div class="media-left">
       <figure class="image is-48x48">
        <img alt="Real Python Logo" src="https://files.realpython.com/media/real-python-logo-thumbnail.7f0db70c2ed2.jpg?__no_cf_polish=1"/>
       </figure>
      </div>
      <div class="media-content">
       <h2 class="title is-5">
        Materials engineer
       </h2>
       <h3 class="subtitle is-6 company">
        Davis, Serrano and Cook
       </h3>
      </div>
     </div>
     <div class="content">
      <p class="location">
       South Tammyberg, AP
      </p>
      <p class="is-small has-text-grey">
       <time datetime="2021-04-08">
        2021-04-08
       </time>
      </p>
     </div>
     <footer class="card-footer">
      <a class="card-footer-item" href="https://www.realpython.com" target="_blank">
       Learn
      </a>
      <a class="card-footer-item" href="https://realpython.github.io/fake-jobs/jobs/materials-engineer-24.html" target="_blank">
       Apply
      </a>
     </footer>
    </div>
    
    ------
    <div class="card-content">
     <div class="media">
      <div class="media-left">
       <figure class="image is-48x48">
        <img alt="Real Python Logo" src="https://files.realpython.com/media/real-python-logo-thumbnail.7f0db70c2ed2.jpg?__no_cf_polish=1"/>
       </figure>
      </div>
      <div class="media-content">
       <h2 class="title is-5">
        Historic buildings inspector/conservation officer
       </h2>
       <h3 class="subtitle is-6 company">
        Smith LLC
       </h3>
      </div>
     </div>
     <div class="content">
      <p class="location">
       North Brandonville, AP
      </p>
      <p class="is-small has-text-grey">
       <time datetime="2021-04-08">
        2021-04-08
       </time>
      </p>
     </div>
     <footer class="card-footer">
      <a class="card-footer-item" href="https://www.realpython.com" target="_blank">
       Learn
      </a>
      <a class="card-footer-item" href="https://realpython.github.io/fake-jobs/jobs/historic-buildings-inspector-conservation-officer-25.html" target="_blank">
       Apply
      </a>
     </footer>
    </div>
    
    ------
    <div class="card-content">
     <div class="media">
      <div class="media-left">
       <figure class="image is-48x48">
        <img alt="Real Python Logo" src="https://files.realpython.com/media/real-python-logo-thumbnail.7f0db70c2ed2.jpg?__no_cf_polish=1"/>
       </figure>
      </div>
      <div class="media-content">
       <h2 class="title is-5">
        Data scientist
       </h2>
       <h3 class="subtitle is-6 company">
        Thomas Group
       </h3>
      </div>
     </div>
     <div class="content">
      <p class="location">
       Port Robertfurt, AA
      </p>
      <p class="is-small has-text-grey">
       <time datetime="2021-04-08">
        2021-04-08
       </time>
      </p>
     </div>
     <footer class="card-footer">
      <a class="card-footer-item" href="https://www.realpython.com" target="_blank">
       Learn
      </a>
      <a class="card-footer-item" href="https://realpython.github.io/fake-jobs/jobs/data-scientist-26.html" target="_blank">
       Apply
      </a>
     </footer>
    </div>
    
    ------
    <div class="card-content">
     <div class="media">
      <div class="media-left">
       <figure class="image is-48x48">
        <img alt="Real Python Logo" src="https://files.realpython.com/media/real-python-logo-thumbnail.7f0db70c2ed2.jpg?__no_cf_polish=1"/>
       </figure>
      </div>
      <div class="media-content">
       <h2 class="title is-5">
        Psychiatrist
       </h2>
       <h3 class="subtitle is-6 company">
        Silva-King
       </h3>
      </div>
     </div>
     <div class="content">
      <p class="location">
       Burnettbury, AE
      </p>
      <p class="is-small has-text-grey">
       <time datetime="2021-04-08">
        2021-04-08
       </time>
      </p>
     </div>
     <footer class="card-footer">
      <a class="card-footer-item" href="https://www.realpython.com" target="_blank">
       Learn
      </a>
      <a class="card-footer-item" href="https://realpython.github.io/fake-jobs/jobs/psychiatrist-27.html" target="_blank">
       Apply
      </a>
     </footer>
    </div>
    
    ------
    <div class="card-content">
     <div class="media">
      <div class="media-left">
       <figure class="image is-48x48">
        <img alt="Real Python Logo" src="https://files.realpython.com/media/real-python-logo-thumbnail.7f0db70c2ed2.jpg?__no_cf_polish=1"/>
       </figure>
      </div>
      <div class="media-content">
       <h2 class="title is-5">
        Structural engineer
       </h2>
       <h3 class="subtitle is-6 company">
        Pierce-Long
       </h3>
      </div>
     </div>
     <div class="content">
      <p class="location">
       Herbertside, AA
      </p>
      <p class="is-small has-text-grey">
       <time datetime="2021-04-08">
        2021-04-08
       </time>
      </p>
     </div>
     <footer class="card-footer">
      <a class="card-footer-item" href="https://www.realpython.com" target="_blank">
       Learn
      </a>
      <a class="card-footer-item" href="https://realpython.github.io/fake-jobs/jobs/structural-engineer-28.html" target="_blank">
       Apply
      </a>
     </footer>
    </div>
    
    ------
    <div class="card-content">
     <div class="media">
      <div class="media-left">
       <figure class="image is-48x48">
        <img alt="Real Python Logo" src="https://files.realpython.com/media/real-python-logo-thumbnail.7f0db70c2ed2.jpg?__no_cf_polish=1"/>
       </figure>
      </div>
      <div class="media-content">
       <h2 class="title is-5">
        Immigration officer
       </h2>
       <h3 class="subtitle is-6 company">
        Walker-Simpson
       </h3>
      </div>
     </div>
     <div class="content">
      <p class="location">
       Christopherport, AP
      </p>
      <p class="is-small has-text-grey">
       <time datetime="2021-04-08">
        2021-04-08
       </time>
      </p>
     </div>
     <footer class="card-footer">
      <a class="card-footer-item" href="https://www.realpython.com" target="_blank">
       Learn
      </a>
      <a class="card-footer-item" href="https://realpython.github.io/fake-jobs/jobs/immigration-officer-29.html" target="_blank">
       Apply
      </a>
     </footer>
    </div>
    
    ------
    <div class="card-content">
     <div class="media">
      <div class="media-left">
       <figure class="image is-48x48">
        <img alt="Real Python Logo" src="https://files.realpython.com/media/real-python-logo-thumbnail.7f0db70c2ed2.jpg?__no_cf_polish=1"/>
       </figure>
      </div>
      <div class="media-content">
       <h2 class="title is-5">
        Python Programmer (Entry-Level)
       </h2>
       <h3 class="subtitle is-6 company">
        Cooper and Sons
       </h3>
      </div>
     </div>
     <div class="content">
      <p class="location">
       West Victor, AE
      </p>
      <p class="is-small has-text-grey">
       <time datetime="2021-04-08">
        2021-04-08
       </time>
      </p>
     </div>
     <footer class="card-footer">
      <a class="card-footer-item" href="https://www.realpython.com" target="_blank">
       Learn
      </a>
      <a class="card-footer-item" href="https://realpython.github.io/fake-jobs/jobs/python-programmer-entry-level-30.html" target="_blank">
       Apply
      </a>
     </footer>
    </div>
    
    ------
    <div class="card-content">
     <div class="media">
      <div class="media-left">
       <figure class="image is-48x48">
        <img alt="Real Python Logo" src="https://files.realpython.com/media/real-python-logo-thumbnail.7f0db70c2ed2.jpg?__no_cf_polish=1"/>
       </figure>
      </div>
      <div class="media-content">
       <h2 class="title is-5">
        Neurosurgeon
       </h2>
       <h3 class="subtitle is-6 company">
        Donovan, Gonzalez and Figueroa
       </h3>
      </div>
     </div>
     <div class="content">
      <p class="location">
       Port Aaron, AP
      </p>
      <p class="is-small has-text-grey">
       <time datetime="2021-04-08">
        2021-04-08
       </time>
      </p>
     </div>
     <footer class="card-footer">
      <a class="card-footer-item" href="https://www.realpython.com" target="_blank">
       Learn
      </a>
      <a class="card-footer-item" href="https://realpython.github.io/fake-jobs/jobs/neurosurgeon-31.html" target="_blank">
       Apply
      </a>
     </footer>
    </div>
    
    ------
    <div class="card-content">
     <div class="media">
      <div class="media-left">
       <figure class="image is-48x48">
        <img alt="Real Python Logo" src="https://files.realpython.com/media/real-python-logo-thumbnail.7f0db70c2ed2.jpg?__no_cf_polish=1"/>
       </figure>
      </div>
      <div class="media-content">
       <h2 class="title is-5">
        Broadcast engineer
       </h2>
       <h3 class="subtitle is-6 company">
        Morgan, Butler and Bennett
       </h3>
      </div>
     </div>
     <div class="content">
      <p class="location">
       Loribury, AA
      </p>
      <p class="is-small has-text-grey">
       <time datetime="2021-04-08">
        2021-04-08
       </time>
      </p>
     </div>
     <footer class="card-footer">
      <a class="card-footer-item" href="https://www.realpython.com" target="_blank">
       Learn
      </a>
      <a class="card-footer-item" href="https://realpython.github.io/fake-jobs/jobs/broadcast-engineer-32.html" target="_blank">
       Apply
      </a>
     </footer>
    </div>
    
    ------
    <div class="card-content">
     <div class="media">
      <div class="media-left">
       <figure class="image is-48x48">
        <img alt="Real Python Logo" src="https://files.realpython.com/media/real-python-logo-thumbnail.7f0db70c2ed2.jpg?__no_cf_polish=1"/>
       </figure>
      </div>
      <div class="media-content">
       <h2 class="title is-5">
        Make
       </h2>
       <h3 class="subtitle is-6 company">
        Snyder-Lee
       </h3>
      </div>
     </div>
     <div class="content">
      <p class="location">
       Angelastad, AP
      </p>
      <p class="is-small has-text-grey">
       <time datetime="2021-04-08">
        2021-04-08
       </time>
      </p>
     </div>
     <footer class="card-footer">
      <a class="card-footer-item" href="https://www.realpython.com" target="_blank">
       Learn
      </a>
      <a class="card-footer-item" href="https://realpython.github.io/fake-jobs/jobs/make-33.html" target="_blank">
       Apply
      </a>
     </footer>
    </div>
    
    ------
    <div class="card-content">
     <div class="media">
      <div class="media-left">
       <figure class="image is-48x48">
        <img alt="Real Python Logo" src="https://files.realpython.com/media/real-python-logo-thumbnail.7f0db70c2ed2.jpg?__no_cf_polish=1"/>
       </figure>
      </div>
      <div class="media-content">
       <h2 class="title is-5">
        Nurse, adult
       </h2>
       <h3 class="subtitle is-6 company">
        Harris PLC
       </h3>
      </div>
     </div>
     <div class="content">
      <p class="location">
       Larrytown, AE
      </p>
      <p class="is-small has-text-grey">
       <time datetime="2021-04-08">
        2021-04-08
       </time>
      </p>
     </div>
     <footer class="card-footer">
      <a class="card-footer-item" href="https://www.realpython.com" target="_blank">
       Learn
      </a>
      <a class="card-footer-item" href="https://realpython.github.io/fake-jobs/jobs/nurse-adult-34.html" target="_blank">
       Apply
      </a>
     </footer>
    </div>
    
    ------
    <div class="card-content">
     <div class="media">
      <div class="media-left">
       <figure class="image is-48x48">
        <img alt="Real Python Logo" src="https://files.realpython.com/media/real-python-logo-thumbnail.7f0db70c2ed2.jpg?__no_cf_polish=1"/>
       </figure>
      </div>
      <div class="media-content">
       <h2 class="title is-5">
        Air broker
       </h2>
       <h3 class="subtitle is-6 company">
        Washington PLC
       </h3>
      </div>
     </div>
     <div class="content">
      <p class="location">
       West Colin, AP
      </p>
      <p class="is-small has-text-grey">
       <time datetime="2021-04-08">
        2021-04-08
       </time>
      </p>
     </div>
     <footer class="card-footer">
      <a class="card-footer-item" href="https://www.realpython.com" target="_blank">
       Learn
      </a>
      <a class="card-footer-item" href="https://realpython.github.io/fake-jobs/jobs/air-broker-35.html" target="_blank">
       Apply
      </a>
     </footer>
    </div>
    
    ------
    <div class="card-content">
     <div class="media">
      <div class="media-left">
       <figure class="image is-48x48">
        <img alt="Real Python Logo" src="https://files.realpython.com/media/real-python-logo-thumbnail.7f0db70c2ed2.jpg?__no_cf_polish=1"/>
       </figure>
      </div>
      <div class="media-content">
       <h2 class="title is-5">
        Editor, film/video
       </h2>
       <h3 class="subtitle is-6 company">
        Brown, Price and Campbell
       </h3>
      </div>
     </div>
     <div class="content">
      <p class="location">
       West Stephanie, AP
      </p>
      <p class="is-small has-text-grey">
       <time datetime="2021-04-08">
        2021-04-08
       </time>
      </p>
     </div>
     <footer class="card-footer">
      <a class="card-footer-item" href="https://www.realpython.com" target="_blank">
       Learn
      </a>
      <a class="card-footer-item" href="https://realpython.github.io/fake-jobs/jobs/editor-film-video-36.html" target="_blank">
       Apply
      </a>
     </footer>
    </div>
    
    ------
    <div class="card-content">
     <div class="media">
      <div class="media-left">
       <figure class="image is-48x48">
        <img alt="Real Python Logo" src="https://files.realpython.com/media/real-python-logo-thumbnail.7f0db70c2ed2.jpg?__no_cf_polish=1"/>
       </figure>
      </div>
      <div class="media-content">
       <h2 class="title is-5">
        Production assistant, radio
       </h2>
       <h3 class="subtitle is-6 company">
        Mcgee PLC
       </h3>
      </div>
     </div>
     <div class="content">
      <p class="location">
       Laurentown, AP
      </p>
      <p class="is-small has-text-grey">
       <time datetime="2021-04-08">
        2021-04-08
       </time>
      </p>
     </div>
     <footer class="card-footer">
      <a class="card-footer-item" href="https://www.realpython.com" target="_blank">
       Learn
      </a>
      <a class="card-footer-item" href="https://realpython.github.io/fake-jobs/jobs/production-assistant-radio-37.html" target="_blank">
       Apply
      </a>
     </footer>
    </div>
    
    ------
    <div class="card-content">
     <div class="media">
      <div class="media-left">
       <figure class="image is-48x48">
        <img alt="Real Python Logo" src="https://files.realpython.com/media/real-python-logo-thumbnail.7f0db70c2ed2.jpg?__no_cf_polish=1"/>
       </figure>
      </div>
      <div class="media-content">
       <h2 class="title is-5">
        Engineer, communications
       </h2>
       <h3 class="subtitle is-6 company">
        Dixon Inc
       </h3>
      </div>
     </div>
     <div class="content">
      <p class="location">
       Wrightberg, AP
      </p>
      <p class="is-small has-text-grey">
       <time datetime="2021-04-08">
        2021-04-08
       </time>
      </p>
     </div>
     <footer class="card-footer">
      <a class="card-footer-item" href="https://www.realpython.com" target="_blank">
       Learn
      </a>
      <a class="card-footer-item" href="https://realpython.github.io/fake-jobs/jobs/engineer-communications-38.html" target="_blank">
       Apply
      </a>
     </footer>
    </div>
    
    ------
    <div class="card-content">
     <div class="media">
      <div class="media-left">
       <figure class="image is-48x48">
        <img alt="Real Python Logo" src="https://files.realpython.com/media/real-python-logo-thumbnail.7f0db70c2ed2.jpg?__no_cf_polish=1"/>
       </figure>
      </div>
      <div class="media-content">
       <h2 class="title is-5">
        Sales executive
       </h2>
       <h3 class="subtitle is-6 company">
        Thompson, Sheppard and Ward
       </h3>
      </div>
     </div>
     <div class="content">
      <p class="location">
       Alberttown, AE
      </p>
      <p class="is-small has-text-grey">
       <time datetime="2021-04-08">
        2021-04-08
       </time>
      </p>
     </div>
     <footer class="card-footer">
      <a class="card-footer-item" href="https://www.realpython.com" target="_blank">
       Learn
      </a>
      <a class="card-footer-item" href="https://realpython.github.io/fake-jobs/jobs/sales-executive-39.html" target="_blank">
       Apply
      </a>
     </footer>
    </div>
    
    ------
    <div class="card-content">
     <div class="media">
      <div class="media-left">
       <figure class="image is-48x48">
        <img alt="Real Python Logo" src="https://files.realpython.com/media/real-python-logo-thumbnail.7f0db70c2ed2.jpg?__no_cf_polish=1"/>
       </figure>
      </div>
      <div class="media-content">
       <h2 class="title is-5">
        Software Developer (Python)
       </h2>
       <h3 class="subtitle is-6 company">
        Adams-Brewer
       </h3>
      </div>
     </div>
     <div class="content">
      <p class="location">
       Brockburgh, AE
      </p>
      <p class="is-small has-text-grey">
       <time datetime="2021-04-08">
        2021-04-08
       </time>
      </p>
     </div>
     <footer class="card-footer">
      <a class="card-footer-item" href="https://www.realpython.com" target="_blank">
       Learn
      </a>
      <a class="card-footer-item" href="https://realpython.github.io/fake-jobs/jobs/software-developer-python-40.html" target="_blank">
       Apply
      </a>
     </footer>
    </div>
    
    ------
    <div class="card-content">
     <div class="media">
      <div class="media-left">
       <figure class="image is-48x48">
        <img alt="Real Python Logo" src="https://files.realpython.com/media/real-python-logo-thumbnail.7f0db70c2ed2.jpg?__no_cf_polish=1"/>
       </figure>
      </div>
      <div class="media-content">
       <h2 class="title is-5">
        Futures trader
       </h2>
       <h3 class="subtitle is-6 company">
        Schneider-Brady
       </h3>
      </div>
     </div>
     <div class="content">
      <p class="location">
       North Jason, AE
      </p>
      <p class="is-small has-text-grey">
       <time datetime="2021-04-08">
        2021-04-08
       </time>
      </p>
     </div>
     <footer class="card-footer">
      <a class="card-footer-item" href="https://www.realpython.com" target="_blank">
       Learn
      </a>
      <a class="card-footer-item" href="https://realpython.github.io/fake-jobs/jobs/futures-trader-41.html" target="_blank">
       Apply
      </a>
     </footer>
    </div>
    
    ------
    <div class="card-content">
     <div class="media">
      <div class="media-left">
       <figure class="image is-48x48">
        <img alt="Real Python Logo" src="https://files.realpython.com/media/real-python-logo-thumbnail.7f0db70c2ed2.jpg?__no_cf_polish=1"/>
       </figure>
      </div>
      <div class="media-content">
       <h2 class="title is-5">
        Tour manager
       </h2>
       <h3 class="subtitle is-6 company">
        Gonzales-Frank
       </h3>
      </div>
     </div>
     <div class="content">
      <p class="location">
       Arnoldhaven, AE
      </p>
      <p class="is-small has-text-grey">
       <time datetime="2021-04-08">
        2021-04-08
       </time>
      </p>
     </div>
     <footer class="card-footer">
      <a class="card-footer-item" href="https://www.realpython.com" target="_blank">
       Learn
      </a>
      <a class="card-footer-item" href="https://realpython.github.io/fake-jobs/jobs/tour-manager-42.html" target="_blank">
       Apply
      </a>
     </footer>
    </div>
    
    ------
    <div class="card-content">
     <div class="media">
      <div class="media-left">
       <figure class="image is-48x48">
        <img alt="Real Python Logo" src="https://files.realpython.com/media/real-python-logo-thumbnail.7f0db70c2ed2.jpg?__no_cf_polish=1"/>
       </figure>
      </div>
      <div class="media-content">
       <h2 class="title is-5">
        Cytogeneticist
       </h2>
       <h3 class="subtitle is-6 company">
        Smith-Wong
       </h3>
      </div>
     </div>
     <div class="content">
      <p class="location">
       Lake Destiny, AP
      </p>
      <p class="is-small has-text-grey">
       <time datetime="2021-04-08">
        2021-04-08
       </time>
      </p>
     </div>
     <footer class="card-footer">
      <a class="card-footer-item" href="https://www.realpython.com" target="_blank">
       Learn
      </a>
      <a class="card-footer-item" href="https://realpython.github.io/fake-jobs/jobs/cytogeneticist-43.html" target="_blank">
       Apply
      </a>
     </footer>
    </div>
    
    ------
    <div class="card-content">
     <div class="media">
      <div class="media-left">
       <figure class="image is-48x48">
        <img alt="Real Python Logo" src="https://files.realpython.com/media/real-python-logo-thumbnail.7f0db70c2ed2.jpg?__no_cf_polish=1"/>
       </figure>
      </div>
      <div class="media-content">
       <h2 class="title is-5">
        Designer, multimedia
       </h2>
       <h3 class="subtitle is-6 company">
        Pierce-Herrera
       </h3>
      </div>
     </div>
     <div class="content">
      <p class="location">
       South Timothyburgh, AP
      </p>
      <p class="is-small has-text-grey">
       <time datetime="2021-04-08">
        2021-04-08
       </time>
      </p>
     </div>
     <footer class="card-footer">
      <a class="card-footer-item" href="https://www.realpython.com" target="_blank">
       Learn
      </a>
      <a class="card-footer-item" href="https://realpython.github.io/fake-jobs/jobs/designer-multimedia-44.html" target="_blank">
       Apply
      </a>
     </footer>
    </div>
    
    ------
    <div class="card-content">
     <div class="media">
      <div class="media-left">
       <figure class="image is-48x48">
        <img alt="Real Python Logo" src="https://files.realpython.com/media/real-python-logo-thumbnail.7f0db70c2ed2.jpg?__no_cf_polish=1"/>
       </figure>
      </div>
      <div class="media-content">
       <h2 class="title is-5">
        Trade union research officer
       </h2>
       <h3 class="subtitle is-6 company">
        Aguilar, Rivera and Quinn
       </h3>
      </div>
     </div>
     <div class="content">
      <p class="location">
       New Jimmyton, AE
      </p>
      <p class="is-small has-text-grey">
       <time datetime="2021-04-08">
        2021-04-08
       </time>
      </p>
     </div>
     <footer class="card-footer">
      <a class="card-footer-item" href="https://www.realpython.com" target="_blank">
       Learn
      </a>
      <a class="card-footer-item" href="https://realpython.github.io/fake-jobs/jobs/trade-union-research-officer-45.html" target="_blank">
       Apply
      </a>
     </footer>
    </div>
    
    ------
    <div class="card-content">
     <div class="media">
      <div class="media-left">
       <figure class="image is-48x48">
        <img alt="Real Python Logo" src="https://files.realpython.com/media/real-python-logo-thumbnail.7f0db70c2ed2.jpg?__no_cf_polish=1"/>
       </figure>
      </div>
      <div class="media-content">
       <h2 class="title is-5">
        Chemist, analytical
       </h2>
       <h3 class="subtitle is-6 company">
        Lowe, Barnes and Thomas
       </h3>
      </div>
     </div>
     <div class="content">
      <p class="location">
       New Lucasbury, AP
      </p>
      <p class="is-small has-text-grey">
       <time datetime="2021-04-08">
        2021-04-08
       </time>
      </p>
     </div>
     <footer class="card-footer">
      <a class="card-footer-item" href="https://www.realpython.com" target="_blank">
       Learn
      </a>
      <a class="card-footer-item" href="https://realpython.github.io/fake-jobs/jobs/chemist-analytical-46.html" target="_blank">
       Apply
      </a>
     </footer>
    </div>
    
    ------
    <div class="card-content">
     <div class="media">
      <div class="media-left">
       <figure class="image is-48x48">
        <img alt="Real Python Logo" src="https://files.realpython.com/media/real-python-logo-thumbnail.7f0db70c2ed2.jpg?__no_cf_polish=1"/>
       </figure>
      </div>
      <div class="media-content">
       <h2 class="title is-5">
        Programmer, multimedia
       </h2>
       <h3 class="subtitle is-6 company">
        Lewis, Gonzalez and Vasquez
       </h3>
      </div>
     </div>
     <div class="content">
      <p class="location">
       Port Cory, AE
      </p>
      <p class="is-small has-text-grey">
       <time datetime="2021-04-08">
        2021-04-08
       </time>
      </p>
     </div>
     <footer class="card-footer">
      <a class="card-footer-item" href="https://www.realpython.com" target="_blank">
       Learn
      </a>
      <a class="card-footer-item" href="https://realpython.github.io/fake-jobs/jobs/programmer-multimedia-47.html" target="_blank">
       Apply
      </a>
     </footer>
    </div>
    
    ------
    <div class="card-content">
     <div class="media">
      <div class="media-left">
       <figure class="image is-48x48">
        <img alt="Real Python Logo" src="https://files.realpython.com/media/real-python-logo-thumbnail.7f0db70c2ed2.jpg?__no_cf_polish=1"/>
       </figure>
      </div>
      <div class="media-content">
       <h2 class="title is-5">
        Engineer, broadcasting (operations)
       </h2>
       <h3 class="subtitle is-6 company">
        Taylor PLC
       </h3>
      </div>
     </div>
     <div class="content">
      <p class="location">
       Gileston, AA
      </p>
      <p class="is-small has-text-grey">
       <time datetime="2021-04-08">
        2021-04-08
       </time>
      </p>
     </div>
     <footer class="card-footer">
      <a class="card-footer-item" href="https://www.realpython.com" target="_blank">
       Learn
      </a>
      <a class="card-footer-item" href="https://realpython.github.io/fake-jobs/jobs/engineer-broadcasting-operations-48.html" target="_blank">
       Apply
      </a>
     </footer>
    </div>
    
    ------
    <div class="card-content">
     <div class="media">
      <div class="media-left">
       <figure class="image is-48x48">
        <img alt="Real Python Logo" src="https://files.realpython.com/media/real-python-logo-thumbnail.7f0db70c2ed2.jpg?__no_cf_polish=1"/>
       </figure>
      </div>
      <div class="media-content">
       <h2 class="title is-5">
        Teacher, primary school
       </h2>
       <h3 class="subtitle is-6 company">
        Oliver, Jones and Ramirez
       </h3>
      </div>
     </div>
     <div class="content">
      <p class="location">
       Cindyshire, AA
      </p>
      <p class="is-small has-text-grey">
       <time datetime="2021-04-08">
        2021-04-08
       </time>
      </p>
     </div>
     <footer class="card-footer">
      <a class="card-footer-item" href="https://www.realpython.com" target="_blank">
       Learn
      </a>
      <a class="card-footer-item" href="https://realpython.github.io/fake-jobs/jobs/teacher-primary-school-49.html" target="_blank">
       Apply
      </a>
     </footer>
    </div>
    
    ------
    <div class="card-content">
     <div class="media">
      <div class="media-left">
       <figure class="image is-48x48">
        <img alt="Real Python Logo" src="https://files.realpython.com/media/real-python-logo-thumbnail.7f0db70c2ed2.jpg?__no_cf_polish=1"/>
       </figure>
      </div>
      <div class="media-content">
       <h2 class="title is-5">
        Python Developer
       </h2>
       <h3 class="subtitle is-6 company">
        Rivera and Sons
       </h3>
      </div>
     </div>
     <div class="content">
      <p class="location">
       East Michaelfort, AA
      </p>
      <p class="is-small has-text-grey">
       <time datetime="2021-04-08">
        2021-04-08
       </time>
      </p>
     </div>
     <footer class="card-footer">
      <a class="card-footer-item" href="https://www.realpython.com" target="_blank">
       Learn
      </a>
      <a class="card-footer-item" href="https://realpython.github.io/fake-jobs/jobs/python-developer-50.html" target="_blank">
       Apply
      </a>
     </footer>
    </div>
    
    ------
    <div class="card-content">
     <div class="media">
      <div class="media-left">
       <figure class="image is-48x48">
        <img alt="Real Python Logo" src="https://files.realpython.com/media/real-python-logo-thumbnail.7f0db70c2ed2.jpg?__no_cf_polish=1"/>
       </figure>
      </div>
      <div class="media-content">
       <h2 class="title is-5">
        Manufacturing systems engineer
       </h2>
       <h3 class="subtitle is-6 company">
        Garcia PLC
       </h3>
      </div>
     </div>
     <div class="content">
      <p class="location">
       Joybury, AE
      </p>
      <p class="is-small has-text-grey">
       <time datetime="2021-04-08">
        2021-04-08
       </time>
      </p>
     </div>
     <footer class="card-footer">
      <a class="card-footer-item" href="https://www.realpython.com" target="_blank">
       Learn
      </a>
      <a class="card-footer-item" href="https://realpython.github.io/fake-jobs/jobs/manufacturing-systems-engineer-51.html" target="_blank">
       Apply
      </a>
     </footer>
    </div>
    
    ------
    <div class="card-content">
     <div class="media">
      <div class="media-left">
       <figure class="image is-48x48">
        <img alt="Real Python Logo" src="https://files.realpython.com/media/real-python-logo-thumbnail.7f0db70c2ed2.jpg?__no_cf_polish=1"/>
       </figure>
      </div>
      <div class="media-content">
       <h2 class="title is-5">
        Producer, television/film/video
       </h2>
       <h3 class="subtitle is-6 company">
        Johnson, Wells and Kramer
       </h3>
      </div>
     </div>
     <div class="content">
      <p class="location">
       Emmatown, AE
      </p>
      <p class="is-small has-text-grey">
       <time datetime="2021-04-08">
        2021-04-08
       </time>
      </p>
     </div>
     <footer class="card-footer">
      <a class="card-footer-item" href="https://www.realpython.com" target="_blank">
       Learn
      </a>
      <a class="card-footer-item" href="https://realpython.github.io/fake-jobs/jobs/producer-television-film-video-52.html" target="_blank">
       Apply
      </a>
     </footer>
    </div>
    
    ------
    <div class="card-content">
     <div class="media">
      <div class="media-left">
       <figure class="image is-48x48">
        <img alt="Real Python Logo" src="https://files.realpython.com/media/real-python-logo-thumbnail.7f0db70c2ed2.jpg?__no_cf_polish=1"/>
       </figure>
      </div>
      <div class="media-content">
       <h2 class="title is-5">
        Scientist, forensic
       </h2>
       <h3 class="subtitle is-6 company">
        Gonzalez LLC
       </h3>
      </div>
     </div>
     <div class="content">
      <p class="location">
       Colehaven, AP
      </p>
      <p class="is-small has-text-grey">
       <time datetime="2021-04-08">
        2021-04-08
       </time>
      </p>
     </div>
     <footer class="card-footer">
      <a class="card-footer-item" href="https://www.realpython.com" target="_blank">
       Learn
      </a>
      <a class="card-footer-item" href="https://realpython.github.io/fake-jobs/jobs/scientist-forensic-53.html" target="_blank">
       Apply
      </a>
     </footer>
    </div>
    
    ------
    <div class="card-content">
     <div class="media">
      <div class="media-left">
       <figure class="image is-48x48">
        <img alt="Real Python Logo" src="https://files.realpython.com/media/real-python-logo-thumbnail.7f0db70c2ed2.jpg?__no_cf_polish=1"/>
       </figure>
      </div>
      <div class="media-content">
       <h2 class="title is-5">
        Bonds trader
       </h2>
       <h3 class="subtitle is-6 company">
        Morgan, White and Macdonald
       </h3>
      </div>
     </div>
     <div class="content">
      <p class="location">
       Port Coryton, AE
      </p>
      <p class="is-small has-text-grey">
       <time datetime="2021-04-08">
        2021-04-08
       </time>
      </p>
     </div>
     <footer class="card-footer">
      <a class="card-footer-item" href="https://www.realpython.com" target="_blank">
       Learn
      </a>
      <a class="card-footer-item" href="https://realpython.github.io/fake-jobs/jobs/bonds-trader-54.html" target="_blank">
       Apply
      </a>
     </footer>
    </div>
    
    ------
    <div class="card-content">
     <div class="media">
      <div class="media-left">
       <figure class="image is-48x48">
        <img alt="Real Python Logo" src="https://files.realpython.com/media/real-python-logo-thumbnail.7f0db70c2ed2.jpg?__no_cf_polish=1"/>
       </figure>
      </div>
      <div class="media-content">
       <h2 class="title is-5">
        Editorial assistant
       </h2>
       <h3 class="subtitle is-6 company">
        Robinson-Fitzpatrick
       </h3>
      </div>
     </div>
     <div class="content">
      <p class="location">
       Amyborough, AA
      </p>
      <p class="is-small has-text-grey">
       <time datetime="2021-04-08">
        2021-04-08
       </time>
      </p>
     </div>
     <footer class="card-footer">
      <a class="card-footer-item" href="https://www.realpython.com" target="_blank">
       Learn
      </a>
      <a class="card-footer-item" href="https://realpython.github.io/fake-jobs/jobs/editorial-assistant-55.html" target="_blank">
       Apply
      </a>
     </footer>
    </div>
    
    ------
    <div class="card-content">
     <div class="media">
      <div class="media-left">
       <figure class="image is-48x48">
        <img alt="Real Python Logo" src="https://files.realpython.com/media/real-python-logo-thumbnail.7f0db70c2ed2.jpg?__no_cf_polish=1"/>
       </figure>
      </div>
      <div class="media-content">
       <h2 class="title is-5">
        Photographer
       </h2>
       <h3 class="subtitle is-6 company">
        Waters, Wilson and Hoover
       </h3>
      </div>
     </div>
     <div class="content">
      <p class="location">
       Reynoldsville, AA
      </p>
      <p class="is-small has-text-grey">
       <time datetime="2021-04-08">
        2021-04-08
       </time>
      </p>
     </div>
     <footer class="card-footer">
      <a class="card-footer-item" href="https://www.realpython.com" target="_blank">
       Learn
      </a>
      <a class="card-footer-item" href="https://realpython.github.io/fake-jobs/jobs/photographer-56.html" target="_blank">
       Apply
      </a>
     </footer>
    </div>
    
    ------
    <div class="card-content">
     <div class="media">
      <div class="media-left">
       <figure class="image is-48x48">
        <img alt="Real Python Logo" src="https://files.realpython.com/media/real-python-logo-thumbnail.7f0db70c2ed2.jpg?__no_cf_polish=1"/>
       </figure>
      </div>
      <div class="media-content">
       <h2 class="title is-5">
        Retail banker
       </h2>
       <h3 class="subtitle is-6 company">
        Hill LLC
       </h3>
      </div>
     </div>
     <div class="content">
      <p class="location">
       Port Billy, AP
      </p>
      <p class="is-small has-text-grey">
       <time datetime="2021-04-08">
        2021-04-08
       </time>
      </p>
     </div>
     <footer class="card-footer">
      <a class="card-footer-item" href="https://www.realpython.com" target="_blank">
       Learn
      </a>
      <a class="card-footer-item" href="https://realpython.github.io/fake-jobs/jobs/retail-banker-57.html" target="_blank">
       Apply
      </a>
     </footer>
    </div>
    
    ------
    <div class="card-content">
     <div class="media">
      <div class="media-left">
       <figure class="image is-48x48">
        <img alt="Real Python Logo" src="https://files.realpython.com/media/real-python-logo-thumbnail.7f0db70c2ed2.jpg?__no_cf_polish=1"/>
       </figure>
      </div>
      <div class="media-content">
       <h2 class="title is-5">
        Jewellery designer
       </h2>
       <h3 class="subtitle is-6 company">
        Li-Gregory
       </h3>
      </div>
     </div>
     <div class="content">
      <p class="location">
       Adamburgh, AA
      </p>
      <p class="is-small has-text-grey">
       <time datetime="2021-04-08">
        2021-04-08
       </time>
      </p>
     </div>
     <footer class="card-footer">
      <a class="card-footer-item" href="https://www.realpython.com" target="_blank">
       Learn
      </a>
      <a class="card-footer-item" href="https://realpython.github.io/fake-jobs/jobs/jewellery-designer-58.html" target="_blank">
       Apply
      </a>
     </footer>
    </div>
    
    ------
    <div class="card-content">
     <div class="media">
      <div class="media-left">
       <figure class="image is-48x48">
        <img alt="Real Python Logo" src="https://files.realpython.com/media/real-python-logo-thumbnail.7f0db70c2ed2.jpg?__no_cf_polish=1"/>
       </figure>
      </div>
      <div class="media-content">
       <h2 class="title is-5">
        Ophthalmologist
       </h2>
       <h3 class="subtitle is-6 company">
        Fisher, Ryan and Coleman
       </h3>
      </div>
     </div>
     <div class="content">
      <p class="location">
       Wilsonmouth, AA
      </p>
      <p class="is-small has-text-grey">
       <time datetime="2021-04-08">
        2021-04-08
       </time>
      </p>
     </div>
     <footer class="card-footer">
      <a class="card-footer-item" href="https://www.realpython.com" target="_blank">
       Learn
      </a>
      <a class="card-footer-item" href="https://realpython.github.io/fake-jobs/jobs/ophthalmologist-59.html" target="_blank">
       Apply
      </a>
     </footer>
    </div>
    
    ------
    <div class="card-content">
     <div class="media">
      <div class="media-left">
       <figure class="image is-48x48">
        <img alt="Real Python Logo" src="https://files.realpython.com/media/real-python-logo-thumbnail.7f0db70c2ed2.jpg?__no_cf_polish=1"/>
       </figure>
      </div>
      <div class="media-content">
       <h2 class="title is-5">
        Back-End Web Developer (Python, Django)
       </h2>
       <h3 class="subtitle is-6 company">
        Stewart-Alexander
       </h3>
      </div>
     </div>
     <div class="content">
      <p class="location">
       South Kimberly, AA
      </p>
      <p class="is-small has-text-grey">
       <time datetime="2021-04-08">
        2021-04-08
       </time>
      </p>
     </div>
     <footer class="card-footer">
      <a class="card-footer-item" href="https://www.realpython.com" target="_blank">
       Learn
      </a>
      <a class="card-footer-item" href="https://realpython.github.io/fake-jobs/jobs/back-end-web-developer-python-django-60.html" target="_blank">
       Apply
      </a>
     </footer>
    </div>
    
    ------
    <div class="card-content">
     <div class="media">
      <div class="media-left">
       <figure class="image is-48x48">
        <img alt="Real Python Logo" src="https://files.realpython.com/media/real-python-logo-thumbnail.7f0db70c2ed2.jpg?__no_cf_polish=1"/>
       </figure>
      </div>
      <div class="media-content">
       <h2 class="title is-5">
        Licensed conveyancer
       </h2>
       <h3 class="subtitle is-6 company">
        Abbott and Sons
       </h3>
      </div>
     </div>
     <div class="content">
      <p class="location">
       Benjaminland, AP
      </p>
      <p class="is-small has-text-grey">
       <time datetime="2021-04-08">
        2021-04-08
       </time>
      </p>
     </div>
     <footer class="card-footer">
      <a class="card-footer-item" href="https://www.realpython.com" target="_blank">
       Learn
      </a>
      <a class="card-footer-item" href="https://realpython.github.io/fake-jobs/jobs/licensed-conveyancer-61.html" target="_blank">
       Apply
      </a>
     </footer>
    </div>
    
    ------
    <div class="card-content">
     <div class="media">
      <div class="media-left">
       <figure class="image is-48x48">
        <img alt="Real Python Logo" src="https://files.realpython.com/media/real-python-logo-thumbnail.7f0db70c2ed2.jpg?__no_cf_polish=1"/>
       </figure>
      </div>
      <div class="media-content">
       <h2 class="title is-5">
        Futures trader
       </h2>
       <h3 class="subtitle is-6 company">
        Bryant, Santana and Davenport
       </h3>
      </div>
     </div>
     <div class="content">
      <p class="location">
       Zacharyport, AA
      </p>
      <p class="is-small has-text-grey">
       <time datetime="2021-04-08">
        2021-04-08
       </time>
      </p>
     </div>
     <footer class="card-footer">
      <a class="card-footer-item" href="https://www.realpython.com" target="_blank">
       Learn
      </a>
      <a class="card-footer-item" href="https://realpython.github.io/fake-jobs/jobs/futures-trader-62.html" target="_blank">
       Apply
      </a>
     </footer>
    </div>
    
    ------
    <div class="card-content">
     <div class="media">
      <div class="media-left">
       <figure class="image is-48x48">
        <img alt="Real Python Logo" src="https://files.realpython.com/media/real-python-logo-thumbnail.7f0db70c2ed2.jpg?__no_cf_polish=1"/>
       </figure>
      </div>
      <div class="media-content">
       <h2 class="title is-5">
        Counselling psychologist
       </h2>
       <h3 class="subtitle is-6 company">
        Smith PLC
       </h3>
      </div>
     </div>
     <div class="content">
      <p class="location">
       Port Devonville, AE
      </p>
      <p class="is-small has-text-grey">
       <time datetime="2021-04-08">
        2021-04-08
       </time>
      </p>
     </div>
     <footer class="card-footer">
      <a class="card-footer-item" href="https://www.realpython.com" target="_blank">
       Learn
      </a>
      <a class="card-footer-item" href="https://realpython.github.io/fake-jobs/jobs/counselling-psychologist-63.html" target="_blank">
       Apply
      </a>
     </footer>
    </div>
    
    ------
    <div class="card-content">
     <div class="media">
      <div class="media-left">
       <figure class="image is-48x48">
        <img alt="Real Python Logo" src="https://files.realpython.com/media/real-python-logo-thumbnail.7f0db70c2ed2.jpg?__no_cf_polish=1"/>
       </figure>
      </div>
      <div class="media-content">
       <h2 class="title is-5">
        Insurance underwriter
       </h2>
       <h3 class="subtitle is-6 company">
        Patterson-Singh
       </h3>
      </div>
     </div>
     <div class="content">
      <p class="location">
       East Thomas, AE
      </p>
      <p class="is-small has-text-grey">
       <time datetime="2021-04-08">
        2021-04-08
       </time>
      </p>
     </div>
     <footer class="card-footer">
      <a class="card-footer-item" href="https://www.realpython.com" target="_blank">
       Learn
      </a>
      <a class="card-footer-item" href="https://realpython.github.io/fake-jobs/jobs/insurance-underwriter-64.html" target="_blank">
       Apply
      </a>
     </footer>
    </div>
    
    ------
    <div class="card-content">
     <div class="media">
      <div class="media-left">
       <figure class="image is-48x48">
        <img alt="Real Python Logo" src="https://files.realpython.com/media/real-python-logo-thumbnail.7f0db70c2ed2.jpg?__no_cf_polish=1"/>
       </figure>
      </div>
      <div class="media-content">
       <h2 class="title is-5">
        Engineer, automotive
       </h2>
       <h3 class="subtitle is-6 company">
        Martinez-Berry
       </h3>
      </div>
     </div>
     <div class="content">
      <p class="location">
       New Jeffrey, AP
      </p>
      <p class="is-small has-text-grey">
       <time datetime="2021-04-08">
        2021-04-08
       </time>
      </p>
     </div>
     <footer class="card-footer">
      <a class="card-footer-item" href="https://www.realpython.com" target="_blank">
       Learn
      </a>
      <a class="card-footer-item" href="https://realpython.github.io/fake-jobs/jobs/engineer-automotive-65.html" target="_blank">
       Apply
      </a>
     </footer>
    </div>
    
    ------
    <div class="card-content">
     <div class="media">
      <div class="media-left">
       <figure class="image is-48x48">
        <img alt="Real Python Logo" src="https://files.realpython.com/media/real-python-logo-thumbnail.7f0db70c2ed2.jpg?__no_cf_polish=1"/>
       </figure>
      </div>
      <div class="media-content">
       <h2 class="title is-5">
        Producer, radio
       </h2>
       <h3 class="subtitle is-6 company">
        May, Taylor and Fisher
       </h3>
      </div>
     </div>
     <div class="content">
      <p class="location">
       Davidside, AA
      </p>
      <p class="is-small has-text-grey">
       <time datetime="2021-04-08">
        2021-04-08
       </time>
      </p>
     </div>
     <footer class="card-footer">
      <a class="card-footer-item" href="https://www.realpython.com" target="_blank">
       Learn
      </a>
      <a class="card-footer-item" href="https://realpython.github.io/fake-jobs/jobs/producer-radio-66.html" target="_blank">
       Apply
      </a>
     </footer>
    </div>
    
    ------
    <div class="card-content">
     <div class="media">
      <div class="media-left">
       <figure class="image is-48x48">
        <img alt="Real Python Logo" src="https://files.realpython.com/media/real-python-logo-thumbnail.7f0db70c2ed2.jpg?__no_cf_polish=1"/>
       </figure>
      </div>
      <div class="media-content">
       <h2 class="title is-5">
        Dispensing optician
       </h2>
       <h3 class="subtitle is-6 company">
        Bailey, Owen and Thompson
       </h3>
      </div>
     </div>
     <div class="content">
      <p class="location">
       Jamesville, AA
      </p>
      <p class="is-small has-text-grey">
       <time datetime="2021-04-08">
        2021-04-08
       </time>
      </p>
     </div>
     <footer class="card-footer">
      <a class="card-footer-item" href="https://www.realpython.com" target="_blank">
       Learn
      </a>
      <a class="card-footer-item" href="https://realpython.github.io/fake-jobs/jobs/dispensing-optician-67.html" target="_blank">
       Apply
      </a>
     </footer>
    </div>
    
    ------
    <div class="card-content">
     <div class="media">
      <div class="media-left">
       <figure class="image is-48x48">
        <img alt="Real Python Logo" src="https://files.realpython.com/media/real-python-logo-thumbnail.7f0db70c2ed2.jpg?__no_cf_polish=1"/>
       </figure>
      </div>
      <div class="media-content">
       <h2 class="title is-5">
        Designer, fashion/clothing
       </h2>
       <h3 class="subtitle is-6 company">
        Vasquez Ltd
       </h3>
      </div>
     </div>
     <div class="content">
      <p class="location">
       New Kelly, AP
      </p>
      <p class="is-small has-text-grey">
       <time datetime="2021-04-08">
        2021-04-08
       </time>
      </p>
     </div>
     <footer class="card-footer">
      <a class="card-footer-item" href="https://www.realpython.com" target="_blank">
       Learn
      </a>
      <a class="card-footer-item" href="https://realpython.github.io/fake-jobs/jobs/designer-fashion-clothing-68.html" target="_blank">
       Apply
      </a>
     </footer>
    </div>
    
    ------
    <div class="card-content">
     <div class="media">
      <div class="media-left">
       <figure class="image is-48x48">
        <img alt="Real Python Logo" src="https://files.realpython.com/media/real-python-logo-thumbnail.7f0db70c2ed2.jpg?__no_cf_polish=1"/>
       </figure>
      </div>
      <div class="media-content">
       <h2 class="title is-5">
        Chartered loss adjuster
       </h2>
       <h3 class="subtitle is-6 company">
        Leblanc LLC
       </h3>
      </div>
     </div>
     <div class="content">
      <p class="location">
       Lake Antonio, AA
      </p>
      <p class="is-small has-text-grey">
       <time datetime="2021-04-08">
        2021-04-08
       </time>
      </p>
     </div>
     <footer class="card-footer">
      <a class="card-footer-item" href="https://www.realpython.com" target="_blank">
       Learn
      </a>
      <a class="card-footer-item" href="https://realpython.github.io/fake-jobs/jobs/chartered-loss-adjuster-69.html" target="_blank">
       Apply
      </a>
     </footer>
    </div>
    
    ------
    <div class="card-content">
     <div class="media">
      <div class="media-left">
       <figure class="image is-48x48">
        <img alt="Real Python Logo" src="https://files.realpython.com/media/real-python-logo-thumbnail.7f0db70c2ed2.jpg?__no_cf_polish=1"/>
       </figure>
      </div>
      <div class="media-content">
       <h2 class="title is-5">
        Back-End Web Developer (Python, Django)
       </h2>
       <h3 class="subtitle is-6 company">
        Jackson, Ali and Mckee
       </h3>
      </div>
     </div>
     <div class="content">
      <p class="location">
       New Elizabethside, AA
      </p>
      <p class="is-small has-text-grey">
       <time datetime="2021-04-08">
        2021-04-08
       </time>
      </p>
     </div>
     <footer class="card-footer">
      <a class="card-footer-item" href="https://www.realpython.com" target="_blank">
       Learn
      </a>
      <a class="card-footer-item" href="https://realpython.github.io/fake-jobs/jobs/back-end-web-developer-python-django-70.html" target="_blank">
       Apply
      </a>
     </footer>
    </div>
    
    ------
    <div class="card-content">
     <div class="media">
      <div class="media-left">
       <figure class="image is-48x48">
        <img alt="Real Python Logo" src="https://files.realpython.com/media/real-python-logo-thumbnail.7f0db70c2ed2.jpg?__no_cf_polish=1"/>
       </figure>
      </div>
      <div class="media-content">
       <h2 class="title is-5">
        Forest/woodland manager
       </h2>
       <h3 class="subtitle is-6 company">
        Blankenship, Knight and Powell
       </h3>
      </div>
     </div>
     <div class="content">
      <p class="location">
       Millsbury, AE
      </p>
      <p class="is-small has-text-grey">
       <time datetime="2021-04-08">
        2021-04-08
       </time>
      </p>
     </div>
     <footer class="card-footer">
      <a class="card-footer-item" href="https://www.realpython.com" target="_blank">
       Learn
      </a>
      <a class="card-footer-item" href="https://realpython.github.io/fake-jobs/jobs/forest-woodland-manager-71.html" target="_blank">
       Apply
      </a>
     </footer>
    </div>
    
    ------
    <div class="card-content">
     <div class="media">
      <div class="media-left">
       <figure class="image is-48x48">
        <img alt="Real Python Logo" src="https://files.realpython.com/media/real-python-logo-thumbnail.7f0db70c2ed2.jpg?__no_cf_polish=1"/>
       </figure>
      </div>
      <div class="media-content">
       <h2 class="title is-5">
        Clinical cytogeneticist
       </h2>
       <h3 class="subtitle is-6 company">
        Patton, Haynes and Jones
       </h3>
      </div>
     </div>
     <div class="content">
      <p class="location">
       Lloydton, AP
      </p>
      <p class="is-small has-text-grey">
       <time datetime="2021-04-08">
        2021-04-08
       </time>
      </p>
     </div>
     <footer class="card-footer">
      <a class="card-footer-item" href="https://www.realpython.com" target="_blank">
       Learn
      </a>
      <a class="card-footer-item" href="https://realpython.github.io/fake-jobs/jobs/clinical-cytogeneticist-72.html" target="_blank">
       Apply
      </a>
     </footer>
    </div>
    
    ------
    <div class="card-content">
     <div class="media">
      <div class="media-left">
       <figure class="image is-48x48">
        <img alt="Real Python Logo" src="https://files.realpython.com/media/real-python-logo-thumbnail.7f0db70c2ed2.jpg?__no_cf_polish=1"/>
       </figure>
      </div>
      <div class="media-content">
       <h2 class="title is-5">
        Print production planner
       </h2>
       <h3 class="subtitle is-6 company">
        Wood Inc
       </h3>
      </div>
     </div>
     <div class="content">
      <p class="location">
       Port Jeremy, AA
      </p>
      <p class="is-small has-text-grey">
       <time datetime="2021-04-08">
        2021-04-08
       </time>
      </p>
     </div>
     <footer class="card-footer">
      <a class="card-footer-item" href="https://www.realpython.com" target="_blank">
       Learn
      </a>
      <a class="card-footer-item" href="https://realpython.github.io/fake-jobs/jobs/print-production-planner-73.html" target="_blank">
       Apply
      </a>
     </footer>
    </div>
    
    ------
    <div class="card-content">
     <div class="media">
      <div class="media-left">
       <figure class="image is-48x48">
        <img alt="Real Python Logo" src="https://files.realpython.com/media/real-python-logo-thumbnail.7f0db70c2ed2.jpg?__no_cf_polish=1"/>
       </figure>
      </div>
      <div class="media-content">
       <h2 class="title is-5">
        Systems developer
       </h2>
       <h3 class="subtitle is-6 company">
        Collins Group
       </h3>
      </div>
     </div>
     <div class="content">
      <p class="location">
       New Elizabethtown, AA
      </p>
      <p class="is-small has-text-grey">
       <time datetime="2021-04-08">
        2021-04-08
       </time>
      </p>
     </div>
     <footer class="card-footer">
      <a class="card-footer-item" href="https://www.realpython.com" target="_blank">
       Learn
      </a>
      <a class="card-footer-item" href="https://realpython.github.io/fake-jobs/jobs/systems-developer-74.html" target="_blank">
       Apply
      </a>
     </footer>
    </div>
    
    ------
    <div class="card-content">
     <div class="media">
      <div class="media-left">
       <figure class="image is-48x48">
        <img alt="Real Python Logo" src="https://files.realpython.com/media/real-python-logo-thumbnail.7f0db70c2ed2.jpg?__no_cf_polish=1"/>
       </figure>
      </div>
      <div class="media-content">
       <h2 class="title is-5">
        Graphic designer
       </h2>
       <h3 class="subtitle is-6 company">
        Flores-Nelson
       </h3>
      </div>
     </div>
     <div class="content">
      <p class="location">
       Charlesstad, AE
      </p>
      <p class="is-small has-text-grey">
       <time datetime="2021-04-08">
        2021-04-08
       </time>
      </p>
     </div>
     <footer class="card-footer">
      <a class="card-footer-item" href="https://www.realpython.com" target="_blank">
       Learn
      </a>
      <a class="card-footer-item" href="https://realpython.github.io/fake-jobs/jobs/graphic-designer-75.html" target="_blank">
       Apply
      </a>
     </footer>
    </div>
    
    ------
    <div class="card-content">
     <div class="media">
      <div class="media-left">
       <figure class="image is-48x48">
        <img alt="Real Python Logo" src="https://files.realpython.com/media/real-python-logo-thumbnail.7f0db70c2ed2.jpg?__no_cf_polish=1"/>
       </figure>
      </div>
      <div class="media-content">
       <h2 class="title is-5">
        Writer
       </h2>
       <h3 class="subtitle is-6 company">
        Mitchell, Jones and Olson
       </h3>
      </div>
     </div>
     <div class="content">
      <p class="location">
       Josephbury, AE
      </p>
      <p class="is-small has-text-grey">
       <time datetime="2021-04-08">
        2021-04-08
       </time>
      </p>
     </div>
     <footer class="card-footer">
      <a class="card-footer-item" href="https://www.realpython.com" target="_blank">
       Learn
      </a>
      <a class="card-footer-item" href="https://realpython.github.io/fake-jobs/jobs/writer-76.html" target="_blank">
       Apply
      </a>
     </footer>
    </div>
    
    ------
    <div class="card-content">
     <div class="media">
      <div class="media-left">
       <figure class="image is-48x48">
        <img alt="Real Python Logo" src="https://files.realpython.com/media/real-python-logo-thumbnail.7f0db70c2ed2.jpg?__no_cf_polish=1"/>
       </figure>
      </div>
      <div class="media-content">
       <h2 class="title is-5">
        Field seismologist
       </h2>
       <h3 class="subtitle is-6 company">
        Howard Group
       </h3>
      </div>
     </div>
     <div class="content">
      <p class="location">
       Seanfurt, AA
      </p>
      <p class="is-small has-text-grey">
       <time datetime="2021-04-08">
        2021-04-08
       </time>
      </p>
     </div>
     <footer class="card-footer">
      <a class="card-footer-item" href="https://www.realpython.com" target="_blank">
       Learn
      </a>
      <a class="card-footer-item" href="https://realpython.github.io/fake-jobs/jobs/field-seismologist-77.html" target="_blank">
       Apply
      </a>
     </footer>
    </div>
    
    ------
    <div class="card-content">
     <div class="media">
      <div class="media-left">
       <figure class="image is-48x48">
        <img alt="Real Python Logo" src="https://files.realpython.com/media/real-python-logo-thumbnail.7f0db70c2ed2.jpg?__no_cf_polish=1"/>
       </figure>
      </div>
      <div class="media-content">
       <h2 class="title is-5">
        Chief Strategy Officer
       </h2>
       <h3 class="subtitle is-6 company">
        Kramer-Edwards
       </h3>
      </div>
     </div>
     <div class="content">
      <p class="location">
       Williambury, AA
      </p>
      <p class="is-small has-text-grey">
       <time datetime="2021-04-08">
        2021-04-08
       </time>
      </p>
     </div>
     <footer class="card-footer">
      <a class="card-footer-item" href="https://www.realpython.com" target="_blank">
       Learn
      </a>
      <a class="card-footer-item" href="https://realpython.github.io/fake-jobs/jobs/chief-strategy-officer-78.html" target="_blank">
       Apply
      </a>
     </footer>
    </div>
    
    ------
    <div class="card-content">
     <div class="media">
      <div class="media-left">
       <figure class="image is-48x48">
        <img alt="Real Python Logo" src="https://files.realpython.com/media/real-python-logo-thumbnail.7f0db70c2ed2.jpg?__no_cf_polish=1"/>
       </figure>
      </div>
      <div class="media-content">
       <h2 class="title is-5">
        Air cabin crew
       </h2>
       <h3 class="subtitle is-6 company">
        Berry-Houston
       </h3>
      </div>
     </div>
     <div class="content">
      <p class="location">
       South Jorgeside, AP
      </p>
      <p class="is-small has-text-grey">
       <time datetime="2021-04-08">
        2021-04-08
       </time>
      </p>
     </div>
     <footer class="card-footer">
      <a class="card-footer-item" href="https://www.realpython.com" target="_blank">
       Learn
      </a>
      <a class="card-footer-item" href="https://realpython.github.io/fake-jobs/jobs/air-cabin-crew-79.html" target="_blank">
       Apply
      </a>
     </footer>
    </div>
    
    ------
    <div class="card-content">
     <div class="media">
      <div class="media-left">
       <figure class="image is-48x48">
        <img alt="Real Python Logo" src="https://files.realpython.com/media/real-python-logo-thumbnail.7f0db70c2ed2.jpg?__no_cf_polish=1"/>
       </figure>
      </div>
      <div class="media-content">
       <h2 class="title is-5">
        Python Programmer (Entry-Level)
       </h2>
       <h3 class="subtitle is-6 company">
        Mathews Inc
       </h3>
      </div>
     </div>
     <div class="content">
      <p class="location">
       Robertborough, AP
      </p>
      <p class="is-small has-text-grey">
       <time datetime="2021-04-08">
        2021-04-08
       </time>
      </p>
     </div>
     <footer class="card-footer">
      <a class="card-footer-item" href="https://www.realpython.com" target="_blank">
       Learn
      </a>
      <a class="card-footer-item" href="https://realpython.github.io/fake-jobs/jobs/python-programmer-entry-level-80.html" target="_blank">
       Apply
      </a>
     </footer>
    </div>
    
    ------
    <div class="card-content">
     <div class="media">
      <div class="media-left">
       <figure class="image is-48x48">
        <img alt="Real Python Logo" src="https://files.realpython.com/media/real-python-logo-thumbnail.7f0db70c2ed2.jpg?__no_cf_polish=1"/>
       </figure>
      </div>
      <div class="media-content">
       <h2 class="title is-5">
        Warden/ranger
       </h2>
       <h3 class="subtitle is-6 company">
        Riley-Johnson
       </h3>
      </div>
     </div>
     <div class="content">
      <p class="location">
       South Saratown, AP
      </p>
      <p class="is-small has-text-grey">
       <time datetime="2021-04-08">
        2021-04-08
       </time>
      </p>
     </div>
     <footer class="card-footer">
      <a class="card-footer-item" href="https://www.realpython.com" target="_blank">
       Learn
      </a>
      <a class="card-footer-item" href="https://realpython.github.io/fake-jobs/jobs/warden-ranger-81.html" target="_blank">
       Apply
      </a>
     </footer>
    </div>
    
    ------
    <div class="card-content">
     <div class="media">
      <div class="media-left">
       <figure class="image is-48x48">
        <img alt="Real Python Logo" src="https://files.realpython.com/media/real-python-logo-thumbnail.7f0db70c2ed2.jpg?__no_cf_polish=1"/>
       </figure>
      </div>
      <div class="media-content">
       <h2 class="title is-5">
        Sports therapist
       </h2>
       <h3 class="subtitle is-6 company">
        Spencer and Sons
       </h3>
      </div>
     </div>
     <div class="content">
      <p class="location">
       Hullview, AA
      </p>
      <p class="is-small has-text-grey">
       <time datetime="2021-04-08">
        2021-04-08
       </time>
      </p>
     </div>
     <footer class="card-footer">
      <a class="card-footer-item" href="https://www.realpython.com" target="_blank">
       Learn
      </a>
      <a class="card-footer-item" href="https://realpython.github.io/fake-jobs/jobs/sports-therapist-82.html" target="_blank">
       Apply
      </a>
     </footer>
    </div>
    
    ------
    <div class="card-content">
     <div class="media">
      <div class="media-left">
       <figure class="image is-48x48">
        <img alt="Real Python Logo" src="https://files.realpython.com/media/real-python-logo-thumbnail.7f0db70c2ed2.jpg?__no_cf_polish=1"/>
       </figure>
      </div>
      <div class="media-content">
       <h2 class="title is-5">
        Arts development officer
       </h2>
       <h3 class="subtitle is-6 company">
        Camacho-Sanchez
       </h3>
      </div>
     </div>
     <div class="content">
      <p class="location">
       Philipland, AP
      </p>
      <p class="is-small has-text-grey">
       <time datetime="2021-04-08">
        2021-04-08
       </time>
      </p>
     </div>
     <footer class="card-footer">
      <a class="card-footer-item" href="https://www.realpython.com" target="_blank">
       Learn
      </a>
      <a class="card-footer-item" href="https://realpython.github.io/fake-jobs/jobs/arts-development-officer-83.html" target="_blank">
       Apply
      </a>
     </footer>
    </div>
    
    ------
    <div class="card-content">
     <div class="media">
      <div class="media-left">
       <figure class="image is-48x48">
        <img alt="Real Python Logo" src="https://files.realpython.com/media/real-python-logo-thumbnail.7f0db70c2ed2.jpg?__no_cf_polish=1"/>
       </figure>
      </div>
      <div class="media-content">
       <h2 class="title is-5">
        Printmaker
       </h2>
       <h3 class="subtitle is-6 company">
        Oliver and Sons
       </h3>
      </div>
     </div>
     <div class="content">
      <p class="location">
       North Patty, AE
      </p>
      <p class="is-small has-text-grey">
       <time datetime="2021-04-08">
        2021-04-08
       </time>
      </p>
     </div>
     <footer class="card-footer">
      <a class="card-footer-item" href="https://www.realpython.com" target="_blank">
       Learn
      </a>
      <a class="card-footer-item" href="https://realpython.github.io/fake-jobs/jobs/printmaker-84.html" target="_blank">
       Apply
      </a>
     </footer>
    </div>
    
    ------
    <div class="card-content">
     <div class="media">
      <div class="media-left">
       <figure class="image is-48x48">
        <img alt="Real Python Logo" src="https://files.realpython.com/media/real-python-logo-thumbnail.7f0db70c2ed2.jpg?__no_cf_polish=1"/>
       </figure>
      </div>
      <div class="media-content">
       <h2 class="title is-5">
        Health and safety adviser
       </h2>
       <h3 class="subtitle is-6 company">
        Eaton PLC
       </h3>
      </div>
     </div>
     <div class="content">
      <p class="location">
       North Stephen, AE
      </p>
      <p class="is-small has-text-grey">
       <time datetime="2021-04-08">
        2021-04-08
       </time>
      </p>
     </div>
     <footer class="card-footer">
      <a class="card-footer-item" href="https://www.realpython.com" target="_blank">
       Learn
      </a>
      <a class="card-footer-item" href="https://realpython.github.io/fake-jobs/jobs/health-and-safety-adviser-85.html" target="_blank">
       Apply
      </a>
     </footer>
    </div>
    
    ------
    <div class="card-content">
     <div class="media">
      <div class="media-left">
       <figure class="image is-48x48">
        <img alt="Real Python Logo" src="https://files.realpython.com/media/real-python-logo-thumbnail.7f0db70c2ed2.jpg?__no_cf_polish=1"/>
       </figure>
      </div>
      <div class="media-content">
       <h2 class="title is-5">
        Manufacturing systems engineer
       </h2>
       <h3 class="subtitle is-6 company">
        Stanley-Frederick
       </h3>
      </div>
     </div>
     <div class="content">
      <p class="location">
       Stevensland, AP
      </p>
      <p class="is-small has-text-grey">
       <time datetime="2021-04-08">
        2021-04-08
       </time>
      </p>
     </div>
     <footer class="card-footer">
      <a class="card-footer-item" href="https://www.realpython.com" target="_blank">
       Learn
      </a>
      <a class="card-footer-item" href="https://realpython.github.io/fake-jobs/jobs/manufacturing-systems-engineer-86.html" target="_blank">
       Apply
      </a>
     </footer>
    </div>
    
    ------
    <div class="card-content">
     <div class="media">
      <div class="media-left">
       <figure class="image is-48x48">
        <img alt="Real Python Logo" src="https://files.realpython.com/media/real-python-logo-thumbnail.7f0db70c2ed2.jpg?__no_cf_polish=1"/>
       </figure>
      </div>
      <div class="media-content">
       <h2 class="title is-5">
        Programmer, applications
       </h2>
       <h3 class="subtitle is-6 company">
        Bradley LLC
       </h3>
      </div>
     </div>
     <div class="content">
      <p class="location">
       Reyesstad, AE
      </p>
      <p class="is-small has-text-grey">
       <time datetime="2021-04-08">
        2021-04-08
       </time>
      </p>
     </div>
     <footer class="card-footer">
      <a class="card-footer-item" href="https://www.realpython.com" target="_blank">
       Learn
      </a>
      <a class="card-footer-item" href="https://realpython.github.io/fake-jobs/jobs/programmer-applications-87.html" target="_blank">
       Apply
      </a>
     </footer>
    </div>
    
    ------
    <div class="card-content">
     <div class="media">
      <div class="media-left">
       <figure class="image is-48x48">
        <img alt="Real Python Logo" src="https://files.realpython.com/media/real-python-logo-thumbnail.7f0db70c2ed2.jpg?__no_cf_polish=1"/>
       </figure>
      </div>
      <div class="media-content">
       <h2 class="title is-5">
        Medical physicist
       </h2>
       <h3 class="subtitle is-6 company">
        Parker, Goodwin and Zavala
       </h3>
      </div>
     </div>
     <div class="content">
      <p class="location">
       Bellberg, AP
      </p>
      <p class="is-small has-text-grey">
       <time datetime="2021-04-08">
        2021-04-08
       </time>
      </p>
     </div>
     <footer class="card-footer">
      <a class="card-footer-item" href="https://www.realpython.com" target="_blank">
       Learn
      </a>
      <a class="card-footer-item" href="https://realpython.github.io/fake-jobs/jobs/medical-physicist-88.html" target="_blank">
       Apply
      </a>
     </footer>
    </div>
    
    ------
    <div class="card-content">
     <div class="media">
      <div class="media-left">
       <figure class="image is-48x48">
        <img alt="Real Python Logo" src="https://files.realpython.com/media/real-python-logo-thumbnail.7f0db70c2ed2.jpg?__no_cf_polish=1"/>
       </figure>
      </div>
      <div class="media-content">
       <h2 class="title is-5">
        Media planner
       </h2>
       <h3 class="subtitle is-6 company">
        Kim-Miles
       </h3>
      </div>
     </div>
     <div class="content">
      <p class="location">
       North Johnland, AE
      </p>
      <p class="is-small has-text-grey">
       <time datetime="2021-04-08">
        2021-04-08
       </time>
      </p>
     </div>
     <footer class="card-footer">
      <a class="card-footer-item" href="https://www.realpython.com" target="_blank">
       Learn
      </a>
      <a class="card-footer-item" href="https://realpython.github.io/fake-jobs/jobs/media-planner-89.html" target="_blank">
       Apply
      </a>
     </footer>
    </div>
    
    ------
    <div class="card-content">
     <div class="media">
      <div class="media-left">
       <figure class="image is-48x48">
        <img alt="Real Python Logo" src="https://files.realpython.com/media/real-python-logo-thumbnail.7f0db70c2ed2.jpg?__no_cf_polish=1"/>
       </figure>
      </div>
      <div class="media-content">
       <h2 class="title is-5">
        Software Developer (Python)
       </h2>
       <h3 class="subtitle is-6 company">
        Moreno-Rodriguez
       </h3>
      </div>
     </div>
     <div class="content">
      <p class="location">
       Martinezburgh, AE
      </p>
      <p class="is-small has-text-grey">
       <time datetime="2021-04-08">
        2021-04-08
       </time>
      </p>
     </div>
     <footer class="card-footer">
      <a class="card-footer-item" href="https://www.realpython.com" target="_blank">
       Learn
      </a>
      <a class="card-footer-item" href="https://realpython.github.io/fake-jobs/jobs/software-developer-python-90.html" target="_blank">
       Apply
      </a>
     </footer>
    </div>
    
    ------
    <div class="card-content">
     <div class="media">
      <div class="media-left">
       <figure class="image is-48x48">
        <img alt="Real Python Logo" src="https://files.realpython.com/media/real-python-logo-thumbnail.7f0db70c2ed2.jpg?__no_cf_polish=1"/>
       </figure>
      </div>
      <div class="media-content">
       <h2 class="title is-5">
        Surveyor, land/geomatics
       </h2>
       <h3 class="subtitle is-6 company">
        Brown-Ortiz
       </h3>
      </div>
     </div>
     <div class="content">
      <p class="location">
       Joshuatown, AE
      </p>
      <p class="is-small has-text-grey">
       <time datetime="2021-04-08">
        2021-04-08
       </time>
      </p>
     </div>
     <footer class="card-footer">
      <a class="card-footer-item" href="https://www.realpython.com" target="_blank">
       Learn
      </a>
      <a class="card-footer-item" href="https://realpython.github.io/fake-jobs/jobs/surveyor-land-geomatics-91.html" target="_blank">
       Apply
      </a>
     </footer>
    </div>
    
    ------
    <div class="card-content">
     <div class="media">
      <div class="media-left">
       <figure class="image is-48x48">
        <img alt="Real Python Logo" src="https://files.realpython.com/media/real-python-logo-thumbnail.7f0db70c2ed2.jpg?__no_cf_polish=1"/>
       </figure>
      </div>
      <div class="media-content">
       <h2 class="title is-5">
        Legal executive
       </h2>
       <h3 class="subtitle is-6 company">
        Hartman PLC
       </h3>
      </div>
     </div>
     <div class="content">
      <p class="location">
       West Ericstad, AA
      </p>
      <p class="is-small has-text-grey">
       <time datetime="2021-04-08">
        2021-04-08
       </time>
      </p>
     </div>
     <footer class="card-footer">
      <a class="card-footer-item" href="https://www.realpython.com" target="_blank">
       Learn
      </a>
      <a class="card-footer-item" href="https://realpython.github.io/fake-jobs/jobs/legal-executive-92.html" target="_blank">
       Apply
      </a>
     </footer>
    </div>
    
    ------
    <div class="card-content">
     <div class="media">
      <div class="media-left">
       <figure class="image is-48x48">
        <img alt="Real Python Logo" src="https://files.realpython.com/media/real-python-logo-thumbnail.7f0db70c2ed2.jpg?__no_cf_polish=1"/>
       </figure>
      </div>
      <div class="media-content">
       <h2 class="title is-5">
        Librarian, academic
       </h2>
       <h3 class="subtitle is-6 company">
        Brooks Inc
       </h3>
      </div>
     </div>
     <div class="content">
      <p class="location">
       Tuckertown, AE
      </p>
      <p class="is-small has-text-grey">
       <time datetime="2021-04-08">
        2021-04-08
       </time>
      </p>
     </div>
     <footer class="card-footer">
      <a class="card-footer-item" href="https://www.realpython.com" target="_blank">
       Learn
      </a>
      <a class="card-footer-item" href="https://realpython.github.io/fake-jobs/jobs/librarian-academic-93.html" target="_blank">
       Apply
      </a>
     </footer>
    </div>
    
    ------
    <div class="card-content">
     <div class="media">
      <div class="media-left">
       <figure class="image is-48x48">
        <img alt="Real Python Logo" src="https://files.realpython.com/media/real-python-logo-thumbnail.7f0db70c2ed2.jpg?__no_cf_polish=1"/>
       </figure>
      </div>
      <div class="media-content">
       <h2 class="title is-5">
        Barrister
       </h2>
       <h3 class="subtitle is-6 company">
        Washington-Castillo
       </h3>
      </div>
     </div>
     <div class="content">
      <p class="location">
       Perezton, AE
      </p>
      <p class="is-small has-text-grey">
       <time datetime="2021-04-08">
        2021-04-08
       </time>
      </p>
     </div>
     <footer class="card-footer">
      <a class="card-footer-item" href="https://www.realpython.com" target="_blank">
       Learn
      </a>
      <a class="card-footer-item" href="https://realpython.github.io/fake-jobs/jobs/barrister-94.html" target="_blank">
       Apply
      </a>
     </footer>
    </div>
    
    ------
    <div class="card-content">
     <div class="media">
      <div class="media-left">
       <figure class="image is-48x48">
        <img alt="Real Python Logo" src="https://files.realpython.com/media/real-python-logo-thumbnail.7f0db70c2ed2.jpg?__no_cf_polish=1"/>
       </figure>
      </div>
      <div class="media-content">
       <h2 class="title is-5">
        Museum/gallery exhibitions officer
       </h2>
       <h3 class="subtitle is-6 company">
        Nguyen, Yoder and Petty
       </h3>
      </div>
     </div>
     <div class="content">
      <p class="location">
       Lake Abigail, AE
      </p>
      <p class="is-small has-text-grey">
       <time datetime="2021-04-08">
        2021-04-08
       </time>
      </p>
     </div>
     <footer class="card-footer">
      <a class="card-footer-item" href="https://www.realpython.com" target="_blank">
       Learn
      </a>
      <a class="card-footer-item" href="https://realpython.github.io/fake-jobs/jobs/museum-gallery-exhibitions-officer-95.html" target="_blank">
       Apply
      </a>
     </footer>
    </div>
    
    ------
    <div class="card-content">
     <div class="media">
      <div class="media-left">
       <figure class="image is-48x48">
        <img alt="Real Python Logo" src="https://files.realpython.com/media/real-python-logo-thumbnail.7f0db70c2ed2.jpg?__no_cf_polish=1"/>
       </figure>
      </div>
      <div class="media-content">
       <h2 class="title is-5">
        Radiographer, diagnostic
       </h2>
       <h3 class="subtitle is-6 company">
        Holder LLC
       </h3>
      </div>
     </div>
     <div class="content">
      <p class="location">
       Jacobshire, AP
      </p>
      <p class="is-small has-text-grey">
       <time datetime="2021-04-08">
        2021-04-08
       </time>
      </p>
     </div>
     <footer class="card-footer">
      <a class="card-footer-item" href="https://www.realpython.com" target="_blank">
       Learn
      </a>
      <a class="card-footer-item" href="https://realpython.github.io/fake-jobs/jobs/radiographer-diagnostic-96.html" target="_blank">
       Apply
      </a>
     </footer>
    </div>
    
    ------
    <div class="card-content">
     <div class="media">
      <div class="media-left">
       <figure class="image is-48x48">
        <img alt="Real Python Logo" src="https://files.realpython.com/media/real-python-logo-thumbnail.7f0db70c2ed2.jpg?__no_cf_polish=1"/>
       </figure>
      </div>
      <div class="media-content">
       <h2 class="title is-5">
        Database administrator
       </h2>
       <h3 class="subtitle is-6 company">
        Yates-Ferguson
       </h3>
      </div>
     </div>
     <div class="content">
      <p class="location">
       Port Susan, AE
      </p>
      <p class="is-small has-text-grey">
       <time datetime="2021-04-08">
        2021-04-08
       </time>
      </p>
     </div>
     <footer class="card-footer">
      <a class="card-footer-item" href="https://www.realpython.com" target="_blank">
       Learn
      </a>
      <a class="card-footer-item" href="https://realpython.github.io/fake-jobs/jobs/database-administrator-97.html" target="_blank">
       Apply
      </a>
     </footer>
    </div>
    
    ------
    <div class="card-content">
     <div class="media">
      <div class="media-left">
       <figure class="image is-48x48">
        <img alt="Real Python Logo" src="https://files.realpython.com/media/real-python-logo-thumbnail.7f0db70c2ed2.jpg?__no_cf_polish=1"/>
       </figure>
      </div>
      <div class="media-content">
       <h2 class="title is-5">
        Furniture designer
       </h2>
       <h3 class="subtitle is-6 company">
        Ortega-Lawrence
       </h3>
      </div>
     </div>
     <div class="content">
      <p class="location">
       North Tiffany, AA
      </p>
      <p class="is-small has-text-grey">
       <time datetime="2021-04-08">
        2021-04-08
       </time>
      </p>
     </div>
     <footer class="card-footer">
      <a class="card-footer-item" href="https://www.realpython.com" target="_blank">
       Learn
      </a>
      <a class="card-footer-item" href="https://realpython.github.io/fake-jobs/jobs/furniture-designer-98.html" target="_blank">
       Apply
      </a>
     </footer>
    </div>
    
    ------
    <div class="card-content">
     <div class="media">
      <div class="media-left">
       <figure class="image is-48x48">
        <img alt="Real Python Logo" src="https://files.realpython.com/media/real-python-logo-thumbnail.7f0db70c2ed2.jpg?__no_cf_polish=1"/>
       </figure>
      </div>
      <div class="media-content">
       <h2 class="title is-5">
        Ship broker
       </h2>
       <h3 class="subtitle is-6 company">
        Fuentes, Walls and Castro
       </h3>
      </div>
     </div>
     <div class="content">
      <p class="location">
       Michelleville, AP
      </p>
      <p class="is-small has-text-grey">
       <time datetime="2021-04-08">
        2021-04-08
       </time>
      </p>
     </div>
     <footer class="card-footer">
      <a class="card-footer-item" href="https://www.realpython.com" target="_blank">
       Learn
      </a>
      <a class="card-footer-item" href="https://realpython.github.io/fake-jobs/jobs/ship-broker-99.html" target="_blank">
       Apply
      </a>
     </footer>
    </div>
    
    ------


If you scroll through the output of the last cell, you can notice some patterns. For example, 

- all the job titles are in a ```<h2 class="title is-5">```, 
- all the companies in ```<h3 class="subtitle is-6 company">```, 
- and all the locations in ```<p class="location">```.

Let's extract each of these fields!


```python
for job_element in job_elements:
    title_element = job_element.find("h2", class_="title is-5")
    company_element = job_element.find("h3", class_="subtitle is-6 company")
    location_element = job_element.find("p", class_="location")
    print(title_element)
    print(company_element)
    print(location_element)
    print("----------------------------------------")
```

    <h2 class="title is-5">Senior Python Developer</h2>
    <h3 class="subtitle is-6 company">Payne, Roberts and Davis</h3>
    <p class="location">
            Stewartbury, AA
          </p>
    ----------------------------------------
    <h2 class="title is-5">Energy engineer</h2>
    <h3 class="subtitle is-6 company">Vasquez-Davidson</h3>
    <p class="location">
            Christopherville, AA
          </p>
    ----------------------------------------
    <h2 class="title is-5">Legal executive</h2>
    <h3 class="subtitle is-6 company">Jackson, Chambers and Levy</h3>
    <p class="location">
            Port Ericaburgh, AA
          </p>
    ----------------------------------------
    <h2 class="title is-5">Fitness centre manager</h2>
    <h3 class="subtitle is-6 company">Savage-Bradley</h3>
    <p class="location">
            East Seanview, AP
          </p>
    ----------------------------------------
    <h2 class="title is-5">Product manager</h2>
    <h3 class="subtitle is-6 company">Ramirez Inc</h3>
    <p class="location">
            North Jamieview, AP
          </p>
    ----------------------------------------
    <h2 class="title is-5">Medical technical officer</h2>
    <h3 class="subtitle is-6 company">Rogers-Yates</h3>
    <p class="location">
            Davidville, AP
          </p>
    ----------------------------------------
    <h2 class="title is-5">Physiological scientist</h2>
    <h3 class="subtitle is-6 company">Kramer-Klein</h3>
    <p class="location">
            South Christopher, AE
          </p>
    ----------------------------------------
    <h2 class="title is-5">Textile designer</h2>
    <h3 class="subtitle is-6 company">Meyers-Johnson</h3>
    <p class="location">
            Port Jonathan, AE
          </p>
    ----------------------------------------
    <h2 class="title is-5">Television floor manager</h2>
    <h3 class="subtitle is-6 company">Hughes-Williams</h3>
    <p class="location">
            Osbornetown, AE
          </p>
    ----------------------------------------
    <h2 class="title is-5">Waste management officer</h2>
    <h3 class="subtitle is-6 company">Jones, Williams and Villa</h3>
    <p class="location">
            Scotttown, AP
          </p>
    ----------------------------------------
    <h2 class="title is-5">Software Engineer (Python)</h2>
    <h3 class="subtitle is-6 company">Garcia PLC</h3>
    <p class="location">
            Ericberg, AE
          </p>
    ----------------------------------------
    <h2 class="title is-5">Interpreter</h2>
    <h3 class="subtitle is-6 company">Gregory and Sons</h3>
    <p class="location">
            Ramireztown, AE
          </p>
    ----------------------------------------
    <h2 class="title is-5">Architect</h2>
    <h3 class="subtitle is-6 company">Clark, Garcia and Sosa</h3>
    <p class="location">
            Figueroaview, AA
          </p>
    ----------------------------------------
    <h2 class="title is-5">Meteorologist</h2>
    <h3 class="subtitle is-6 company">Bush PLC</h3>
    <p class="location">
            Kelseystad, AA
          </p>
    ----------------------------------------
    <h2 class="title is-5">Audiological scientist</h2>
    <h3 class="subtitle is-6 company">Salazar-Meyers</h3>
    <p class="location">
            Williamsburgh, AE
          </p>
    ----------------------------------------
    <h2 class="title is-5">English as a second language teacher</h2>
    <h3 class="subtitle is-6 company">Parker, Murphy and Brooks</h3>
    <p class="location">
            Mitchellburgh, AE
          </p>
    ----------------------------------------
    <h2 class="title is-5">Surgeon</h2>
    <h3 class="subtitle is-6 company">Cruz-Brown</h3>
    <p class="location">
            West Jessicabury, AA
          </p>
    ----------------------------------------
    <h2 class="title is-5">Equities trader</h2>
    <h3 class="subtitle is-6 company">Macdonald-Ferguson</h3>
    <p class="location">
            Maloneshire, AE
          </p>
    ----------------------------------------
    <h2 class="title is-5">Newspaper journalist</h2>
    <h3 class="subtitle is-6 company">Williams, Peterson and Rojas</h3>
    <p class="location">
            Johnsonton, AA
          </p>
    ----------------------------------------
    <h2 class="title is-5">Materials engineer</h2>
    <h3 class="subtitle is-6 company">Smith and Sons</h3>
    <p class="location">
            South Davidtown, AP
          </p>
    ----------------------------------------
    <h2 class="title is-5">Python Programmer (Entry-Level)</h2>
    <h3 class="subtitle is-6 company">Moss, Duncan and Allen</h3>
    <p class="location">
            Port Sara, AE
          </p>
    ----------------------------------------
    <h2 class="title is-5">Product/process development scientist</h2>
    <h3 class="subtitle is-6 company">Gomez-Carroll</h3>
    <p class="location">
            Marktown, AA
          </p>
    ----------------------------------------
    <h2 class="title is-5">Scientist, research (maths)</h2>
    <h3 class="subtitle is-6 company">Manning, Welch and Herring</h3>
    <p class="location">
            Laurenland, AE
          </p>
    ----------------------------------------
    <h2 class="title is-5">Ecologist</h2>
    <h3 class="subtitle is-6 company">Lee, Gutierrez and Brown</h3>
    <p class="location">
            Lauraton, AP
          </p>
    ----------------------------------------
    <h2 class="title is-5">Materials engineer</h2>
    <h3 class="subtitle is-6 company">Davis, Serrano and Cook</h3>
    <p class="location">
            South Tammyberg, AP
          </p>
    ----------------------------------------
    <h2 class="title is-5">Historic buildings inspector/conservation officer</h2>
    <h3 class="subtitle is-6 company">Smith LLC</h3>
    <p class="location">
            North Brandonville, AP
          </p>
    ----------------------------------------
    <h2 class="title is-5">Data scientist</h2>
    <h3 class="subtitle is-6 company">Thomas Group</h3>
    <p class="location">
            Port Robertfurt, AA
          </p>
    ----------------------------------------
    <h2 class="title is-5">Psychiatrist</h2>
    <h3 class="subtitle is-6 company">Silva-King</h3>
    <p class="location">
            Burnettbury, AE
          </p>
    ----------------------------------------
    <h2 class="title is-5">Structural engineer</h2>
    <h3 class="subtitle is-6 company">Pierce-Long</h3>
    <p class="location">
            Herbertside, AA
          </p>
    ----------------------------------------
    <h2 class="title is-5">Immigration officer</h2>
    <h3 class="subtitle is-6 company">Walker-Simpson</h3>
    <p class="location">
            Christopherport, AP
          </p>
    ----------------------------------------
    <h2 class="title is-5">Python Programmer (Entry-Level)</h2>
    <h3 class="subtitle is-6 company">Cooper and Sons</h3>
    <p class="location">
            West Victor, AE
          </p>
    ----------------------------------------
    <h2 class="title is-5">Neurosurgeon</h2>
    <h3 class="subtitle is-6 company">Donovan, Gonzalez and Figueroa</h3>
    <p class="location">
            Port Aaron, AP
          </p>
    ----------------------------------------
    <h2 class="title is-5">Broadcast engineer</h2>
    <h3 class="subtitle is-6 company">Morgan, Butler and Bennett</h3>
    <p class="location">
            Loribury, AA
          </p>
    ----------------------------------------
    <h2 class="title is-5">Make</h2>
    <h3 class="subtitle is-6 company">Snyder-Lee</h3>
    <p class="location">
            Angelastad, AP
          </p>
    ----------------------------------------
    <h2 class="title is-5">Nurse, adult</h2>
    <h3 class="subtitle is-6 company">Harris PLC</h3>
    <p class="location">
            Larrytown, AE
          </p>
    ----------------------------------------
    <h2 class="title is-5">Air broker</h2>
    <h3 class="subtitle is-6 company">Washington PLC</h3>
    <p class="location">
            West Colin, AP
          </p>
    ----------------------------------------
    <h2 class="title is-5">Editor, film/video</h2>
    <h3 class="subtitle is-6 company">Brown, Price and Campbell</h3>
    <p class="location">
            West Stephanie, AP
          </p>
    ----------------------------------------
    <h2 class="title is-5">Production assistant, radio</h2>
    <h3 class="subtitle is-6 company">Mcgee PLC</h3>
    <p class="location">
            Laurentown, AP
          </p>
    ----------------------------------------
    <h2 class="title is-5">Engineer, communications</h2>
    <h3 class="subtitle is-6 company">Dixon Inc</h3>
    <p class="location">
            Wrightberg, AP
          </p>
    ----------------------------------------
    <h2 class="title is-5">Sales executive</h2>
    <h3 class="subtitle is-6 company">Thompson, Sheppard and Ward</h3>
    <p class="location">
            Alberttown, AE
          </p>
    ----------------------------------------
    <h2 class="title is-5">Software Developer (Python)</h2>
    <h3 class="subtitle is-6 company">Adams-Brewer</h3>
    <p class="location">
            Brockburgh, AE
          </p>
    ----------------------------------------
    <h2 class="title is-5">Futures trader</h2>
    <h3 class="subtitle is-6 company">Schneider-Brady</h3>
    <p class="location">
            North Jason, AE
          </p>
    ----------------------------------------
    <h2 class="title is-5">Tour manager</h2>
    <h3 class="subtitle is-6 company">Gonzales-Frank</h3>
    <p class="location">
            Arnoldhaven, AE
          </p>
    ----------------------------------------
    <h2 class="title is-5">Cytogeneticist</h2>
    <h3 class="subtitle is-6 company">Smith-Wong</h3>
    <p class="location">
            Lake Destiny, AP
          </p>
    ----------------------------------------
    <h2 class="title is-5">Designer, multimedia</h2>
    <h3 class="subtitle is-6 company">Pierce-Herrera</h3>
    <p class="location">
            South Timothyburgh, AP
          </p>
    ----------------------------------------
    <h2 class="title is-5">Trade union research officer</h2>
    <h3 class="subtitle is-6 company">Aguilar, Rivera and Quinn</h3>
    <p class="location">
            New Jimmyton, AE
          </p>
    ----------------------------------------
    <h2 class="title is-5">Chemist, analytical</h2>
    <h3 class="subtitle is-6 company">Lowe, Barnes and Thomas</h3>
    <p class="location">
            New Lucasbury, AP
          </p>
    ----------------------------------------
    <h2 class="title is-5">Programmer, multimedia</h2>
    <h3 class="subtitle is-6 company">Lewis, Gonzalez and Vasquez</h3>
    <p class="location">
            Port Cory, AE
          </p>
    ----------------------------------------
    <h2 class="title is-5">Engineer, broadcasting (operations)</h2>
    <h3 class="subtitle is-6 company">Taylor PLC</h3>
    <p class="location">
            Gileston, AA
          </p>
    ----------------------------------------
    <h2 class="title is-5">Teacher, primary school</h2>
    <h3 class="subtitle is-6 company">Oliver, Jones and Ramirez</h3>
    <p class="location">
            Cindyshire, AA
          </p>
    ----------------------------------------
    <h2 class="title is-5">Python Developer</h2>
    <h3 class="subtitle is-6 company">Rivera and Sons</h3>
    <p class="location">
            East Michaelfort, AA
          </p>
    ----------------------------------------
    <h2 class="title is-5">Manufacturing systems engineer</h2>
    <h3 class="subtitle is-6 company">Garcia PLC</h3>
    <p class="location">
            Joybury, AE
          </p>
    ----------------------------------------
    <h2 class="title is-5">Producer, television/film/video</h2>
    <h3 class="subtitle is-6 company">Johnson, Wells and Kramer</h3>
    <p class="location">
            Emmatown, AE
          </p>
    ----------------------------------------
    <h2 class="title is-5">Scientist, forensic</h2>
    <h3 class="subtitle is-6 company">Gonzalez LLC</h3>
    <p class="location">
            Colehaven, AP
          </p>
    ----------------------------------------
    <h2 class="title is-5">Bonds trader</h2>
    <h3 class="subtitle is-6 company">Morgan, White and Macdonald</h3>
    <p class="location">
            Port Coryton, AE
          </p>
    ----------------------------------------
    <h2 class="title is-5">Editorial assistant</h2>
    <h3 class="subtitle is-6 company">Robinson-Fitzpatrick</h3>
    <p class="location">
            Amyborough, AA
          </p>
    ----------------------------------------
    <h2 class="title is-5">Photographer</h2>
    <h3 class="subtitle is-6 company">Waters, Wilson and Hoover</h3>
    <p class="location">
            Reynoldsville, AA
          </p>
    ----------------------------------------
    <h2 class="title is-5">Retail banker</h2>
    <h3 class="subtitle is-6 company">Hill LLC</h3>
    <p class="location">
            Port Billy, AP
          </p>
    ----------------------------------------
    <h2 class="title is-5">Jewellery designer</h2>
    <h3 class="subtitle is-6 company">Li-Gregory</h3>
    <p class="location">
            Adamburgh, AA
          </p>
    ----------------------------------------
    <h2 class="title is-5">Ophthalmologist</h2>
    <h3 class="subtitle is-6 company">Fisher, Ryan and Coleman</h3>
    <p class="location">
            Wilsonmouth, AA
          </p>
    ----------------------------------------
    <h2 class="title is-5">Back-End Web Developer (Python, Django)</h2>
    <h3 class="subtitle is-6 company">Stewart-Alexander</h3>
    <p class="location">
            South Kimberly, AA
          </p>
    ----------------------------------------
    <h2 class="title is-5">Licensed conveyancer</h2>
    <h3 class="subtitle is-6 company">Abbott and Sons</h3>
    <p class="location">
            Benjaminland, AP
          </p>
    ----------------------------------------
    <h2 class="title is-5">Futures trader</h2>
    <h3 class="subtitle is-6 company">Bryant, Santana and Davenport</h3>
    <p class="location">
            Zacharyport, AA
          </p>
    ----------------------------------------
    <h2 class="title is-5">Counselling psychologist</h2>
    <h3 class="subtitle is-6 company">Smith PLC</h3>
    <p class="location">
            Port Devonville, AE
          </p>
    ----------------------------------------
    <h2 class="title is-5">Insurance underwriter</h2>
    <h3 class="subtitle is-6 company">Patterson-Singh</h3>
    <p class="location">
            East Thomas, AE
          </p>
    ----------------------------------------
    <h2 class="title is-5">Engineer, automotive</h2>
    <h3 class="subtitle is-6 company">Martinez-Berry</h3>
    <p class="location">
            New Jeffrey, AP
          </p>
    ----------------------------------------
    <h2 class="title is-5">Producer, radio</h2>
    <h3 class="subtitle is-6 company">May, Taylor and Fisher</h3>
    <p class="location">
            Davidside, AA
          </p>
    ----------------------------------------
    <h2 class="title is-5">Dispensing optician</h2>
    <h3 class="subtitle is-6 company">Bailey, Owen and Thompson</h3>
    <p class="location">
            Jamesville, AA
          </p>
    ----------------------------------------
    <h2 class="title is-5">Designer, fashion/clothing</h2>
    <h3 class="subtitle is-6 company">Vasquez Ltd</h3>
    <p class="location">
            New Kelly, AP
          </p>
    ----------------------------------------
    <h2 class="title is-5">Chartered loss adjuster</h2>
    <h3 class="subtitle is-6 company">Leblanc LLC</h3>
    <p class="location">
            Lake Antonio, AA
          </p>
    ----------------------------------------
    <h2 class="title is-5">Back-End Web Developer (Python, Django)</h2>
    <h3 class="subtitle is-6 company">Jackson, Ali and Mckee</h3>
    <p class="location">
            New Elizabethside, AA
          </p>
    ----------------------------------------
    <h2 class="title is-5">Forest/woodland manager</h2>
    <h3 class="subtitle is-6 company">Blankenship, Knight and Powell</h3>
    <p class="location">
            Millsbury, AE
          </p>
    ----------------------------------------
    <h2 class="title is-5">Clinical cytogeneticist</h2>
    <h3 class="subtitle is-6 company">Patton, Haynes and Jones</h3>
    <p class="location">
            Lloydton, AP
          </p>
    ----------------------------------------
    <h2 class="title is-5">Print production planner</h2>
    <h3 class="subtitle is-6 company">Wood Inc</h3>
    <p class="location">
            Port Jeremy, AA
          </p>
    ----------------------------------------
    <h2 class="title is-5">Systems developer</h2>
    <h3 class="subtitle is-6 company">Collins Group</h3>
    <p class="location">
            New Elizabethtown, AA
          </p>
    ----------------------------------------
    <h2 class="title is-5">Graphic designer</h2>
    <h3 class="subtitle is-6 company">Flores-Nelson</h3>
    <p class="location">
            Charlesstad, AE
          </p>
    ----------------------------------------
    <h2 class="title is-5">Writer</h2>
    <h3 class="subtitle is-6 company">Mitchell, Jones and Olson</h3>
    <p class="location">
            Josephbury, AE
          </p>
    ----------------------------------------
    <h2 class="title is-5">Field seismologist</h2>
    <h3 class="subtitle is-6 company">Howard Group</h3>
    <p class="location">
            Seanfurt, AA
          </p>
    ----------------------------------------
    <h2 class="title is-5">Chief Strategy Officer</h2>
    <h3 class="subtitle is-6 company">Kramer-Edwards</h3>
    <p class="location">
            Williambury, AA
          </p>
    ----------------------------------------
    <h2 class="title is-5">Air cabin crew</h2>
    <h3 class="subtitle is-6 company">Berry-Houston</h3>
    <p class="location">
            South Jorgeside, AP
          </p>
    ----------------------------------------
    <h2 class="title is-5">Python Programmer (Entry-Level)</h2>
    <h3 class="subtitle is-6 company">Mathews Inc</h3>
    <p class="location">
            Robertborough, AP
          </p>
    ----------------------------------------
    <h2 class="title is-5">Warden/ranger</h2>
    <h3 class="subtitle is-6 company">Riley-Johnson</h3>
    <p class="location">
            South Saratown, AP
          </p>
    ----------------------------------------
    <h2 class="title is-5">Sports therapist</h2>
    <h3 class="subtitle is-6 company">Spencer and Sons</h3>
    <p class="location">
            Hullview, AA
          </p>
    ----------------------------------------
    <h2 class="title is-5">Arts development officer</h2>
    <h3 class="subtitle is-6 company">Camacho-Sanchez</h3>
    <p class="location">
            Philipland, AP
          </p>
    ----------------------------------------
    <h2 class="title is-5">Printmaker</h2>
    <h3 class="subtitle is-6 company">Oliver and Sons</h3>
    <p class="location">
            North Patty, AE
          </p>
    ----------------------------------------
    <h2 class="title is-5">Health and safety adviser</h2>
    <h3 class="subtitle is-6 company">Eaton PLC</h3>
    <p class="location">
            North Stephen, AE
          </p>
    ----------------------------------------
    <h2 class="title is-5">Manufacturing systems engineer</h2>
    <h3 class="subtitle is-6 company">Stanley-Frederick</h3>
    <p class="location">
            Stevensland, AP
          </p>
    ----------------------------------------
    <h2 class="title is-5">Programmer, applications</h2>
    <h3 class="subtitle is-6 company">Bradley LLC</h3>
    <p class="location">
            Reyesstad, AE
          </p>
    ----------------------------------------
    <h2 class="title is-5">Medical physicist</h2>
    <h3 class="subtitle is-6 company">Parker, Goodwin and Zavala</h3>
    <p class="location">
            Bellberg, AP
          </p>
    ----------------------------------------
    <h2 class="title is-5">Media planner</h2>
    <h3 class="subtitle is-6 company">Kim-Miles</h3>
    <p class="location">
            North Johnland, AE
          </p>
    ----------------------------------------
    <h2 class="title is-5">Software Developer (Python)</h2>
    <h3 class="subtitle is-6 company">Moreno-Rodriguez</h3>
    <p class="location">
            Martinezburgh, AE
          </p>
    ----------------------------------------
    <h2 class="title is-5">Surveyor, land/geomatics</h2>
    <h3 class="subtitle is-6 company">Brown-Ortiz</h3>
    <p class="location">
            Joshuatown, AE
          </p>
    ----------------------------------------
    <h2 class="title is-5">Legal executive</h2>
    <h3 class="subtitle is-6 company">Hartman PLC</h3>
    <p class="location">
            West Ericstad, AA
          </p>
    ----------------------------------------
    <h2 class="title is-5">Librarian, academic</h2>
    <h3 class="subtitle is-6 company">Brooks Inc</h3>
    <p class="location">
            Tuckertown, AE
          </p>
    ----------------------------------------
    <h2 class="title is-5">Barrister</h2>
    <h3 class="subtitle is-6 company">Washington-Castillo</h3>
    <p class="location">
            Perezton, AE
          </p>
    ----------------------------------------
    <h2 class="title is-5">Museum/gallery exhibitions officer</h2>
    <h3 class="subtitle is-6 company">Nguyen, Yoder and Petty</h3>
    <p class="location">
            Lake Abigail, AE
          </p>
    ----------------------------------------
    <h2 class="title is-5">Radiographer, diagnostic</h2>
    <h3 class="subtitle is-6 company">Holder LLC</h3>
    <p class="location">
            Jacobshire, AP
          </p>
    ----------------------------------------
    <h2 class="title is-5">Database administrator</h2>
    <h3 class="subtitle is-6 company">Yates-Ferguson</h3>
    <p class="location">
            Port Susan, AE
          </p>
    ----------------------------------------
    <h2 class="title is-5">Furniture designer</h2>
    <h3 class="subtitle is-6 company">Ortega-Lawrence</h3>
    <p class="location">
            North Tiffany, AA
          </p>
    ----------------------------------------
    <h2 class="title is-5">Ship broker</h2>
    <h3 class="subtitle is-6 company">Fuentes, Walls and Castro</h3>
    <p class="location">
            Michelleville, AP
          </p>
    ----------------------------------------


Still a little messy, we can clean it up with ```.strip()```:


```python
for job_element in job_elements:
    title_element = job_element.find("h2", class_="title is-5")
    company_element = job_element.find("h3", class_="subtitle is-6 company")
    location_element = job_element.find("p", class_="location")
    print(f"Title: {title_element.text.strip()}")
    print(f"Company: {company_element.text.strip()}")
    print(f"Location: {location_element.text.strip()}")
    print("----------------------------------------")
```

    Title: Senior Python Developer
    Company: Payne, Roberts and Davis
    Location: Stewartbury, AA
    ----------------------------------------
    Title: Energy engineer
    Company: Vasquez-Davidson
    Location: Christopherville, AA
    ----------------------------------------
    Title: Legal executive
    Company: Jackson, Chambers and Levy
    Location: Port Ericaburgh, AA
    ----------------------------------------
    Title: Fitness centre manager
    Company: Savage-Bradley
    Location: East Seanview, AP
    ----------------------------------------
    Title: Product manager
    Company: Ramirez Inc
    Location: North Jamieview, AP
    ----------------------------------------
    Title: Medical technical officer
    Company: Rogers-Yates
    Location: Davidville, AP
    ----------------------------------------
    Title: Physiological scientist
    Company: Kramer-Klein
    Location: South Christopher, AE
    ----------------------------------------
    Title: Textile designer
    Company: Meyers-Johnson
    Location: Port Jonathan, AE
    ----------------------------------------
    Title: Television floor manager
    Company: Hughes-Williams
    Location: Osbornetown, AE
    ----------------------------------------
    Title: Waste management officer
    Company: Jones, Williams and Villa
    Location: Scotttown, AP
    ----------------------------------------
    Title: Software Engineer (Python)
    Company: Garcia PLC
    Location: Ericberg, AE
    ----------------------------------------
    Title: Interpreter
    Company: Gregory and Sons
    Location: Ramireztown, AE
    ----------------------------------------
    Title: Architect
    Company: Clark, Garcia and Sosa
    Location: Figueroaview, AA
    ----------------------------------------
    Title: Meteorologist
    Company: Bush PLC
    Location: Kelseystad, AA
    ----------------------------------------
    Title: Audiological scientist
    Company: Salazar-Meyers
    Location: Williamsburgh, AE
    ----------------------------------------
    Title: English as a second language teacher
    Company: Parker, Murphy and Brooks
    Location: Mitchellburgh, AE
    ----------------------------------------
    Title: Surgeon
    Company: Cruz-Brown
    Location: West Jessicabury, AA
    ----------------------------------------
    Title: Equities trader
    Company: Macdonald-Ferguson
    Location: Maloneshire, AE
    ----------------------------------------
    Title: Newspaper journalist
    Company: Williams, Peterson and Rojas
    Location: Johnsonton, AA
    ----------------------------------------
    Title: Materials engineer
    Company: Smith and Sons
    Location: South Davidtown, AP
    ----------------------------------------
    Title: Python Programmer (Entry-Level)
    Company: Moss, Duncan and Allen
    Location: Port Sara, AE
    ----------------------------------------
    Title: Product/process development scientist
    Company: Gomez-Carroll
    Location: Marktown, AA
    ----------------------------------------
    Title: Scientist, research (maths)
    Company: Manning, Welch and Herring
    Location: Laurenland, AE
    ----------------------------------------
    Title: Ecologist
    Company: Lee, Gutierrez and Brown
    Location: Lauraton, AP
    ----------------------------------------
    Title: Materials engineer
    Company: Davis, Serrano and Cook
    Location: South Tammyberg, AP
    ----------------------------------------
    Title: Historic buildings inspector/conservation officer
    Company: Smith LLC
    Location: North Brandonville, AP
    ----------------------------------------
    Title: Data scientist
    Company: Thomas Group
    Location: Port Robertfurt, AA
    ----------------------------------------
    Title: Psychiatrist
    Company: Silva-King
    Location: Burnettbury, AE
    ----------------------------------------
    Title: Structural engineer
    Company: Pierce-Long
    Location: Herbertside, AA
    ----------------------------------------
    Title: Immigration officer
    Company: Walker-Simpson
    Location: Christopherport, AP
    ----------------------------------------
    Title: Python Programmer (Entry-Level)
    Company: Cooper and Sons
    Location: West Victor, AE
    ----------------------------------------
    Title: Neurosurgeon
    Company: Donovan, Gonzalez and Figueroa
    Location: Port Aaron, AP
    ----------------------------------------
    Title: Broadcast engineer
    Company: Morgan, Butler and Bennett
    Location: Loribury, AA
    ----------------------------------------
    Title: Make
    Company: Snyder-Lee
    Location: Angelastad, AP
    ----------------------------------------
    Title: Nurse, adult
    Company: Harris PLC
    Location: Larrytown, AE
    ----------------------------------------
    Title: Air broker
    Company: Washington PLC
    Location: West Colin, AP
    ----------------------------------------
    Title: Editor, film/video
    Company: Brown, Price and Campbell
    Location: West Stephanie, AP
    ----------------------------------------
    Title: Production assistant, radio
    Company: Mcgee PLC
    Location: Laurentown, AP
    ----------------------------------------
    Title: Engineer, communications
    Company: Dixon Inc
    Location: Wrightberg, AP
    ----------------------------------------
    Title: Sales executive
    Company: Thompson, Sheppard and Ward
    Location: Alberttown, AE
    ----------------------------------------
    Title: Software Developer (Python)
    Company: Adams-Brewer
    Location: Brockburgh, AE
    ----------------------------------------
    Title: Futures trader
    Company: Schneider-Brady
    Location: North Jason, AE
    ----------------------------------------
    Title: Tour manager
    Company: Gonzales-Frank
    Location: Arnoldhaven, AE
    ----------------------------------------
    Title: Cytogeneticist
    Company: Smith-Wong
    Location: Lake Destiny, AP
    ----------------------------------------
    Title: Designer, multimedia
    Company: Pierce-Herrera
    Location: South Timothyburgh, AP
    ----------------------------------------
    Title: Trade union research officer
    Company: Aguilar, Rivera and Quinn
    Location: New Jimmyton, AE
    ----------------------------------------
    Title: Chemist, analytical
    Company: Lowe, Barnes and Thomas
    Location: New Lucasbury, AP
    ----------------------------------------
    Title: Programmer, multimedia
    Company: Lewis, Gonzalez and Vasquez
    Location: Port Cory, AE
    ----------------------------------------
    Title: Engineer, broadcasting (operations)
    Company: Taylor PLC
    Location: Gileston, AA
    ----------------------------------------
    Title: Teacher, primary school
    Company: Oliver, Jones and Ramirez
    Location: Cindyshire, AA
    ----------------------------------------
    Title: Python Developer
    Company: Rivera and Sons
    Location: East Michaelfort, AA
    ----------------------------------------
    Title: Manufacturing systems engineer
    Company: Garcia PLC
    Location: Joybury, AE
    ----------------------------------------
    Title: Producer, television/film/video
    Company: Johnson, Wells and Kramer
    Location: Emmatown, AE
    ----------------------------------------
    Title: Scientist, forensic
    Company: Gonzalez LLC
    Location: Colehaven, AP
    ----------------------------------------
    Title: Bonds trader
    Company: Morgan, White and Macdonald
    Location: Port Coryton, AE
    ----------------------------------------
    Title: Editorial assistant
    Company: Robinson-Fitzpatrick
    Location: Amyborough, AA
    ----------------------------------------
    Title: Photographer
    Company: Waters, Wilson and Hoover
    Location: Reynoldsville, AA
    ----------------------------------------
    Title: Retail banker
    Company: Hill LLC
    Location: Port Billy, AP
    ----------------------------------------
    Title: Jewellery designer
    Company: Li-Gregory
    Location: Adamburgh, AA
    ----------------------------------------
    Title: Ophthalmologist
    Company: Fisher, Ryan and Coleman
    Location: Wilsonmouth, AA
    ----------------------------------------
    Title: Back-End Web Developer (Python, Django)
    Company: Stewart-Alexander
    Location: South Kimberly, AA
    ----------------------------------------
    Title: Licensed conveyancer
    Company: Abbott and Sons
    Location: Benjaminland, AP
    ----------------------------------------
    Title: Futures trader
    Company: Bryant, Santana and Davenport
    Location: Zacharyport, AA
    ----------------------------------------
    Title: Counselling psychologist
    Company: Smith PLC
    Location: Port Devonville, AE
    ----------------------------------------
    Title: Insurance underwriter
    Company: Patterson-Singh
    Location: East Thomas, AE
    ----------------------------------------
    Title: Engineer, automotive
    Company: Martinez-Berry
    Location: New Jeffrey, AP
    ----------------------------------------
    Title: Producer, radio
    Company: May, Taylor and Fisher
    Location: Davidside, AA
    ----------------------------------------
    Title: Dispensing optician
    Company: Bailey, Owen and Thompson
    Location: Jamesville, AA
    ----------------------------------------
    Title: Designer, fashion/clothing
    Company: Vasquez Ltd
    Location: New Kelly, AP
    ----------------------------------------
    Title: Chartered loss adjuster
    Company: Leblanc LLC
    Location: Lake Antonio, AA
    ----------------------------------------
    Title: Back-End Web Developer (Python, Django)
    Company: Jackson, Ali and Mckee
    Location: New Elizabethside, AA
    ----------------------------------------
    Title: Forest/woodland manager
    Company: Blankenship, Knight and Powell
    Location: Millsbury, AE
    ----------------------------------------
    Title: Clinical cytogeneticist
    Company: Patton, Haynes and Jones
    Location: Lloydton, AP
    ----------------------------------------
    Title: Print production planner
    Company: Wood Inc
    Location: Port Jeremy, AA
    ----------------------------------------
    Title: Systems developer
    Company: Collins Group
    Location: New Elizabethtown, AA
    ----------------------------------------
    Title: Graphic designer
    Company: Flores-Nelson
    Location: Charlesstad, AE
    ----------------------------------------
    Title: Writer
    Company: Mitchell, Jones and Olson
    Location: Josephbury, AE
    ----------------------------------------
    Title: Field seismologist
    Company: Howard Group
    Location: Seanfurt, AA
    ----------------------------------------
    Title: Chief Strategy Officer
    Company: Kramer-Edwards
    Location: Williambury, AA
    ----------------------------------------
    Title: Air cabin crew
    Company: Berry-Houston
    Location: South Jorgeside, AP
    ----------------------------------------
    Title: Python Programmer (Entry-Level)
    Company: Mathews Inc
    Location: Robertborough, AP
    ----------------------------------------
    Title: Warden/ranger
    Company: Riley-Johnson
    Location: South Saratown, AP
    ----------------------------------------
    Title: Sports therapist
    Company: Spencer and Sons
    Location: Hullview, AA
    ----------------------------------------
    Title: Arts development officer
    Company: Camacho-Sanchez
    Location: Philipland, AP
    ----------------------------------------
    Title: Printmaker
    Company: Oliver and Sons
    Location: North Patty, AE
    ----------------------------------------
    Title: Health and safety adviser
    Company: Eaton PLC
    Location: North Stephen, AE
    ----------------------------------------
    Title: Manufacturing systems engineer
    Company: Stanley-Frederick
    Location: Stevensland, AP
    ----------------------------------------
    Title: Programmer, applications
    Company: Bradley LLC
    Location: Reyesstad, AE
    ----------------------------------------
    Title: Medical physicist
    Company: Parker, Goodwin and Zavala
    Location: Bellberg, AP
    ----------------------------------------
    Title: Media planner
    Company: Kim-Miles
    Location: North Johnland, AE
    ----------------------------------------
    Title: Software Developer (Python)
    Company: Moreno-Rodriguez
    Location: Martinezburgh, AE
    ----------------------------------------
    Title: Surveyor, land/geomatics
    Company: Brown-Ortiz
    Location: Joshuatown, AE
    ----------------------------------------
    Title: Legal executive
    Company: Hartman PLC
    Location: West Ericstad, AA
    ----------------------------------------
    Title: Librarian, academic
    Company: Brooks Inc
    Location: Tuckertown, AE
    ----------------------------------------
    Title: Barrister
    Company: Washington-Castillo
    Location: Perezton, AE
    ----------------------------------------
    Title: Museum/gallery exhibitions officer
    Company: Nguyen, Yoder and Petty
    Location: Lake Abigail, AE
    ----------------------------------------
    Title: Radiographer, diagnostic
    Company: Holder LLC
    Location: Jacobshire, AP
    ----------------------------------------
    Title: Database administrator
    Company: Yates-Ferguson
    Location: Port Susan, AE
    ----------------------------------------
    Title: Furniture designer
    Company: Ortega-Lawrence
    Location: North Tiffany, AA
    ----------------------------------------
    Title: Ship broker
    Company: Fuentes, Walls and Castro
    Location: Michelleville, AP
    ----------------------------------------


## Loading into a pandas dataframe

So we can extract and print some elements in a page, but now we want to build a dataset out of it.


```python
import pandas as pd

# lists to store the extracted data
titles = []
companies = []
locations = []

# Extract each element and append to the respective list
for job_element in job_elements:
    title_element = job_element.find("h2", class_="title is-5")
    company_element = job_element.find("h3", class_="subtitle is-6 company")
    location_element = job_element.find("p", class_="location")
    
    # if the element exists, append to list
    if title_element:
        titles.append(title_element.text.strip())
    else:
        titles.append(None)
    
    if company_element:
        companies.append(company_element.text.strip())
    else:
        companies.append(None)
    
    if location_element:
        locations.append(location_element.text.strip())
    else:
        locations.append(None)

# Create a DataFrame using pandas
jobs_df = pd.DataFrame({
    'Title': titles,
    'Company': companies,
    'Location': locations
})
```

Now we have a dataframe that we can export as a csv!


```python
jobs_df.head()

# jobs_df.to_csv("Jobs.csv")
```




<div>
<style scoped>
    .dataframe tbody tr th:only-of-type {
        vertical-align: middle;
    }

    .dataframe tbody tr th {
        vertical-align: top;
    }

    .dataframe thead th {
        text-align: right;
    }
</style>
<table border="1" class="dataframe">
  <thead>
    <tr style="text-align: right;">
      <th></th>
      <th>Title</th>
      <th>Company</th>
      <th>Location</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>0</th>
      <td>Senior Python Developer</td>
      <td>Payne, Roberts and Davis</td>
      <td>Stewartbury, AA</td>
    </tr>
    <tr>
      <th>1</th>
      <td>Energy engineer</td>
      <td>Vasquez-Davidson</td>
      <td>Christopherville, AA</td>
    </tr>
    <tr>
      <th>2</th>
      <td>Legal executive</td>
      <td>Jackson, Chambers and Levy</td>
      <td>Port Ericaburgh, AA</td>
    </tr>
    <tr>
      <th>3</th>
      <td>Fitness centre manager</td>
      <td>Savage-Bradley</td>
      <td>East Seanview, AP</td>
    </tr>
    <tr>
      <th>4</th>
      <td>Product manager</td>
      <td>Ramirez Inc</td>
      <td>North Jamieview, AP</td>
    </tr>
  </tbody>
</table>
</div>



# Selenium

Now that you've seen some of the basics of web scraping using BeautifulSoup, I want to introduce a more dynamic tool—Selenium. While BeautifulSoup is fantastic for straightforward tasks involving static websites, it falls short when you encounter web pages that rely heavily on JavaScript to load content dynamically. This is where Selenium steps in, giving you the power to interact with web pages just like a user would.

Using Python and Selenium for web scraping offers several advantages over other web scraping techniques:

- Dynamic websites: Dynamic web pages are created using JavaScript or other scripting languages. These pages often contain visible elements once the page is fully loaded or when the user interacts with them. Selenium can interact with these elements, making it a powerful tool for scraping data from dynamic web pages.
- User interactions: Selenium can simulate user interactions like clicks, form submissions, and scrolling. This allows you to scrape websites that require user input, such as login forms.
- Debugging: Selenium can be run in debug mode, which allows you to step through the scraping process and see what the scraper is doing at each step. This is useful for troubleshooting when things go wrong.


## Setup
1. pip install selenium
2. Install a WebDriver: WebDriver is a separate executable that Selenium uses to control the browser. For this guide, I will be using ChromeDriver. Here are the links I found to download WebDriver for the most popular browsers:

    - Chrome: https://sites.google.com/a/chromium.org/chromedriver/downloads
    - Firefox: https://github.com/mozilla/geckodriver/releases
    - Edge: https://developer.microsoft.com/en-us/microsoft-edge/tools/webdriver/

    


3. In your Python script or Jupyter Notebook, run this code snippet. This will set up your Python script to open and control a new instance of Google Chrome through Selenium.


    ```
    from selenium import webdriver
    driver = webdriver.Chrome('/path/to/chromedriver')
    ```

After installing, try running this next cell. A separate chrome window should pop up with the ```quotes.toscrape.com/js-delayed``` webpage. Similar to the previous example, this one is a "toy" website built for people to practice web scraping. The webpage contains pages of famous quotes, except this time, it's loaded dynamically using JavaScript.


```python
# !pip install selenium
from selenium.webdriver import Chrome, ChromeOptions
from selenium.webdriver.common.by import By
from selenium.webdriver.support.ui import WebDriverWait
from selenium.webdriver.support import expected_conditions as EC


# note: after setting your path to your chromedriver once, you can just init like so (without specifying path)
driver = Chrome() 

driver.get('https://quotes.toscrape.com/js-delayed/')
```

## What Happens If I Try to Use BeautifulSoup?

Just as the first half of the guide showed us, we can use `requests` to get the HTML content of a website, and then pass this content to BeautifulSoup to parse it. Afterwards, we find all the `<div>` elements with the class `quote` and attempt to print them. Try this on your own, you'll find that nothing prints, but why?


```python
s = requests.get('https://quotes.toscrape.com/js-delayed/')

soup = BeautifulSoup(s.text, 'html.parser')

quotes = soup.find_all('div', class_='quote')

for quote in quotes:
    print(quote)

# no output!
```

Why is nothing printing?

When you make a request with `requests.get`, it retrieves the static HTML that the server sends back on the initial request. It does not execute JavaScript. If a website uses JavaScript to load or modify content after the initial page load (as is common with most modern websites), that dynamically loaded content won't be included in the HTML retrieved by requests.get.

Selenium on the other hand, acts as an actual person navigating to a website. This is what allows it to run JavaScript just like a regular user's browser would, accessing the dynamically loaded content. 

In this case, we want Selenium to wait for things to load and ensure that all dynamically generated content is present before we start scraping. We can accomplish this with `WebDriverWait` and expected conditions (`EC`).





```python
driver = Chrome() 

driver.get('https://quotes.toscrape.com/js-delayed/')

# these lines set up a condition to wait for up to 20 seconds for all elements with the class name "quote" to be visible on the page
wait = WebDriverWait(driver, 20)
quotes = wait.until(EC.visibility_of_all_elements_located((By.CLASS_NAME, "quote")))

for quote in quotes:
    print(quote.text)
    print("-----")
```

    “The world as we have created it is a process of our thinking. It cannot be changed without changing our thinking.”
    by Albert Einstein
    Tags: change deep-thoughts thinking world
    -----
    “It is our choices, Harry, that show what we truly are, far more than our abilities.”
    by J.K. Rowling
    Tags: abilities choices
    -----
    “There are only two ways to live your life. One is as though nothing is a miracle. The other is as though everything is a miracle.”
    by Albert Einstein
    Tags: inspirational life live miracle miracles
    -----
    “The person, be it gentleman or lady, who has not pleasure in a good novel, must be intolerably stupid.”
    by Jane Austen
    Tags: aliteracy books classic humor
    -----
    “Imperfection is beauty, madness is genius and it's better to be absolutely ridiculous than absolutely boring.”
    by Marilyn Monroe
    Tags: be-yourself inspirational
    -----
    “Try not to become a man of success. Rather become a man of value.”
    by Albert Einstein
    Tags: adulthood success value
    -----
    “It is better to be hated for what you are than to be loved for what you are not.”
    by André Gide
    Tags: life love
    -----
    “I have not failed. I've just found 10,000 ways that won't work.”
    by Thomas A. Edison
    Tags: edison failure inspirational paraphrased
    -----
    “A woman is like a tea bag; you never know how strong it is until it's in hot water.”
    by Eleanor Roosevelt
    Tags: misattributed-eleanor-roosevelt
    -----
    “A day without sunshine is like, you know, night.”
    by Steve Martin
    Tags: humor obvious simile
    -----


In the previous codeblock, the line:

```
wait = WebDriverWait(driver, 20)
```

Tells the WebDriver to create a `WebDriverWait` instance named wait, which is used to pause the execution of your script for up to 20 seconds while it waits for a certain condition to be met. This is useful when elements on a webpage takes time to become visible or interactable due to various reasons like slow network conditions or heavy JavaScript operations.

In the next line,

```
quotes = wait.until(EC.visibility_of_all_elements_located((By.CLASS_NAME, "quote")))
```
we use the wait object to pause the execution until all elements with the class name "quote" are visible on the page. Specifically, the `until()` method of the WebDriverWait class waits for the Expected Condition `EC.visibility_of_all_elements_located` to be true before continuing.

Now we can see all of the quotes being printed, and can choose to load them into a pandas dataframe if we want to as well.




## Form Filling with Selenium

Now that we've seen how to collect dynamically loaded content with Selenium, let's explore some of its other capabilities. Notice how there's a Login button on the top right of the page. Let's get Selenium to click on that button, fill out a username and password, and log us in.

The first thing we need to do is figure out how to find the Login button. With a quick inspect element, you can see that the Login button is in an anchor (a) tag with the attribute href="/login",

`<a href="/login">Login</a>`

We can find this using a CSS selector, which in the context of web scraping, are used to identify and interact with specific elements on a webpage based on their tag name, id, class, attributes, and even their hierarchy or position within the HTML document.

So when you see a CSS selector like `a[href="/login"]`, it's saying, "Find me an anchor tag with an href attribute equal to '/login'". Right after finding the button, we can called `.click()`, to navigate to the href and bring us to the Login page.

Notice that the Login button does not take time to be loaded, unlike the actual quotes. So we can throw out the `WebDriverWait`.




```python
driver = Chrome()

driver.get('https://quotes.toscrape.com/js-delayed/')

# locate the login button
login_button = driver.find_element(By.CSS_SELECTOR, 'a[href="/login"]')

# click on it
login_button.click()
```

Next, we need to find the username and password fields, and type in them. Inspecting the page again, we can see that these fields are in input elements like so: 

`<input type="text" class="form-control" id="username" name="username">`

and


`<input type="password" class="form-control" id="password" name="password">`

We can easily find these using `.find_element()` and filtering `By.Name` (or `By.ID`).

After finding the elements, we can "send keys" to populate these fields.


```python
driver = Chrome()

driver.get('https://quotes.toscrape.com/js-delayed/')

login_button = driver.find_element(By.CSS_SELECTOR, 'a[href="/login"]')
login_button.click()


# find the username and password fields
username_field = driver.find_element(By.ID, 'username')
password_field = driver.find_element(By.ID, 'password')

# send login info
username_field.send_keys('your_username')
password_field.send_keys('your_password')


```

Finally, we find and click on the submit button.

Here's the final script:


```python
driver = Chrome()

driver.get('https://quotes.toscrape.com/js-delayed/')

login_button = driver.find_element(By.CSS_SELECTOR, 'a[href="/login"]')
login_button.click()


username_field = driver.find_element(By.ID, 'username')
password_field = driver.find_element(By.ID, 'password')

username_field.send_keys('your_username')
password_field.send_keys('your_password')

submit_button = driver.find_element(By.CSS_SELECTOR, 'input[type="submit"]')
submit_button.click()

```

# Conclusion

Web scraping with BeautifulSoup and Selenium are powerful tools for extracting data from websites. They allow you to automate the process of collecting data which can save you significant time and effort. BeautifulSoup gives you a straightforward HTML parser for static webpages, and with Selenium, you can interact with websites just like a human user and extract data from dynamically loaded websites.

This guide is just the tip of the iceberg, showing you the popular tools and common techniques to get started, but there's a lot much more to explore. As you dive deeper, you'll discover even more advanced methods and new challenges that will enhance your abilities and understanding of web scraping. 

For some additional resources on web scraping, check out these articles:
- https://realpython.com/beautiful-soup-web-scraper-python/
- https://www.browserstack.com/guide/web-scraping-using-selenium-python


