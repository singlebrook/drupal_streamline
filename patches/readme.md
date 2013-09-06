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

---
