# More info at https://github.com/guard/guard#readme

guard 'compass', configuration_file: 'config/compass_theme_config.rb' do
  watch(%r{docroot/sites/all/themes/sb_template/scss/(.*)\.s[ac]ss})
end

guard 'livereload', :port => '35777' do
  watch(%r{.+\.(css|js)$})
end
