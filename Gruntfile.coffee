module.exports = (grunt) ->
  grunt.initConfig
    coffee:
      compile:
        files: [
          expand: true
          cwd: 'src'
          src: '**/*.coffee'
          dest: 'target'
          ext: '.js'
        ]
    coffeelint:
      app: 'src/**/*.coffee'
      options:
        configFile: 'coffeelint.json'
    watch:
      files: ['Gruntfile.coffee', 'src/**/*.coffee']
      tasks: ['coffeelint', 'coffee']
    mochacli:
      options:
        recursive: true
        compilers: ['coffee:coffee-script/register']
      default: {}
      debug:
        options:
          ndebug: true
      all: "test/**/*.coffee"

  grunt.loadNpmTasks 'grunt-coffeelint'
  grunt.loadNpmTasks 'grunt-contrib-coffee'
  grunt.loadNpmTasks 'grunt-contrib-watch'
  grunt.loadNpmTasks 'grunt-mocha-cli'

  grunt.registerTask 'default', ['watch']

  grunt.registerTask 'test', ['mochacli:default']
  grunt.registerTask 'test:debug', ['mochacli:debug']
