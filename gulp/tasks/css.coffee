gulp = require('gulp')
concat = require('gulp-concat')
sourcemaps = require('gulp-sourcemaps')
config = require('../config').concatCss

gulp.task 'css', ->
  gulp.src(config.src)
    .pipe(sourcemaps.init())
    .pipe(concat('all.css'))
    .pipe(sourcemaps.write())
    .pipe(gulp.dest(config.dest))
