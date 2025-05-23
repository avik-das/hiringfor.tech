Hiring For Tech website
=======================

This is the website for [the Hiring For Tech newsletter](https://hiringfor.tech). The website contains the landing page, as well as archives of past editions.

Quick Start
-----------

This website is built with [Jekyll](https://jekyllrb.com/) and is suitable for deploying to [Github Pages](https://pages.github.com/).

To develop locally:

```sh
git clone https://github.com/avik-das/hiringfor.tech.git
cd hiringfor.tech

# Set up your rbenv if you wish
#
#   rbenv install 3.2.1
#   rbenv local 3.2.1
#   echo '.ruby-version' >> .git/info/exclude

# Or otherwise sure you're using a suitable new version of Ruby

gem install bundler
bundle

bundle exec jekyll serve

# Or, what I actually use for development:
#
# - Use the included live reload functionality
# - Compile drafts from the _drafts folder and include them in the index
# - Compile posts with dates in the future
# - Allow connections from external machines
bundle exec jekyll server \
  --livereload \
  --drafts \
  --future \
  --host 0.0.0.0
```

Now you can edit the website, and the website will be automatically re-generated.

While Github Pages will automatically build the website when new commits are pushed, you may want to create a statically-built version to deploy on other hosts. To do so:

```sh
bundle exec jekyll build
```

This will build the website into `_site`, just like `jekyll serve`, but will do so only once.

Quickly tagging posts
---------------------

Because I decided to add tags to all the posts well after writing many posts, I needed a way to quicky add and edit the tags for the posts one by one. Instead of opening up each file in a text editor, I created the `tagger` script to manage tags. Run the script and use the hotkeys presented in the simplistic UI:

```sh
# No need for `bundle exec` as the script has no non-stdlib dependencies
./tagger.rb
```

The tool will not only allow you to inspect and update the tags for a post, but when updating the tags, the tags will be added to the post in a canonical order.
