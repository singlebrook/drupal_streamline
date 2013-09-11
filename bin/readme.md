## Executable files in this folder

  1. initializer.rb: This ruby class prodedurally initializes new projects. You provide the profile name and client name, and the script builds a new Drupal install and performs a set of initial housekeeping for project setup. It also initializes the git repo if desired.
  2. init.rb: This ruby script checks to make sure that the make file is present and then instantiates the initializer.
  3. themify: A bash script (Unix only) that enables livereload and uses Guard to start watching and compiling scss files. Also starts the livereload server for theming goodness.
