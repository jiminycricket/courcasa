gulp      = require('gulp')
config    = require('../config').production
minifyCSS = require('gulp-minify-css')
size      = require('gulp-filesize')

gulp.task 'minifyCss', ['sass'], ->
  gulp.src(config.cssSrc)
    .pipe(minifyCSS())
    .pipe(gulp.dest(config.cssDest))
    .pipe(size())
