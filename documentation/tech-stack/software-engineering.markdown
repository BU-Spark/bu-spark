---
layout: default
title: Software Engineering Tech Stack
parent: Spark! Tech Stack 
nav_order: 1
---


# Universal Features
- All projects should ideally be configured with the following solutions:
- Each project should have a linter configured and applied at commit and or on push to  github
Automatic build and deploy(CI/CD) on push to production branches

# Front End Development

## React.js + Typescript

React.JS, commonly referred to as React, is an open-source library based on JavaScript and JSX (a PHP extension). It was released in 2013 by Facebook to create flexible, dynamic user interfaces. 

Two of React’s most useful features are:

- use of the Virtual DOM (Document Object Model), which facilitates the creation of fast and responsive UIs while maintaining high app performance;
- component-based architecture, which is easier to maintain than other architectures.

TypeScript has gained immense popularity among frontend developers the past few years due to improved maintainability, code consistency, type checking, and future browser support. This trend can also be seen in the industry as well. React gives developers the freedom to choose between Typescript and Javascript. Typescript can natively be integrated with React. 

Strict typing allows for easy debugging and cleaner code for complex projects. Code also becomes more self descriptive because the types’ definitions also work as documentation. 

As a result, when you come back to the code after a while it’s easier to remember what it does by just reading it.

However Typescript has a slightly higher learning curve - currently not taught by any CS courses right now in BU. Leveraging the Create React App(CRA) Typescript setup is easy to add to existing or new React.js projects. 

### Getting Started

Create React App(CRA) is the easiest way to get started with React.js.

- [Getting Started with Create React App](https://create-react-app.dev/docs/getting-started)

- [CRA with Typescript](https://create-react-app.dev/docs/adding-typescript)


### Resources:

- https://programmingwithmosh.com/javascript/react-typescript/
- https://insights.stackoverflow.com/survey/2020#most-popular-technologies 
- https://insights.stackoverflow.com/survey/2020

# Mobile Applications

There are inherently less options for mobile applications. Either projects are built natively in which case, only a single option exists for each platform. Other projects would work well with a cross-platform development framework and should use one of the options below. Backend choices can be chosen from the backend section below.

## Flutter - Cross-platform Mobile App Dev


Flutter is an open-source portable UI toolkit built by Google, it’s a comprehensive app Software Development Kit (SDK), complete with widgets and tools. Flutter enables cross-platform app development. It gives developers an easy way to build and deploy visually attractive, natively-compiled applications for mobile (iOS, Android), web, and desktop – all using a single codebase. 

Features:  

- It’s based on Dart – a fast, object-oriented programming language. It’s relatively new and easy to learn – especially for experienced developers more familiar with Java and C#. 
- The architecture is based on the very popular reactive programming (it follows the same style as React)
- It provides its own widgets(similar to components in React), drawn from its own high-performance rendering engine – these are fast, attractive and customizable
- Excellent documentation with strong support from the Flutter team
- Very fast development time, good developer experience

### Getting Started

Google provides excelent documentation and can be leveraged as your main source for documentation.

- [Getting Started with Flutter](https://docs.flutter.dev/get-started)

### Flutter Add-ons

This is a non-comprehensive list of extensions and add-ons to the core flutter framework that Spark! recommends.

#### [State Management] (https://docs.flutter.dev/data-and-backend/state-mgmt/simple)

This is an inherently opinionated and project driven choice but we recommend the following:

1. Flutter RiverPod - Most modern and fully featured. Stepper learning curve
2. [Provider] (https://pub.dev/packages/provider) - Less features but easier to learn, superseded by RiverPod

### Resources:
- [Flutter Archetecture] (https://docs.flutter.dev/resources/architectural-overview)
- [Flutter Provider Architecture with Firebase] (https://medium.com/flutter-community/flutter-provider-architecture-with-firebase-full-guide-by-building-a-working-crud-app-4824cec04e59)


# Backend 

The backend of each project can be built using one of the combinations below. Severless provides the fastest time to run but does not enable as much customization as other options.
## Google Firebase 
Firebase provides a pre-configured backend hosted and run by Google. Easy to learn and use. 

## Python Based API

Build a Python based API using:

- Flask, or FastAPI
- JWT or OAuth for all authentication
- Hosted SQL Database
- All running inside containers

## Node.js Based API

Node.js API using the following technologies

- Node.js + Express
- JWT or OAuth for authenticated requests
- Hosted SQL Database
 All running inside containers
