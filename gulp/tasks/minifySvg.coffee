changed    = require('gulp-changed')
gulp       = require('gulp')
svgmin     = require('gulp-svgmin')
config     = require('../config').svgs

gulp.task 'minifySvg', ->
  gulp.src(config.src)
    .pipe(changed(config.dest)) # Ignore unchanged files
    .pipe(svgmin())
    .pipe(gulp.dest(config.dest))
