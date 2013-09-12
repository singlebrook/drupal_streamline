#!/usr/bin/env ruby

require './bin/initializer'

# Make sure the project has been initialized
unless File.exists? 'drupal-streamline.make' 
  abort 'Please be sure that you are running this command from your project root.'
end

initializer = Initializer.new

initializer.init