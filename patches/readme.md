# Patches

Patch documentation should be in the following format:

* module name
  * brief description
  * issue link (if exists)
  * patch file location

Example:

* views
  * Add CSS class to read-more link on trimmed text field
  * http://drupal.org/node/1557926
  * http://drupal.org/files/views-more_link_class-1557926.patch

## Steps to apply patches:

  1. cd into the directory of the module to be patched
  2. Apply the patch, typically using `patch -p1 < [relative path to patch file]`. For example:
     `patch -p1 < ../../../../../../views-more_link_class-1557926.patch`
  3. If you created the patch, add it to the project issue queue so that it might be included in a future release

## Current Patches

Please remove these items when/if official updates incorporate the included changes.

* system (Drupal core)
  * Prevents Drupal from disabling write permissions on the sites/default directory
  * https://drupal.org/node/1232572#comment-6767162
  * https://drupal.org/files/system.install-1232572.10.patch

* default.settings.php (Drupal core)
  * Allows the use of a local settings file for developers
  * default.settings.php-local_settings.patch
