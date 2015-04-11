gulp       = require('gulp')
svgmin     = require('gulp-svgmin')
config     = require('../config').glyphs

gulp.task 'minifyGlyphs', ->
  gulp.src(config.src)
    .pipe(svgmin())
    .pipe(gulp.dest(config.dest))
