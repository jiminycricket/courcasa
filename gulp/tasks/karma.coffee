gulp = require('gulp')
karma = require('karma')

karmaTask = (done) ->
  karma.server.start({
    configFile: process.cwd() + '/karma.conf.js',
    singleRun: true
  }, done)

gulp.task('karma', karmaTask)

module.exports = karmaTask
