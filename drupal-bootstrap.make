; Core version
core = 7.x

; API version
api = 2

; Core
projects[] = drupal

defaults[projects][subdir] = "contrib"

; Contrib
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
projects[drupal_bootstrap_profile][type] = "profile"
projects[drupal_bootstrap_profile][download][type] = "git"
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
