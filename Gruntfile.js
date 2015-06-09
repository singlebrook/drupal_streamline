module.exports = function(grunt) {
  var theme_name = 'drupal_streamline_theme';

  var global_vars = {
    theme_name: theme_name,
    theme_css: 'docroot/sites/all/themes/<%= global_vars.theme_name %>/assets/css',
    theme_scss: 'docroot/sites/all/themes/<%= global_vars.theme_name %>/assets/scss',
  };

  require('load-grunt-tasks')(grunt);

  grunt.initConfig({
    global_vars: global_vars,
    pkg: grunt.file.readJSON('package.json'),

    autoprefixer: {
      options: {
        browsers: ['last 2 versions', 'ie 8', 'ie 9']
      },
      dist: {
        src: '<%= global_vars.theme_css %>/*.css',
      }
    },

    sass: {
      dist: {
        options: {
          outputStyle: 'expanded',
          includePaths: ['<%= global_vars.theme_scss %>/**/*.scss']
        },
        files: {
          '<%= global_vars.theme_css %>/<%= global_vars.theme_name %>.css': '<%= global_vars.theme_scss %>/<%= global_vars.theme_name %>.scss'
        }
      }
    },

    watch: {
      sass: {
        files: '<%= global_vars.theme_scss %>/**/*.scss',
        tasks: ['sass', 'autoprefixer'],
        options: {
          livereload: {
            port: 35777,
          },
        }
      },
    },
    browserSync: {
      dev: {
        bsFiles: {
          src : '<%= global_vars.theme_css %>/*.css'
        },
        options: {
          watchTask: true,
          proxy: "dos.dev:8888"
        },
        ghostMode: {
          clicks: true,
          scroll: true,
          links: true,
          forms: true
        }
      }
    }
  });

  grunt.registerTask('bs', ['browserSync', 'watch']);
  grunt.registerTask('default', 'watch');
};
