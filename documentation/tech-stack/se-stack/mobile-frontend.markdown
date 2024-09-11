---
layout: default
title: Mobile Frontend
permalink: /docs/tech-stack/se/mobile-frontend
grand_parent: Spark! Tech Stack
parent: Software Engineering Tech Stack
nav_order: 2
---

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

#### [State Management](https://docs.flutter.dev/data-and-backend/state-mgmt/simple)

This is an inherently opinionated and project driven choice but we recommend the following:

1. Flutter RiverPod - Most modern and fully featured. Stepper learning curve
2. [Provider](https://pub.dev/packages/provider) - Less features but easier to learn, superseded by RiverPod

### Resources:
- [Flutter Archetecture](https://docs.flutter.dev/resources/architectural-overview)
- [Flutter Provider Architecture with Firebase](https://medium.com/flutter-community/flutter-provider-architecture-with-firebase-full-guide-by-building-a-working-crud-app-4824cec04e59)