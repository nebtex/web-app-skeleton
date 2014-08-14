browserify = require("browserify")
coffeeify  = require("coffeeify")
path       = require('path')
fs         = require('fs')
exorcist   = require('exorcist')
mkdirp     = require('mkdirp')
concat = require('concat-stream')


module.exports = (grunt) ->

  # Project configuration.
  grunt.initConfig
    pkg: grunt.file.readJSON("package.json")
    sass:
      dev: # Target
        options: # Target options
          style: "expanded"

        files: # Dictionary of files
          "public/css/app.css": "assets/sass/app.scss" # 'destination': 'source'


  grunt.loadNpmTasks('grunt-contrib-sass');

  grunt.registerTask "build:dev:app:js", ()->

    js_dir = path.resolve(__dirname, 'public/js')

    # Tell grunt this task is asynchronous.
    done = @async()
    write = concat (data) ->
      out = path.join js_dir, 'app.js'
      grunt.file.write out, data
      done()

    mkdirp js_dir, (e) ->
      if e
        grunt.log.writeln(e)
      file = path.resolve(__dirname, 'src/app.coffee');
      b = browserify([file], {debug: true, extensions:".coffee"})
      b.transform("coffeeify")
      .bundle()
      .pipe(exorcist(path.join(js_dir,'app.js.map')))
      .pipe(write)


  # Default task(s).
  grunt.registerTask "build:dev:js", ["build:dev:app:js"]
  return
