---
layout: post
title: "Homebrew Explained : Shipping my first MacOs App Drezze"
date: 2026-08-02 00:00:00 +0530
categories: [Skynet System, Dev Kit]
tags: [Homebrew, macOS, Package Management, Cask, GitHub Releases, SHA-256, DevOps, Drezze]
description: "How Homebrew works under the hood and how to distribute a macOS app through a custom tap and Homebrew Cask."
author: harshityadav95
image:
  path: /assets/img/posts/homebrew-drezze/image.png
  alt: Homebrew package distribution for the Drezze macOS app
published: true
---

Link : [https://harshityadav.in/drezze-Disk-Cleaner-App/](https://harshityadav.in/drezze-Disk-Cleaner-App/)

Today, we are diving into **Homebrew**—how it works under the hood, why it has become the default package manager for macOS (and increasingly popular on Linux), and most importantly, how you can use it to distribute your own software.

If you have built a command-line tool or a macOS app packaged inside a `.dmg` file, hosting it on Homebrew lets your users install and update it with a single command.

## What is Homebrew and How Does It Work Under the Hood?

When you work on Linux environments like Ubuntu or Fedora, package management is solved at the OS level using `apt`, `dnf`, or `pacman`. But historically, macOS lacked a built-in, developer-focused command-line package manager.

**Homebrew** was built to fill that gap (often called *"The Missing Package Manager for macOS"*). It is fundamentally a package manager written in **Ruby** and **Bash** that automates downloading, compiling, or extracting binary packages directly into your user environment.

### What can you install with Homebrew?

1. **CLI Tools and Binaries (Formulae):** Command-line applications, runtimes, and databases like `node`, `postgresql`, `git`, `ffmpeg`, or `ripgrep`.
2. **System Libraries:** Headers and shared libraries like `openssl` or `libpng` needed during compilation.
3. **Desktop Graphical Applications (Casks):** macOS GUI applications packaged in `.dmg`, `.pkg`, or `.zip` files—such as Visual Studio Code, Slack, Google Chrome, or your own custom desktop app.

## Formula vs. Cask: The Architecture

Before publishing anything, you need to understand Homebrew’s two primary artifacts:

![02-formula-cask-tap-architecture.svg](/assets/img/posts/homebrew-drezze/02-formula-cask-tap-architecture.svg)

- **Formula (`Formula/foo.rb`):** Used for command-line interfaces (CLIs) or libraries. Homebrew downloads the source code or a pre-compiled binary tarball, builds it if necessary, and links the binary into your system `PATH`.
- **Cask (`Casks/foo.rb`):** Used for macOS desktop GUI applications. Instead of compiling source code, a Cask tells Homebrew: *"Download this `.dmg` file, mount it, copy `App.app` into `/Applications`, and register it with the OS."*

## Official Homebrew Taps vs. Custom GitHub Taps

When you run `brew install node`, Homebrew searches its official central repositories: `homebrew/core` (for formulae) and `homebrew/cask` (for GUI applications).

### Why not publish directly to official Homebrew core?

Getting your app accepted into `homebrew/cask` or `homebrew/core` requires:

- Meeting high popularity thresholds (e.g., GitHub stars, user base).
- Passing strict code reviews and maintainer approval pipelines.
- Following strict open-source licensing guidelines.

### What is a Custom "Tap"?

A **Tap** is simply a external Git repository hosted on GitHub (or GitLab) that contains your custom Formulae or Casks.

When a user runs:

```bash
brew tap harshityadav95/tap
```

Homebrew clones [https://github.com/harshityadav95/homebrew-tap](https://github.com/harshityadav95/homebrew-tap) behind the scenes into `/opt/homebrew/Library/Taps/harshityadav95/homebrew-tap`. From that point on, Homebrew can discover and install any software defined in that repository!

## Step-by-Step: Publishing a macOS `.dmg` App via Homebrew Cask

![05-cask-installation-flow.svg](/assets/img/posts/homebrew-drezze/05-cask-installation-flow.svg)

Suppose you built an Electron, Tauri, or Swift desktop app called **"Drezze"**, packaged it into `Drezze-Disk-Cleaner.dmg`, and want users to install it on macOS via Homebrew.

### 1. Requirements

Before starting, ensure you have:

- A compiled `.dmg` file containing your `.app` bundle.
- A public hosting location for the file (GitHub Releases is the standard choice).
- A GitHub account.

### 2. Host Your DMG File on GitHub Releases

1. Create a public GitHub repository for your app source code or releases (e.g., [github.com/harshityadav95/drezze-Disk-Cleaner-App](https://github.com/harshityadav95/drezze-Disk-Cleaner-App)).
2. Draft a new **Release** tagged `v1.0.0`.
3. Upload your compiled `Drezze-Disk-Cleaner.dmg` file as a release asset.
4. Copy the direct download link for the asset:

    [https://github.com/harshityadav95/drezze-Disk-Cleaner-App/releases/latest/download/Drezze-Disk-Cleaner.dmg](https://github.com/harshityadav95/drezze-Disk-Cleaner-App/releases/latest/download/Drezze-Disk-Cleaner.dmg)


![01-drezze-release-trust-chain.svg](/assets/img/posts/homebrew-drezze/01-drezze-release-trust-chain.svg)

### 3. Generate the SHA-256 Checksum

Homebrew verifies the integrity of every downloaded file using a SHA-256 hash. Download your DMG or compute its hash locally:

```bash
shasum -a 256 Drezze-Disk-Cleaner.dmg
```

Output:

```text
e3b0c44298fc1c149afb4c8996fb92427ae41e4649b934ca495991b7852b855  Drezze-Disk-Cleaner.dmg
```

### 4. Create Your Custom Homebrew Tap Repository

1. Create a **new public GitHub repository**.
2. **Naming Convention (Important):** The repository name **must** start with `homebrew-` so users can use shorthand commands.
    - Name: `homebrew-tap`.
3. Clone the repo to your local machine and set up the directory structure:

```bash
git clone https://github.com/harshityadav95/homebrew-tap.git
cd homebrew-tap

# Create the Casks directory (Capital 'C', plural)
mkdir Casks
```

> **Note on Naming:** For Casks, Homebrew strictly looks inside the `Casks/` directory (plural with capital C). For CLI Formulae, it uses `Formula/` (singular with capital F).
>

### 5. Write the Cask Specification File

Inside the `Casks/` directory, create a Ruby file matching your app token name in lowercase hyphenated format (e.g., `Casks/drezze-disk-cleaner.rb`):

```ruby
cask "drezze-disk-cleaner" do
  version "1.0.0"
  sha256 "e3b0c44298fc1c149afb4c8996fb92427ae41e4649b934ca495991b7852b855"

  url "https://github.com/harshityadav95/drezze-Disk-Cleaner-App/releases/download/v#{version}/Drezze-Disk-Cleaner.dmg"
  name "Drezze Disk Cleaner"
  desc "Private, local-first disk cleaner"
  homepage "https://harshityadav.in/drezze-Disk-Cleaner-App/"

  # The exact name of the .app inside your .dmg
  app "Drezze Disk Cleaner.app"

  # Optional: Files to clean up on 'brew uninstall --zap Drezze'
  zap trash: [
    "~/Library/Application Support/Drezze",
    "~/Library/Preferences/com.harshityadav95.Drezze.plist",
  ]
end
```

#### Breakdown of the Stanzas:

- `cask "drezze-disk-cleaner"`: Defines the token used in `brew install --cask drezze-disk-cleaner`.
- `version`: Version string, interpolated dynamically into the `url`.
- `sha256`: Checksum for security and integrity verification.
- `app "Drezze Disk Cleaner.app"`: Directs Homebrew to extract `Drezze Disk Cleaner.app` from the DMG and place it in the system `/Applications` directory.

### 6. Commit and Push to GitHub

Push the file to your repository:

```bash
git add Casks/drezze-disk-cleaner.rb
git commit -m "Add Drezze cask v1.0.0"
git push origin main
```

## How Users Install Your App

Now, any macOS user on Apple Silicon or Intel can install your application with standard Homebrew commands:

### Method A: Two-Step Installation

```bash
# 1. Tap your repository (Homebrew automatically maps 'harshityadav95/tap' to 'github.com/harshityadav95/homebrew-tap')
brew tap harshityadav95/tap

# 2. Install the cask
brew install --cask drezze-disk-cleaner
```

### Method B: One-Liner

```bash
brew install --cask harshityadav95/tap/drezze-disk-cleaner
```

Homebrew handles downloading the `.dmg`, verifying the hash, mounting the volume, moving the app into `/Applications`, and unmounting the disk image automatically.

## How to Push Updates (The Lifecycle)

When you release version `1.0.1` of your desktop app, follow this deployment pipeline:

1. **Upload the new DMG asset** (`Drezze-Disk-Cleaner.dmg`) to your application's GitHub Releases page.
2. **Calculate the new SHA-256 hash**:

    ```bash
    shasum -a 256 Drezze-Disk-Cleaner.dmg
    ```

3. **Update `Casks/drezze-disk-cleaner.rb`** in your `homebrew-tap` repository:

    ```ruby
    version "1.0.1"
    sha256 "NEW_SHA256_HASH_HERE"
    ```

4. **Commit and push**:

    ```bash
    git commit -am "Bump Drezze to 1.0.1"
    git push origin main
    ```


When users run `brew upgrade`, Homebrew fetches your updated cask file, compares versions, downloads the new DMG, and replaces the old application seamlessly.

---

## Drezze’s GitHub Actions Release Pipeline

![11-github-actions-release-ordering.svg](/assets/img/posts/homebrew-drezze/11-github-actions-release-ordering.svg)

## References

- [Homebrew: Adding Software](https://docs.brew.sh/Adding-Software-to-Homebrew)
- [Homebrew: Formula Cookbook](https://docs.brew.sh/Formula-Cookbook)
- [Homebrew: Cask Cookbook](https://docs.brew.sh/Cask-Cookbook)
- [Homebrew: Create and Maintain a Tap](https://docs.brew.sh/How-to-Create-and-Maintain-a-Tap)
- [Homebrew: Tap Trust](https://docs.brew.sh/Tap-Trust)
- [Homebrew: Acceptable Formulae](https://docs.brew.sh/Acceptable-Formulae)
- [Homebrew: Acceptable Casks](https://docs.brew.sh/Acceptable-Casks)
- [Homebrew: Bottles](https://docs.brew.sh/Bottles)
- [Apple: Developer ID](https://developer.apple.com/developer-id/)
- [Apple: Notary API](https://developer.apple.com/documentation/NotaryAPI)
- [Drezze Homebrew Tap](https://github.com/harshityadav95/homebrew-tap)
- [Drezze Public Releases](https://github.com/harshityadav95/drezze-Disk-Cleaner-App/releases)
