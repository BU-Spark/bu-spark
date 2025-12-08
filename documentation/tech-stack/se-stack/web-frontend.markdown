---
layout: default
title: Web Frontend
grand_parent: Spark! Tech Stack
parent: Software Engineering Tech Stack
nav_order: 1
---

# Front End Development

## Next.js 

We use Next.js, an industry-standard React framework, for front-end development. It provides built-in support for *server-side rendering (SSR)*, *static site generation (SSG)*, and *client-side rendering (CSR)*, optimizing performance, SEO, and scalability while maintaining React’s component-based architecture.  

### Built on React  

Next.js extends React while preserving its core functionality, including:  

- **JSX & Component-Based Architecture**: Uses the same declarative UI approach as React.  
- **React Hooks & State Management**: Fully compatible with React’s hooks (`useState`, `useEffect`, etc.).  
- **Context & Redux Support**: Works seamlessly with global state management solutions.  
- **Client-Side Rendering**: Supports standard React behavior for interactive applications.  

### Key Next.js Features  

- **Hybrid Rendering**: Supports SSR, SSG, and incremental static regeneration (ISR).  
- **API Routes**: Enables backend logic without a separate server.  
- **Automatic Code Splitting**: Loads only required JavaScript for each page.  
- **Optimized Image Handling**: [`next/image`](https://nextjs.org/docs/pages/api-reference/components/image) provides built-in performance optimizations.  
- **File-Based Routing & Middleware**: Simplifies navigation and request handling.  

### TypeScript Support 

Next.js integrates seamlessly with TypeScript, offering *static type checking*, *strong typing for props and state*, and *automatic configuration*, improving maintainability and reducing runtime errors.  

### Usage in Our Stack  

We use Next.js for its scalability, performance optimizations, and seamless integration with modern front-end workflows. It is widely adopted across the industry for building production-grade web applications.  

### Learning Resources

Here are some resources to help you learn Next.js, including official documentation, tutorials, and video courses. To ensure you get the most out of these tutorials, it is recommended that you have a basic understanding of HTML, CSS, and React. If you need to brush up on your React skills, check out Vercel's [React Foundations Course](https://nextjs.org/learn/react-foundations) or [react.dev/learn](https://react.dev/learn), which will introduce you to the fundamentals. 

#### Interactive Tutorials
- **[Learn Next.js](https://nextjs.org/learn/dashboard-app?)** – An interactive course that walks you through building a full-stack web application, covering styling, routing, and data fetching.

#### Written Tutorials
- **[Next.js Tutorial - GeeksforGeeks](https://www.geeksforgeeks.org/nextjs/?)** – Covers basic to advanced concepts such as routing, data fetching, environment variables, and static file serving.
- **[Next.js Tutorial - TutorialsPoint](https://www.tutorialspoint.com/nextjs/index.htm?)** – Covers Next.js fundamentals, including installation, project setup, routing, route handlers, and authentication.

#### Video Tutorials
- **[Next.js Tutorial for Beginners (User CRUD App)](https://www.youtube.com/watch?v=iJejohAs9EY&)** – Walks through building a CRUD application with image uploads.
- **[Next.js 15 Crash Course](https://www.youtube.com/watch?v=Zq5fmkH0T78)** – A comprehensive crash course that guides you through building and deploying a production-ready application using Next.js 15.
- **[Next.js Full Course for Beginners](https://www.youtube.com/watch?v=843nec-IvW0&)** – A 7-hour deep dive into Next.js 13, suitable for beginners.

<hr/>

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