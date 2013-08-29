# Drupal Streamline

The Drupal Streamline quickly creates a starting point for new Drupal projects. Highlights include:

  - Automatic download of the latest version of Drupal core (7.x) and some commonly used modules
  - Seamless integration with theming tools like [Sass](http://sass-lang.com/) and LiveReload
  - A ready-to-go install profile and HTML5-ready theme
  - A custom dev module that:
    - enables useful modules like devel, diff, and field_ui
    - loads the client-side livereload js code
    - allows for quick theme switching using the 'theme' query parameter
  - A base directory structure ready for deployment to Acquia or other hosting services

## Requirements

  - [Drush](https://github.com/drush-ops/drush)
  - Linux, Unix, or Mac OS X (tested on OS X)

## New Project Setup

You can read more about the bash scripts in the readme of the `bin` directory. Typical setup is as follows:

  1. [Download](https://github.com/singlebrook/drupal_streamline/archive/master.zip) the zipped version of the project
  2. Modify the drupal-streamline.make file (optional)
  3. Run `$ bin/init` from the project root and answer questions

`bin/init` will do the following:

  - Download the latest versions of:
    - Drupal 7
    - some common contrib modules (selectable in the drupal-streamline.make file)
    - a starter theme template
    - a starter install profile template
    - a development module that includes livereload support
  - Create a custom client theme and install profile, ready for further edits
  - Rename this readme and create a new, blank readme
  - Initialize a new git repo, if desired

## Theming with Sass and Livereload

This project is configured with guard to watch for changes to the scss files and compile them. There is an executable script in the `bin` folder which starts guard, which in turn starts the scss compiler and livereload server.

### Requirements

  - Ruby
  - [Bundler](http://bundler.io/)
  - run `$ bundle install` once from the project root to download guard, sass, and livereload

To start theming, run `$ bin/themify` from the project root. Edited Sass files will automagically compile to CSS and reload in the browser (although you may need to reload the browser once to connect to the livereload server). To stop the guard and livereload processes, hit `^c` (control + c).

## Contributions

The easiest way to contribute to the Drupal Streamline project is to fork and clone a copy of this repository.

You'll be able to modify the make file and bash scripts, but not the other components (like the dev module and starter theme & install profile).

The easiest way to get a copy of those is to run the drush make file with the `--working-copy` switch, like so:

    drush make --working-copy drupal-streamline.make docroot

This will create git clones in the following locations:

    docroot/profiles/drupal_streamline_profile
    docroot/sites/all/modules/custom/drupal_streamline_dev
    docroot/sites/all/themes/drupal_streamline_theme

At this point, you could set up a vhost pointing to docroot, install Drupal using the 'CLIENT_NAME Profile', and start hacking. `bin/themify` will work, so you can make changes to the starter theme and quickly test them in your browser. You can also create branches and commits in the component directory (docroot/sites/all/themes/drupal_streamline_theme in this case). However, you won't be able to push your changes to the original github remote.

To submit your changes for pull requests or review, you should fork the component, add the fork as a remote, and push your branch to that fork. Component repos can be found here:

  - [drupal_streamline_profile](https://github.com/singlebrook/drupal_streamline_profile)
  - [drupal_streamline_dev](https://github.com/singlebrook/drupal_streamline_dev)
  - [drupal_streamline_theme](https://github.com/singlebrook/drupal_streamline_theme)

Be careful with the repos in `docroot` created by drush make, though. If you are testing the init script and need to delete `docroot`, you'll lose those nested component repos, too. We're working on a better way to manage this part of the development process, and contributions are welcome!


Created by [Singlebrook Technology, Inc.](http://singlebrook.com)
