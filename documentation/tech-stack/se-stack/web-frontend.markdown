---
layout: default
title: Web Frontend
grand_parent: Spark! Tech Stack
parent: Software Engineering Tech Stack
nav_order: 1
---

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

## Authentication

### Clerk

**Clerk** is a modern authentication and user management solution designed to simplify the process of adding authentication and user management features to web and mobile applications. It provides a suite of tools and features to handle user sign-up, sign-in, password recovery, and multi-factor authentication with minimal configuration.

##### Key Features:
- **Easy Integration:** Seamless integration with popular front-end frameworks and back-end platforms.
- **Pre-built UI Components:** Ready-to-use, customizable components for user authentication flows.
- **Multi-Factor Authentication:** Enhanced security with support for SMS, email, and app-based 2FA.
- **User Management:** Comprehensive tools for managing user accounts, roles, and permissions.
- **Session Management:** Efficient handling of user sessions and tokens for secure access.

##### Benefits:
- **Developer-Friendly:** Quick setup with detailed documentation and SDKs.
- **Scalable:** Handles authentication needs from small projects to large-scale applications.
- **Secure:** Adheres to industry standards for security and data protection.

##### Downsides:
- **Cost:** Some features may require a paid plan, which could be a consideration for small projects or startups.
- **Dependency:** Relying on an external service for authentication can introduce dependency and potential challenges with integration or migration if needs change.
- **Customization Limitations:** While customizable, some aspects of the pre-built UI components might not fully align with all design requirements or use cases.
- **Performance Impact:** Depending on the implementation, adding an external authentication module might introduce latency in authentication flows.

#### Getting Started

To get started with Clerk, check out their [quickstart guide](https://clerk.com/docs/quickstarts/overview) for step-by-step instructions on implementing it in your project.

#### FAQ

1. How do I allow anyone to create an account?
    - This is the default setting in Clerk, so no changes are required.

2. How do I allow only BU accounts?
    - [Allowlist/Blocklist Restrictions](https://clerk.com/docs/authentication/configuration/restrictions) - PAID, but free in the dev environment

3. How do I enable more SSO providers?
    - Click on the relevant provider on [this page](https://clerk.com/docs/authentication/social-connections/overview) and follow the instructions.