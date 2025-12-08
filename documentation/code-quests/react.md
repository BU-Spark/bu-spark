---
layout: default
title: React.js
parent: Code Quests
nav_order: 2 # Order under the "Coding Quests" section
permalink: /docs/code-quests/react
---
# React Main Quest

React is a web development framework that is wildly popular and promotes a component based architecture. It was created by Facebook to address building and maintaining complex, dynamic user interfaces. React allows developers to build web applications that can update and render efficiently in response to data changes.

### Level One: 
→ Instructions shown below.
### Level Two: 
→ Create your own weather app for the United States! You can accept the assignment [<u>here</u>](https://classroom.github.com/a/1QZf8t1T).
### Level Three: 
→ Creating your own project. The instructions can be found [<u>here</u>](https://github.com/BU-Spark-Learning-Ambassadors/react-level-3).

---

# React Level One
## Overview – what you should learn  

### Vocabulary

- Web Development Framework

- State

- Component

- Hook

- JSX

- Node.js

- Vite

- Next.js

### Specific Commands

- ``npm create vite@latest``

- ``npm install``

- ``npm run dev``

### Concepts

- Web Development

- State + Rendering

- Frontend vs Backend

- Client-Server Architecture

- JSX vs HTML + JS

- Component Libraries

- .env + .gitignore

> **Web Development Framework —** <span class="mark">a collection of
> tools, libraries, and conventions designed to simplify the process of
> building web applications. It handles all of the low level things
> (HTTP requests, routing, user authentication) so that developers can
> focus on making apps</span>
>
> <span class="mark">**State —** the current condition or data of an
> application at a specific point in time. Contains variables, user
> inputs, and the status of various components in the application</span>
>
> <span class="mark">**Component —** self-contained, reusable piece of
> code that encapsulates both the structure (HTML or template), behavior
> (JavaScript or logic), and often the styling (CSS) needed to render a
> part of a web application's user interface (UI)</span>
>
> <span class="mark">**Hook —** a special function that allows you to
> "hook into" React features, such as state management and lifecycle
> methods, directly within functional components. Hooks make it easier
> to write and manage logic within these components</span>
>
> <span class="mark">**JSX —** stands for JavaScript XML. It is a syntax
> extension for JavaScript that looks similar to HTML or XML. JSX is
> primarily used in React and is essentially a way to create components
> with JS and HTML.</span>
>
> <span class="mark">**[<u>Node.js</u>](http://node.js) —** an
> open-source, cross-platform runtime environment that allows developers
> to execute JavaScript code on the server side. This enables full-stack
> development using a single programming language (JS) across both the
> client and server sides.</span>
>
> <span class="mark">**[<u>Vite</u>](http://vite) —** modern build tool
> and development server for web projects, designed to be faster and
> more efficient than traditional tools. We are using this as our build
> tool since ``npm create-react-app`` is deprecated</span>
>
> <span class="mark">**[<u>Next.js</u>](http://next.js) —** another web
> development framework built on top of React. It is designed to make it
> easier to build performant and scalable web applications by providing
> a set of powerful features and tools out of the box. Its most notable
> difference is that is has server-side-routing</span>

### What is React.js?

**React** is a web development framework that is wildly popular and
promotes a component based architecture. It was created by Facebook to
address building and maintaining complex, dynamic user interfaces. React
allows developers to build web applications that can update and render
efficiently in response to data changes.

### Why do I need to know anything about React.js?

HTML, CSS, and vanilla JavaScript are good places to start, but building
pages or even applications with them becomes tiresome very quickly.
Developers end up rewriting or copy and pasting code which leads to
errors and unnecessary large codebases. And just imagine trying to make
a small change to a block of code you copied all over your website; it's
a headache. Instead with React.js you can change it in one file and it
will apply to all of its components. (Vanilla JS has a way to repeat the
code but it isn’t widely used and isn’t as optimized for making complex
UI’s)

React.js is an industry standard and has grown a massive community that
continues to develop / maintain open source libraries which developers
can leverage to use other people’s code. Examples of this include a UI
Component Library called [<u>MUI</u>](https://mui.com/) and a modern
build tool called [<u>Vite</u>](http://vite).

### Okay, what are the essentials?

#### <u>Prerequisites</u>: You will need to first [<u>install Node.js</u>](http://node.js) which is defined above. This will allow us to work in JS for both frontend and backend development You will also need an IDE, a popular one we recommend is [<u>VSCode</u>](https://code.visualstudio.com/download).

Within VSCode, install this extension which will let you use syntax
shortcuts. You can do so by going into “Extensions” within VSCode,
typing in “ES7+ React/Redux/React-Native snippets” and pressing
“install”.

![vscode extension](media/image3.png){:style="width:800px; display: block; margin-left: auto; margin-right: auto;"}


You will first need to understand what goes into a “boilerplate”
React.js application.

<table>
<colgroup>
<col style="width: 100%" />
</colgroup>
<thead>
<tr>
<th><h4 id="the-parts-of-a-boilerplate-vite-app">THE PARTS OF A
BOILERPLATE VITE APP</h4></th>
</tr>
<tr>
<th><p>/public – the directory where all image files will live</p>
<p>/src – the directory where all source code lives. All of your
frontend code will go in here</p>
<p>index.html – the core file that controls what the user sees in the
tab preview at the top of the browser like site logo + name</p>
<p>package.json – where metadata, scripts, and project dependencies are
documented.</p>
<ul>
<li><p>When we run npm run dev we are running the dev script</p></li>
<li><p>When we run npm install &lt;package-name-here&gt; we are adding
another dependency</p></li>
</ul></th>
</tr>
</thead>
<tbody>
</tbody>
</table>

*\* It is important to know that Vite is a layer on top of React.js that
we will be using to help build our app, so the anatomy of an app made
with a different build tool will vary slightly*

Let’s build our own now so you can see what’s inside! Follow these
steps:

<table>
<colgroup>
<col style="width: 100%" />
</colgroup>
<thead>
<tr>
<th><h4 id="generating-the-boilerplate">GENERATING THE
BOILERPLATE</h4></th>
</tr>
<tr>
<th><ol type="1">
<li><p>Open your IDE of choice (VSCode, IntelliJ, etc.)</p></li>
<li><p>Open a terminal and type:<br />
npm create vite@latest my-first-react-app -- --template react</p></li>
<li><p>Then run the commands it tells you in the terminal and copy the
localhost url into your browser to get this</p></li>
</ol></th>
</tr>
</thead>
<tbody>
</tbody>
</table>

![app boilerplate](media/image2.png){:style="width:800px; display: block; margin-left: auto; margin-right: auto;"}


I encourage you to poke around the various files and see what you find.
See if you can change the text on the screen or if you can change the
images to be something from Google!

TIP: To stop the terminal from running you can stop any process by doing
Ctrl + C

<table>
<colgroup>
<col style="width: 100%" />
</colgroup>
<thead>
<tr>
<th><h4 id="examining-the-code">EXAMINING THE CODE</h4></th>
</tr>
<tr>
<th style="text-align: left;"><p>/src/App.jsx – This is an example of a
simple component. Notice the name of a component file is capitalized. A
component is essentially a function that returns code, thus you can
reuse it by calling the function.</p>
<p>See how useState() is used on lines 7 and 21. This is a simple
counter that manages the value of “count” via a setter called
“setCount”. Think of this pair of variables as the following
structure:</p>
<p>const [getter, setter] = useState(initial_value)</p>
<p><u>Experiment #1:</u></p>
<ol type="1">
<li><p>Replace line 7 with simply var count = 0</p></li>
<li><p>And line 21 with onClick={() =&gt; count += 1}</p></li>
<li><p>Click on the button in your browser and see if “count”
increments</p></li>
</ol>
<blockquote>
<p><u>Explanation</u>: useState() forces a re-render of affected
components whenever a state variable is changed. Non state variables
don’t thus you will never see the difference</p>
</blockquote>
<p>index.html – Think of this as the root, you won’t do much here but
this assigns important meta data that we can mess with</p>
<p><u>Experiment #2:</u></p>
<ol type="1">
<li><p>Look at the tab header for your localhost, it should be the Vite
logo and “Vite + React”</p></li>
<li><p>Find the &lt;title&gt; tag on line 8, change the text between the
tags to your name</p></li>
<li><p>Find the &lt;link&gt; tag and change the text inside the quotes
of ‘href’. <a
href="https://www.google.com/search?sca_esv=20a76472aa525adb&amp;q=bu+spark+logo&amp;udm=2&amp;fbs=AEQNm0Aa4sjWe7Rqy32pFwRj0UkWd8nbOJfsBGGB5IQQO6L3J5MIFhvnvU242yFxzEEp3BcbXWGQjBp6XyyqfUu6Wz8hXsM0yT-UlYRgT5OS0dDqQmKSmdrFO_r2gR4_bMaNpFYwOEPG3VGROI4O1AFWaADqNeXEyGIp6QyPXEvENOfNURrv3IiuEQ_eMVKsmc2cJdKaPkPjDDABz8YR4APbR30p5vNWOw&amp;sa=X&amp;ved=2ahUKEwj48aOFrfaHAxWrGtAFHVPpMeQQtKgLegQIDxAB&amp;biw=1280&amp;bih=621&amp;dpr=2#vhid=nnquR3BL7w6ueM&amp;vssid=mosaic"><u>Go
to this link</u></a> and click <em>“Copy Image Address”</em> and paste
it into the string.</p></li>
<li><p>Check out the tab header and see what has changed</p></li>
</ol>
<blockquote>
<p><u>Explanation:</u> You have set the metadata for your app so now it
displays a personalized preview!</p>
</blockquote></th>
</tr>
</thead>
<tbody>
</tbody>
</table>

## Additions to the App

We will now create our first component that makes use of one of the
other most popular hooks: useEffect()

**useEffect( ) –** essentially acts as a listener that contains a block
of code that it executes only when a variable (in its dependency array)
changes

### Implementing a Favorite Number Alert

Everybody has their own favorite number, so <u>we are going to make a
component that tells the user when count reaches my favorite number:
4</u>

<table>
<colgroup>
<col style="width: 100%" />
</colgroup>
<thead>
<tr>
<th><h4 id="favorite-number-component">FAVORITE NUMBER
COMPONENT</h4></th>
</tr>
<tr>
<th style="text-align: left;"><p>Within /src create a new file called
FavoriteNumberAlert.jsx. It is important that the file name ends in that
extension so we can use the special syntax.</p>
<ol type="1">
<li><p>Type rfce in the empty file and wait a couple seconds for the
shortcut preview to come up, press tab to auto complete and you should
get something like this<br /></p></li>
![code snippet](media/image4.png){:style="width:800px; display: block; margin-left: auto; margin-right: auto;"}

<li><p>Then import useEffect from ‘react’</p></li>
<li><p>Next add a parameter into the method signature called
‘currNum’</p>
<ol type="a">
<li><p>You will need to ‘destructure' the parameter by putting it in {
}. Otherwise we would need to do props.currNum to access it</p></li>
</ol></li>
<li><p>Define a constant call favNum and assign it your favorite number
(not too high though)</p></li>
<li><p>Now copy and paste our useEffect hook above the return
statement:</p></li>
</ol>
<p>useEffect( () =&gt;{</p>
<p>if(currNum == favNum){</p>
<p>window.alert(`${currNum} is my favorite number!!!`)</p>
<p>}</p>
<p>}, [currNum])</p>
<ol start="6" type="1">
<li><p>Next we need to call this component inside of /src/App.jsx. Go to
that file and import it</p></li>
<li><p>Finally add this bit of code under the button and test the live
app!</p></li>
</ol>
<p>&lt;FavoriteNumberAlert currNum={count}/&gt;</p>
<ol start="8" type="1">
<li><p>You should get the following. Once you click okay, count will
change to the correct number</p></li>
</ol>
![updated demo](media/image1.png){:style="width:300px; display: block; margin-left: auto; margin-right: auto;"}

<p><u>Explanation:</u> Our useEffect() listener triggers an alert once
the currNum that we passed into our function equals favNum. This is
called <strong>“passing down state”</strong> which we will use again
later to connect layered components and reduce the number of
rerenders.</p>
<p><strong>Passing Down State:</strong> the practice of transferring
data from a parent component to its child components through props,
allowing child components to access and use that data without having to
manage it themselves</p></th>
</tr>
</thead>
<tbody>
</tbody>
</table>

## Wrap up

Congrats! You now know the basics of React.js, a modern web development
framework. You should be able to answer the following questions and
accomplish the following tasks:

###  Questions

1.  What is React.js? What is it used for?

2.  What makes React.js better than HTML, CSS, and Vanilla JS? Given
    what you’ve seen about the boilerplate, what might be a scenario
    when you would stick with HTML, CSS, and Vanilla JS?

3.  What is the role of Vite and Node.js in our React app?

4.  What is useState() used for? What about useEffect() ?

### Tasks

1.  Make the tab preview have your name and an image from Google

2.  Make a new Component called “BooleanButton.jsx”

    1.  Make a new button that alternates between true and false when
        you click on it

    2.  import it into /src/App.jsx and put it below the other button

3.  Make a new Component called “PerfectScenario.jsx” which makes an
    alert when the following two things are true:

    1.  currNum == favNum

    2.  The boolean value == true

    3.  Hint: for this you should create a global favNum and
        \[isClicked, setIsClicked\] and you will need to pass favNum
        into FavoriteNumberAlert.jsx and PerfectScenario.jsx and
        setIsClicked into PerfectScenario.jsx

---

### HOW TO CONTINUE THIS MAIN QUEST?

Take the quiz [<u>here</u>](https://docs.google.com/forms/d/e/1FAIpQLSfH1R2lsM85JQHq454_-SPmR3AWSCoQsoHEojo2M2k7bIJRoQ/viewform?usp=sf_link) to finalize level one, then apply your knowledge by doing a React Side Quest

After completing that, you can move on to level three where you'll create your own project with some guidelines.

---

For any information or quality issues, please contact:

Kaylin - [<u>kaylinvb@bu.edu</u>](mailto:kaylinvb@bu.edu)

Seun - [<u>oademilo@bu.edu</u>](mailto:oademilo@bu.edu)

---

Author of this Code Quest:

Owen Mariani - [<u>omariani@bu.edu</u>](mailto:omariani@bu.edu)
