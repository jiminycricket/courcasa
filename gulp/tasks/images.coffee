changed    = require('gulp-changed')
gulp       = require('gulp')
imagemin   = require('gulp-imagemin')
config     = require('../config').images
browserSync  = require('browser-sync')

gulp.task 'images', ->
  gulp.src(config.src)
    .pipe(changed(config.dest)) # Ignore unchanged files
    .pipe(imagemin(
      progressive: true
      svgoPlugins: [{removeUselessDefs: false}]
    ))
    .pipe(gulp.dest(config.dest))
    .pipe(browserSync.reload({stream:true}))
