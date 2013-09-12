require 'fileutils'

class Initializer

  def init
    add_user_prompts
    run_make_file
    replace_streamline_placeholders
    initialize_git if @init_git.downcase == 'y'

    puts "Congratulations! Your new site is ready for installation!"
  end

  def run_make_file
    `drush make drupal-streamline.make docroot`
  end

  def add_user_prompts
    @profile_name = sanitize(prompt('What is the name of the profile for the site?'), true)
    @client_name = sanitize prompt "What is the client's name?"
    @email_addy = prompt "What is the email address for your admin user?"
    @init_git = prompt 'Initialize a git repository (y/n)?'
  end

  def sanitize(user_string, remove_spaces = false)
    user_string = user_string.downcase.gsub(" ", "_") if remove_spaces
    user_string.gsub("'", '&rsquo;')
  end

  def prompt msg
    print "#{msg}: "
    gets.chomp
  end

  def replace_streamline_placeholders
    find_and_replace('drupal_streamline_profile', @profile_name)
    find_and_replace('drupal_streamline_theme', "#{@profile_name}_theme")
    replace_string('CLIENT_NAME', @client_name)
    replace_string('EMAIL_ADDY', @email_addy)
  end

  def find_and_replace(find, replace)
    rename_directory(find, replace)
    rename_files(find, replace)
    replace_string(find, replace)
  end

  def rename_directory(find, replace)
    Dir.glob("./**/#{find}").each do |folder|
      new_name = folder.gsub(find, replace)
      File.rename(folder, new_name)
    end
  end

  def rename_files(find, replace)
    Dir.glob("./**/*").each do |filename|
      next unless filename.include? find
      new_name = filename.gsub(find, replace)
      File.rename(filename, new_name)
    end
  end

  def replace_string(find, replace)
    excluded_files = ['init.rb', 'initializer.rb', 'settings.php', 'drupal-streamline.make']

    Dir.glob("./**/*").each do |filename|
      next if File.directory? filename
      next if excluded_files.include?(File.basename(filename))
      text = File.read(filename)
      next unless text.include? find
      puts = text.gsub(find, replace)
      File.open(filename, "w") { |file| file << puts }
    end
  end

  def initialize_git
    if (File.directory?('.git'))
      return puts "You already have a .git directory! Are you working on the Drupal Streamline itself?"
    end

    File.rename('readme.md', 'drupal-streamline.md')
    add_to_file('readme.md', "# #{@client_name}")
    add_to_file('.gitignore', 'bin/init.rb')
    add_to_file('.gitignore', 'bin/initializer.rb')
    add_to_file('.gitignore', 'drupal-streamline.make')
    `git init`
    `git add .`
    `git commit -m 'Initial commit'`
  end

  def add_to_file(filepath, string)
    File.open(filepath, "w") { |file| file << string }
  end
end