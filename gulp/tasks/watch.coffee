# Notes:
#  - gulp/tasks/browserify.js handles js recompiling with watchify
#  - gulp/tasks/browserSync.js watches and reloads compiled files
#

gulp     = require('gulp')
config   = require('../config')

gulp.task 'watch', ['watchify', 'browserSync'], ->
  gulp.watch(config.sass.src,   ['sass'])
  gulp.watch(config.images.src, ['images'])
  gulp.watch(config.jade.watch, ['jade'])
  gulp.watch(config.jade.yml, ['jade'])
  # Watchify will watch and recompile our JS, so no need to gulp.watch it
