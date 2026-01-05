# Project Context: Attajak's Personal Website

## Project Overview

This project (`attajak.github.io`) is the personal website and blog of Attajak Janrak, hosted on GitHub Pages. It is built using **Jekyll**, a static site generator written in Ruby, and utilizes the **Minimal Mistakes** theme.

The site serves as a portfolio and blog, featuring personal information, contact details, and posts about various topics.

### Key Technologies

*   **Framework:** [Jekyll](https://jekyllrb.com/) (~4.3)
*   **Theme:** [Minimal Mistakes](https://mmistakes.github.io/minimal-mistakes/) (~4.24)
*   **Hosting:** GitHub Pages (deployed via GitHub Actions)
*   **Language:** Ruby (for build), HTML/Markdown (content), SCSS (styling)
*   **Package Management:** `Bundler` (Ruby gems), `npm` (script runners)

## Architecture & Directory Structure

*   **`_config.yml`**: The main configuration file for the Jekyll site (theme settings, plugins, author info).
*   **`_posts/`**: Contains blog posts in Markdown format. Filenames follow the `YYYY-MM-DD-title.md` convention.
*   **`_pages/`**: Contains static pages like Home, About, Contact, etc.
*   **`_data/`**: Stores structured data, such as `navigation.yml` for site menus.
*   **`_includes/`**: Reusable HTML snippets (headers, footers).
*   **`assets/`**: Static assets like images (`assets/images/`) and CSS.
*   **`Gemfile`**: Defines Ruby gem dependencies.
*   **`package.json`**: Defines NPM scripts for easier development command execution.
*   **`.github/workflows/jekyll.yml`**: GitHub Actions workflow for building and deploying the site to GitHub Pages.

## Building and Running

### Prerequisites

*   Ruby (version ~3.4 recommended based on workflow)
*   Bundler
*   Node.js (optional, for running `npm` scripts)

### Key Commands

This project uses `npm` scripts as convenient wrappers around `bundle exec jekyll` commands.

| Action | NPM Command | Underlying Command | Description |
| :--- | :--- | :--- | :--- |
| **Install Dependencies** | `npm run prepare` | `git submodule ... && bundle install` | Installs Ruby gems and updates submodules. |
| **Start Dev Server** | `npm run server` | `bundle exec jekyll server --draft --future ...` | Starts local server with drafts and future posts enabled. |
| **Build Site** | `npm run build` | `bundle exec jekyll build` | Builds the static site into `_site/`. |
| **Update Dependencies**| `npm run update` | `git submodule ... && bundle update` | Updates gems and submodules. |

### Manual Jekyll Commands

If you prefer using `bundle` directly:

```bash
# Install dependencies
bundle install

# Serve locally (available at http://localhost:4000)
bundle exec jekyll serve

# Build for production
JEKYLL_ENV=production bundle exec jekyll build
```

## Development Conventions

*   **Content Creation:**
    *   New posts go into `_posts/`.
    *   Use the standard Jekyll front matter:
        ```yaml
        ---
        title: "Post Title"
        date: YYYY-MM-DD HH:MM +0700
        categories: "category-name"
        tags: "tag1 tag2"
        published: true
        ---
        ```
    *   The `jekyll-compose` gem is included, allowing commands like `bundle exec jekyll post "My New Post"` (if configured).

*   **Language:**
    *   The site locale is set to Thai (`th`) in `_config.yml`.

*   **Theme Customization:**
    *   Theme settings are heavily customized in `_config.yml`.
    *   Look in `_data/navigation.yml` to modify the top navigation bar.
    *   Styles can be overridden in `assets/css/` or `_sass/` (though mostly standard theme styles are used).

*   **Deployment:**
    *   Deployment is automated via GitHub Actions when pushing to the `main` branch.
