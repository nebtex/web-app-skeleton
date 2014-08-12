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

  grunt.registerTask "build:dev:js", ()->

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
  grunt.registerTask "default", ["build:js:dev"]
  return
