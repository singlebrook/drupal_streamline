; Core version
core = 7.x

; API version
api = 2

; Core
projects[] = drupal

; By default, put all projects in contrib (e.g. sites/all/modules/contrib/)
defaults[projects][subdir] = "contrib"

; Contrib
; Feel free to add more of your favorite modules here.
projects[] = context
projects[] = ctools
projects[] = devel
projects[] = diff
projects[] = features
projects[] = pathauto
projects[] = strongarm
projects[] = token
projects[] = entity

; Custom
; Leave these in place if you plan to run bin/init or bin/themify.
; bin/init will rename drupal_bootstrap_profile and drupal_bootstrap_theme and they will
; become your custom install profile and theme. drupal_bootstrap_dev loads the client-side
; livereload js required by guard-livereload
projects[drupal_bootstrap_profile][type] = "profile"
projects[drupal_bootstrap_profile][download][type] = git
projects[drupal_bootstrap_profile][download][url] = https://github.com/singlebrook/drupal_bootstrap_profile.git
projects[drupal_bootstrap_profile][subdir] = ""

projects[drupal_bootstrap_dev][type] = module
projects[drupal_bootstrap_dev][download][type] = git
projects[drupal_bootstrap_dev][download][url] = https://github.com/singlebrook/drupal_bootstrap_dev.git
projects[drupal_bootstrap_dev][subdir] = "custom"

projects[drupal_bootstrap_theme][type] = theme
projects[drupal_bootstrap_theme][download][type] = git
projects[drupal_bootstrap_theme][download][url] = https://github.com/singlebrook/drupal_bootstrap_theme.git
projects[drupal_bootstrap_theme][subdir] = ""
