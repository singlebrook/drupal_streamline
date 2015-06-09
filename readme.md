# Drupal Streamline

The Drupal Streamline quickly creates a starting point for new Drupal projects. Highlights include:

  - Automatic download of the latest version of Drupal core (7.x) and some commonly used modules
  - A ready-to-go install profile and HTML5-ready theme
  - Built in task runner for asset compilation, testing, and more!
  - PHPUnit and Behat for total test awesomeness
  - Drush 6 bundled right into the project, just add your favorite db server, fire up drush runserver and you're off to the races!
  - A custom dev module that:
    - enables useful modules like devel, diff, and field_ui
    - loads the client-side livereload js code
    - uses [DevelMailLog](https://api.drupal.org/api/devel/devel.mail.inc/class/DevelMailLog/7) to prevent and debug outgoing email messages
    - allows for quick theme switching using the 'theme' query parameter
  - A base directory structure ready for deployment to Acquia or other hosting services

## Requirements

  - [Composer](http://getcomposer.org)
  - PHP 5.4+ (to use drush server and some vendor packages to their fullest)

## New Project Setup


  1. [Download](https://github.com/singlebrook/drupal_streamline/archive/master.zip) the zipped version of the project
  2. Modify the drupal-streamline.make file (optional)
  3. Run `composer install` from the project root
  4. Run `./vendor/bin/robo init` and answer the questions as asked

`robo init` will do the following:

  - Download the latest versions of:
    - Drupal 7 (with optional developer-friendly patches. See patches/readme.md)
    - some common contrib modules (selectable in the drupal-streamline.make file)
    - a starter theme template
    - a starter install profile template
    - a development module that includes livereload support
  - Create a custom client theme and install profile, ready for further edits
  - Rename this readme and create a new, blank readme
  - Initialize a new git repo, if desired


## Contributions

The easiest way to contribute to the Drupal Streamline project is to fork and clone a copy of this repository.

You'll be able to modify the make file and php scripts, but not the other components (like the dev module and starter theme & install profile).

The easiest way to get a copy of those is to run the drush make file with the `--working-copy` switch, like so:

    drush make --working-copy drupal-streamline.make docroot

This will create git clones in the following locations:

    docroot/profiles/drupal_streamline_profile
    docroot/sites/all/modules/custom/drupal_streamline_dev
    docroot/sites/all/themes/drupal_streamline_theme

At this point, you could set up a server pointing to docroot, install Drupal using the 'CLIENT_NAME Profile', and start hacking. You can also create branches and commits in the component directory (docroot/sites/all/themes/drupal_streamline_theme in this case). However, you won't be able to push your changes to the original github remote.

To submit your changes for pull requests or review, you should fork the component, add the fork as a remote, and push your branch to that fork. Component repos can be found here:

  - [drupal_streamline_profile](https://github.com/singlebrook/drupal_streamline_profile)
  - [drupal_streamline_dev](https://github.com/singlebrook/drupal_streamline_dev)
  - [drupal_streamline_theme](https://github.com/singlebrook/drupal_streamline_theme)

Be careful with the repos in `docroot` created by drush make, though. If you are testing the init script and need to delete `docroot`, you'll lose those nested component repos, too. We're working on a better way to manage this part of the development process, and contributions are welcome!


Created by [Singlebrook Technology, Inc.](http://singlebrook.com)
