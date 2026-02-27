# 🚀 Harshit Yadav's Tech Blog

[![Website](https://img.shields.io/website?url=https%3A%2F%2Fharshityadav.in)](https://harshityadav.in)
[![Jekyll](https://img.shields.io/badge/Jekyll-7.3.1-CC0000?logo=jekyll&logoColor=white)](https://jekyllrb.com/)
[![Chirpy Theme](https://img.shields.io/badge/Theme-Chirpy-blue)](https://github.com/cotes2020/jekyll-theme-chirpy)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)

> Personal tech blog covering machine learning, data science, backend engineering, system design, events, and more

**Live Site:** [harshityadav.in](https://harshityadav.in)

---

## 📖 About

This is the source code for my personal tech blog, where I share insights, projects, and learnings about:

- 🤖 **AI & Machine Learning** - Project walkthroughs, ML concepts, and practical applications
- 🔧 **Backend Engineering** - System design, databases, protocols (TLS/SSL, Layer 4/7)
- 📅 **Tech Events** - Coverage of conferences, hackathons, and meetups
- 💡 **Projects & Progress** - Personal projects including hackathon wins and experiments
- 📚 **Certifications & Learning** - Professional development journey
- 🎯 **Design Patterns** - Software engineering best practices
- 🌐 **Timeline** - Personal milestones and tech industry observations

**Tagline:** *"End of Line"* - Inspired by Tron Legacy

---

## ✨ Features

- 📱 **Responsive Design** - Mobile-first approach with PWA support
- 🌓 **Dark/Light Mode** - Toggle between themes
- 💬 **Comments System** - Powered by Giscus
- 📊 **Table of Contents** - Auto-generated for easy navigation
- 🔍 **Search Functionality** - Find content quickly
- 🏷️ **Categories & Tags** - Organized content structure
- 📈 **SEO Optimized** - Enhanced discoverability
- ⚡ **Fast Loading** - Optimized static site generation

---

## 🛠️ Technology Stack

- **Static Site Generator:** [Jekyll](https://jekyllrb.com/) (Ruby-based)
- **Theme:** [Chirpy](https://github.com/cotes2020/jekyll-theme-chirpy) v7.3.1
- **Hosting:** GitHub Pages
- **Comments:** [Giscus](https://giscus.app/) (GitHub Discussions)
- **Containerization:** Docker
- **Version Control:** Git & GitHub

---

## 🚀 Getting Started

### Prerequisites

- Ruby (>= 2.7)
- RubyGems
- GCC and Make
- Bundler

### Installation

1. **Clone the repository**
   ```bash
   git clone https://github.com/harshityadav95/harshityadav95.github.io.git
   cd harshityadav95.github.io
   ```

2. **Install dependencies**
   ```bash
   bundle install
   ```

3. **Serve locally**
   ```bash
   bundle exec jekyll serve
   ```

4. **Access the site**
   
   Open your browser and visit: `http://localhost:4000`

### Docker Setup (Alternative)

Run the site using Docker for a containerized environment:

```bash
docker build -t harshityadav-blog .
docker run -p 4000:4000 -v $(pwd):/srv/jekyll harshityadav-blog
```

---

## 📂 Project Structure

```
.
├── _config.yml          # Site configuration
├── _posts/              # Blog posts organized by category
│   ├── ai_ml/          # AI & Machine Learning posts
│   ├── backend_enginnering/  # Backend engineering posts
│   ├── certification/   # Certification-related posts
│   ├── design-patterns/ # Design pattern posts
│   ├── event/          # Event coverage
│   ├── sde_developer/  # Software development posts
│   ├── skynet_system/  # System & setup guides
│   └── timeline/       # Personal timeline entries
├── _tabs/              # Static pages (About, Archives, etc.)
├── _data/              # Data files
├── assets/             # Images, CSS, JS
├── _plugins/           # Custom Jekyll plugins
├── Gemfile             # Ruby dependencies
├── Dockerfile          # Docker configuration
└── index.html          # Homepage
```

---

## 📝 Writing a New Post

1. Create a new Markdown file in the appropriate `_posts/<category>/` directory
2. Follow the naming convention: `YYYY-MM-DD-title.md`
3. Add front matter at the top:

```yaml
---
title: Your Post Title
author: harshityadav95
date: YYYY-MM-DD HH:MM:SS +0530
categories: [Category]
tags: [tag1, tag2, tag3]
---
```

4. Write your content in Markdown
5. Test locally before committing

---

## 🔧 Configuration

Main configuration is in `_config.yml`. Key settings:

- **Site Information:** Title, tagline, description
- **Social Links:** GitHub, Twitter, LinkedIn
- **Theme Settings:** Mode (light/dark), avatar
- **Comments:** Giscus configuration
- **Analytics:** Integration options (Google, GoatCounter, etc.)

---

## 🌐 Deployment

The site is automatically deployed to GitHub Pages when changes are pushed to the main branch.

**Custom Domain:** Configured via `CNAME` file pointing to `harshityadav.in`

---

## 🤝 Contributing

This is a personal blog, but if you notice any issues or have suggestions:

1. Open an issue describing the problem or enhancement
2. Feel free to submit a pull request for typos or bugs

---

## 📄 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

Copyright (c) 2024 Harshit Yadav

---

## 👤 Author

**Harshit Yadav**

- 🌐 Website: [harshityadav.in](https://harshityadav.in)
- 💼 LinkedIn: [@harshityadav95](https://www.linkedin.com/in/harshityadav95)
- 🐦 Twitter: [@harshityadav95](https://twitter.com/harshityadav95)
- 💻 GitHub: [@harshityadav95](https://github.com/harshityadav95)
- 📧 Email: harshityadav@outlook.com

---

## 🙏 Acknowledgments

- [Jekyll](https://jekyllrb.com/) - The static site generator
- [Chirpy Theme](https://github.com/cotes2020/jekyll-theme-chirpy) - Beautiful and feature-rich Jekyll theme
- [GitHub Pages](https://pages.github.com/) - Free hosting for the site
- [Giscus](https://giscus.app/) - Comment system powered by GitHub Discussions

---

## 📚 Resources

- [Jekyll Documentation](https://jekyllrb.com/docs/)
- [Chirpy Theme Getting Started](https://chirpy.cotes.page/posts/getting-started/)
- [Markdown Guide](https://www.markdownguide.org/)

---

<p align="center">
  Made with ❤️ by Harshit Yadav | <i>"End of Line"</i>
</p>
