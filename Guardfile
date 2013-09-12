# More info at https://github.com/guard/guard#readme

require 'fileutils'

guard 'sass',
  :input => 'docroot/sites/all/themes/drupal_streamline_theme/scss',
  :output => 'docroot/sites/all/themes/drupal_streamline_theme/css',
  :compass => true,
  :style => :compressed

guard 'livereload', :port => '35777' do
  watch(%r{.+\.(css|js)$})
  callback(:start_begin) { `drush -r #{FileUtils.pwd()}/docroot en drupal_streamline_dev` }
end
