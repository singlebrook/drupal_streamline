## Executable files in this folder

  1. init: This script is the initializer for new projects. You provide the profile name and client name, and the script builds a new Drupal install and performs a set of initial housekeeping for project setup. It also initializes the git repo if desired. Deletes itself if you choose to create a new git repo.
  2. themify: Enables livereload and uses Guard to start watching and compiling scss files. Also starts the livereload server for theming goodness. Disables livereload when process is exited.
