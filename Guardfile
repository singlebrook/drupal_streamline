# More info at https://github.com/guard/guard#readme

require 'fileutils'

guard 'sass',
  :input => 'docroot/sites/all/themes/drupal_streamline_theme/styles/scss',
  :output => 'docroot/sites/all/themes/drupal_streamline_theme/styles/',
  :compass => true,
  :style => :compressed

guard 'livereload', :port => '35777' do
  watch(%r{.+\.(css|js)$})
  callback(:start_begin) {
    FileUtils.touch 'docroot/.drupal_streamline_guard_running'
    puts "\nPlease be sure that the drupal_streamline_dev module is enabled for livereload\n"
    puts "*** Don't forget to reload your browser (just once!), after which you should see a 'Browser connected.' message below."
  }
  callback(:stop_end) { FileUtils.rm 'docroot/.drupal_streamline_guard_running' }
end
