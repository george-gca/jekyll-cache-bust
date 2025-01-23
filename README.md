# jekyll-cache-bust

[![Gem Version](https://badge.fury.io/rb/jekyll-cache-bust.svg)](http://badge.fury.io/rb/jekyll-cache-bust)

Have you ever updated a CSS file or an image, but the browser kept showing the old version? This plugin enables to easily cache-bust your site's assets. Cache-bust is a technique to force the browser to fetch a new version of a file whenever it changes, ignoring the cached content. It does so by appending a hash of the file's content to the file's name. This way, whenever the file's content changes, the hash changes and the browser will fetch the new file. The hash is calculated using the MD5 algorithm. Based on the implementation made by [Bryan Schuetz](https://distresssignal.org/busting-css-cache-with-jekyll-md5-hash/).

## Installation

1. Add `gem 'jekyll-cache-bust'` to your site's Gemfile
2. Add the following to your site's `_config.yml`:

```yml
plugins:
  - jekyll-cache-bust
```

## Usage

There are currently two ways to cache-bust your assets:

### 1. Cache-busting individual files

To cache-bust a single file, simply use the `bust_file_cache` filter in your templates:

```liquid
<link rel="stylesheet" href="{{ '/assets/css/bootstrap.min.css' | bust_file_cache }}">
```

This will output something like:

```html
<link rel="stylesheet" href="/assets/css/bootstrap.min.css?a4b3f509e79c54a512b890d73235ef04">
```

Note that this can be used to cache-bust any type of file, not just CSS.

### 2. Cache-busting all sass files

This is useful when you have a lot of sass files that are imported into a single CSS file. For example, you have a `_sass/` directory with lots of files, and they are all imported into your `/assets/css/main.scss`, like this:

```scss
---
# Only the main Sass file needs front matter (the dashes are enough)
---
@charset "utf-8";

@import
  "variables",
  "themes",
  "layout",
  "base",
  "components"
;
```

To create a hash for your `main.scss` file considering the content of the whole `_sass/` directory, use the `bust_css_cache` filter in your templates:

```liquid
<link rel="stylesheet" href="{{ '/assets/css/main.css' | bust_css_cache }}">
```

This will output something like:

```html
<link rel="stylesheet" href="/assets/css/main.css?d41d8cd98f00b204e9800998ecf8427e">
```
