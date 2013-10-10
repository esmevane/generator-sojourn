# Generated on: <%= (new Date).toString().split('T')[0] %>
# Built by <%= pkg.name %> <%= pkg.version %>
#

LiveReload      = port: 35729
reloadables     = [ 'index.html', 'assets/**/*.coffee', 'assets/**/*.sass' ]
reloader        = require('connect-livereload') port: LiveReload.port
applicationRoot = 'app'

mountable = (connect, directory) ->
  path = require('path').resolve directory
  connect.static path

connection = (connect) ->
  [ reloader, mountable connect, applicationRoot ]

module.exports = (grunt) ->
  gruntTasks = require('matchdep').filterDev 'grunt-*'
  grunt.loadNpmTasks task for task in gruntTasks

  sassStyles =
    expand: true
    cwd: 'assets/styles'
    src: ['*.sass']
    dest: 'app/styles'
    ext: '.css'

  scssStyles =
    expand: true
    cwd: 'assets/styles'
    src: ['*.scss']
    dest: 'app/styles'
    ext: '.css'

  grunt.initConfig
    pkg: grunt.file.readJSON 'package.json'
    watch:
      options:
        nospawn: true
        livereload: LiveReload.port
      livereload:
        files: reloadables
        tasks: ['build']
    connect:
      options:
        port: 9000
        hostname: 'localhost'
        base: applicationRoot
      livereload:
        options:
          middleware: connection
    open:
      server:
        path: 'http://localhost:<%%= connect.options.port %>'
    coffee:
      glob_to_multiple:
        expand: true
        flatten: true
        cwd: "assets/scripts"
        src: ["*.coffee"]
        dest: "app/scripts"
        ext: ".js"
    sass:
      dist:
        files: [ sassStyles, scssStyles ]

  serverSequence = [ 'build', 'connect:livereload', 'open', 'watch']
  grunt.registerTask 'server', serverSequence

  buildSequence = [ 'coffee', 'sass' ]
  grunt.registerTask 'build', buildSequence
