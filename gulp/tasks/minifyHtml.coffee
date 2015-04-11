gulp       = require('gulp')
minifyHTML = require('gulp-minify-html')
config     = require('../config').production

gulp.task 'minifyHtml', ->
  gulp.src(config.htmlSrc)
    .pipe(minifyHTML())
    .pipe(gulp.dest(config.htmlDest))
