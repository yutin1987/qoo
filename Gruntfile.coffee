module.exports = (grunt) ->

  # Project configuration.
  grunt.initConfig
    pkg: grunt.file.readJSON("package.json")
    jade:
      compile:
        options:
          data:
            debug: false
        files:
          "./index.html": ["./dev/index.jade"]
    coffee:
      options:
        bare: true
      glob_to_multiple:
        expand: true
        flatten: true
        cwd: "./dev/coffee/"
        src: ["*.coffee"]
        dest: "./dev/script/"
        ext: ".js"
    compass:
      dist:
        options:
          httpPath: "/"
          cssDir: "dev/style/"
          sassDir: "dev/sass/"
          cssPath: "dev/style/"
          imagesDir: "dev/img/"
    uglify:
      my_target:
        options:
          mangle: false
          beautify: false
          compress: false
          report: false
        files:
          './script/index.js': ['./dev/script/index.js'],
    cssmin:
      combine:
        files:
          './style/index.css': ['./dev/style/index.css'],
    watch:
      files: ["**/*.jade", "**/*.coffee", "**/*.sass"]
      tasks: ["jade", "coffee", "uglify", "compass", "cssmin"]

  grunt.loadNpmTasks "grunt-contrib-jade"
  grunt.loadNpmTasks "grunt-contrib-coffee"
  grunt.loadNpmTasks "grunt-contrib-compass"
  grunt.loadNpmTasks "grunt-contrib-uglify"
  grunt.loadNpmTasks "grunt-contrib-cssmin"
  grunt.loadNpmTasks "grunt-contrib-watch"
  grunt.registerTask "default", ["jade", "coffee", "uglify", "compass", "cssmin", "watch"]
