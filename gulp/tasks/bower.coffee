gulp = require('gulp')
bower = require('gulp-bower')
config = require('../config').bower

gulp.task 'bower', ->
  bower().pipe(gulp.dest(config.dir)) 
