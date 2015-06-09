<?php

/**
 * This is project's console commands configuration for Robo task runner.
 *
 * @see http://robo.li/
 */
/**
 * Class RoboFile
 * @package Singlebrook\Drupal7
 */
class RoboFile extends \Robo\Tasks {

  /**
   * @var
   */
  protected $profile_name;
  /**
   * @var
   */
  protected $client_name;
  /**
   * @var
   */
  protected $email;
  /**
   * @var
   */
  protected $git;

  /**
   * @var
   */
  protected $files;

  /**
   * The init task creates a new Drupal document root with a fresh copy of Drupal 7
   * containing:
   *
   * - custom install profile
   * - custom theme
   * - lots of commonly used modules
   * - some useful core patches
   * @see drupal-streamline.make
   */
  public function init() {
    $this->taskExec('drush make drupal-streamline.make docroot')
         ->run();
    $this->set_vars();
    $this->replace_streamline_placeholders();
    $this->taskFilesystemStack()
         ->stopOnFail()
         ->remove('readme.md')
         ->touch('readme.md');
    $this->taskWriteToFile('readme.md')
         ->line("# {$this->client_name} Drupal 7 Documentation")
         ->run();
    if (mb_strtolower($this->git) == 'y') {
      $this->taskGitStack()
           ->stopOnFail('Something went wrong setting up repository')
           ->exec('init')
           ->add('-A')
           ->commit('initial commit')
           ->run();
    }
    $this->say('Congratulations! Your new site is ready for installation!');
  }

  /**
   * Collects user input to be used in the init function
   */
  private function set_vars() {
    $this->profile_name = $this->ask("What is the name of the profile for the site?");
    $this->client_name = $this->ask("What is the client's name?");
    $this->email = $this->ask("What is the site admin's email address?");
    $this->git = $this->ask("Initialize a git repository (y/n)?");
  }

  /**
   * Replaces boilerplate text with custom variants
   */
  private function replace_streamline_placeholders() {
    $this->find_replace("drupal_streamline_profile", $this->profile_name);
    $this->find_replace("drupal_streamline_theme",
      "{$this->profile_name}_theme");
    $this->replace_string("CLIENT_NAME", $this->client_name);
    $this->replace_string("EMAIL_ADDY", $this->email);
  }

  /**
   * @param $find string old text to replace
   * @param $replace string new text to be inserted
   */
  private function find_replace($find, $replace) {
    $this->rename_directory($find, $replace);
    $this->rename_files($find, $replace);
    $this->replace_string($find, $replace);
  }

  /**
   * @param $find string old text to replace
   * @param $replace string new text to be inserted
   */
  private function rename_directory($find, $replace) {
    $dirs = array(
      (__DIR__) . "/docroot/profiles/drupal_streamline_profile",
      (__DIR__) . "/docroot/sites/all/themes/drupal_streamline_theme"
    );
    foreach ($dirs as $dir) {
      if (!mb_strpos($dir, $find)) {
        continue;
      }
      $new_name = str_replace($find, $replace, $dir);
      $this->_rename($dir, $new_name);
    }
  }

  /**
   * @param $find string old text to replace
   * @param $replace string new text to be inserted
   */
  private function rename_files($find, $replace) {
    $this->files = array_merge(glob("docroot/profiles/**/*"),
      glob("docroot/sites/all/themes/**/*"));
    foreach ($this->files as $file) {
      if (is_dir($file)) {
        continue;
      }
      $new_name = str_replace($find, $replace, $file);
      $this->_rename($file, $new_name);
    }
  }

  /**
   * @param $find string old text to replace
   * @param $replace string new text to be inserted
   */
  private function replace_string($find, $replace) {
    $this->files = array_merge(glob("docroot/profiles/**/*"),
      glob("docroot/sites/all/themes/**/*"));
    foreach ($this->files as $file) {
      if (is_dir($file)) {
        continue;
      }
      $this->taskReplaceInFile($file)
           ->from($find)
           ->to($replace)
           ->run();
    }
  }
}
