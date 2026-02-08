---
title: LinkedIn's Fingerprinting
author: harshityadav95
date: 2026-02-02 00:00:00 +0530
categories: [Backend Engineering]
tags: [Security, Browser Extensions, Fingerprinting, Web Security, LinkedIn]
---

# LinkedIn's Fingerprinting

So, I saw this on Hacker News the other day and I **had** to talk about it. LinkedIn is scanning your browser for nearly 3,000 specific extensions. People are noticing their CPU fans are spinning up, even more than Windows :P ?

## The Architecture: Linkedin Fan Spin Tech

One might think they are using some super advanced zero-day exploit. They aren't. They are using a feature of the web that has been around forever: **Web Accessible Resources**.

When you install a Chrome extension, it lives on your storage drive. To allow websites to interact with it (like when a password manager injects an icon into a login field), the extension exposes certain files via a specific protocol: `chrome-extension:///`

Here is the kicker: In Chrome (and Chromium browsers like Edge or Brave), that **Extension ID** is static. It is derived from the public key of the extension. It never changes. `uBlock Origin` has the same 32-character ID for me, for you, and for everyone else.

## The "Loop"

So, what did LinkedIn do? They shipped a file called `fingerprint.js`. Inside this file is a massive JSON array containing **2,953 extension IDs** and their corresponding file paths (e.g., `images/icon.png`).

The script essentially does this (pseudocode):

```jsx
// Don't actually run this, it blocks the main thread!
const extensions = [{id: "axyz...", file: "icon.png"},...];

extensions.forEach(ext => {
   const img = new Image();
   img.src = `chrome-extension://${ext.id}/${ext.file}`;
   
   img.onload = () => console.log("Ha! You have " + ext.id);
   img.onerror = () => { /* 404 - Not installed */ };
});
```

They try to load an image from your local file system. If the browser says "200 OK," they know you have the extension. If it says "Error," you don't. It's a simple boolean check.

## The "Why": Bots, Scrapers, and Trust

Why all this trouble and users with CPU spikes?

As a backend engineer, we must look at this from the perspective of **Risk Scoring**. 

- LinkedIn has a massive problem with data scraping. Tools like *Dux-Soup*, *LinkedHelper*, or *PhantomBuster* are browser extensions that automate connection requests and scrape profiles.
- LinkedIn wants to ban these people. But detecting them behaviorally (e.g., "is he clicking too fast?") is hard and prone to false positives.
Detecting the **source code** of the tool installed in your browser? That is a **deterministic signal**. If you have the *LinkedHelper* extension ID installed, there is a 99.9% chance you are violating their Terms of Service. It allows them to ban you with confidence.

They are also checking for:

1. **Competitors:** Tools that overlay email addresses (like *Apollo* or *Lusha*) which steal LinkedIn's monetization.
2. **Dev Tools:** React DevTools, Redux. This tells them you are a developer, which might change the ads they serve you (e.g., AWS ads vs. toothpaste ads).

---

## The Cost: Why Your Fan is Spinning

A lot of users complained that leaving LinkedIn open made their computers lag.
Think about it. The script fires off **3,000 asynchronous requests** almost simultaneously.

1. **Event Loop Blocking:** Even though these are local requests, the browser still has to create 3,000 `Image` objects in memory. That puts pressure on the Heap.
2. **Context Switching:** The browser has to context switch between the rendering engine and the file system I/O to check for these files on your disk.
3. **Garbage Collection:** After those 3,000 requests fail (assuming you don't have 3,000 extensions), the V8 engine has to garbage collect all those `Image` objects. That burns CPU cycles.

It is an expensive operation offloaded to *your* client to save *their* servers from scrapers.

---

## Chrome vs. Firefox: The Architecture War

This is where it gets interesting. If you run this same script on **Firefox**, it fails completely. It returns 0 results.

Why? **Architecture.**
Mozilla realized years ago that static IDs are a privacy leak. When you install an extension in Firefox, the browser generates a **random UUID** for that specific instance.

```
moz-extension:///icon.png
```

Because `fingerprint.js` cannot guess your random UUID, it cannot build the URL, and every request 404s. Chrome is trying to fix this in **Manifest V3** with a property called `use_dynamic_url`, but it's optional, and most extensions haven't enabled it yet.

## Summary

So, is this malicious? It depends on your definition.

- **From LinkedIn's view:** It's security. They are protecting their platform from unauthorized automation.
- **From a User's view:** It's invasive. They are enumerating your installed software without asking.

If you want to stop it, use **Firefox**, or install **uBlock Origin**, which actually blocks the `fingerprint.js` script from even loading (the irony is that they scan for uBlock, but uBlock kills the scanner first).

## Reference

- [https://github.com/mdp/linkedin-extension-fingerprinting](https://github.com/mdp/linkedin-extension-fingerprinting)
- [https://news.ycombinator.com/item?id=46904361](https://news.ycombinator.com/item?id=46904361)
- [https://developer.chrome.com/docs/extensions/reference/manifest/web-accessible-resources](https://developer.chrome.com/docs/extensions/reference/manifest/web-accessible-resources)
- [https://developer.mozilla.org/en-US/docs/Mozilla/Add-ons/WebExtensions/manifest.json/web_accessible_resources](https://developer.mozilla.org/en-US/docs/Mozilla/Add-ons/WebExtensions/manifest.json/web_accessible_resources)
