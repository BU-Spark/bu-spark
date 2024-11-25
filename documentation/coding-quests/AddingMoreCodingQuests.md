---
layout: default
title: Adding More Coding Quests
parent: Coding Quests
nav_order: 1 # Order under the "Coding Quests" section
published: false
permalink: /docs/coding-quests/adding-more-coding-quests
---

# Adding More Coding Quests

Follow these instructions and the example of `./coding-quests/react.md` for how to create a page for your Coding Quest!

## Step 1: Duplicate `./coding-quests/react.md`

Create a new file in `./coding-quests` and name it the name of your technology with no spaces and all lowercases

## Step 2: Fix the Header Metadata for your new Coding Quest Page

Change the following things to comply with Jekyll standards and properly name your page in the Table of Contents

1. Change "title" to the name of your technology like `title: <technology>` (it can have spaces)
2. Change "nav_order" to be 1 more than the largest nav_order in the directory (determines order of how pages appear in the dropdown of `Coding Quests`)

## Step 3: Swap the Content with yours

You need to change the following from the `react.md` copy:

1. Title at the top (`# <tecnology>`)
2. Summary of the technology underneath the Title
3. The urls / content in all of the levels
   - Level 1
     - Start the Journey (link to your level 1)
     - Take the Quiz (link to your Google Form for level 1)
   - Level 2
     - Delete / Change the workshop collaboration and dates
     - Complete a `<technology>` Side Quest `<short summary of what it is>` (link to side quest Git Repo)
   - Level 3
     -See the Github Repository (link to your level 3 Git Repo)

## Step 4: Create a New Image Folder

Create a new folder in `./coding-quests` and name it `<technology>_pngs`. Inside of this folder add all the images you'd like to have on your Coding Quest Page, namely

1. A photo of the technology (whether the actual logo or the non metalic badge icon)
2. A photo of the bronze, silver, and gold badges able to be earned from completing each level

## Step 5: Swap out the Images

This uses a crazy Jekyll syntax so be very careful to only swap out the IMG PATH. The path should be `<technology>_pngs/<technology>-badge.png` and `<technology>_pngs/<technology>-badges`.

Replace the one at the top and one at the bottom. If you want to add more refer to the examples on how to style in those two images.

# YOU'RE DONE!

Now consult [TemporaryFix.md](./TemporaryFix.md) and [README.md](./README.md) for how to create a Pull Request to add your work to the live site!
