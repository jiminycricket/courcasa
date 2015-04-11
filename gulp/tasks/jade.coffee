gulp          = require('gulp')
jade          = require('gulp-jade')
config        = require('../config').jade
browserSync   = require('browser-sync')
data          = require('gulp-data')
plumber       = require('gulp-plumber')
vinylYamlData = require('vinyl-yaml-data')
deepExtend    = require('deep-extend-stream')

locals = null

gulp.task 'yml', ->
  locals = {}
  gulp.src(config.yml)
    .pipe(vinylYamlData())
    .pipe(deepExtend(locals))

gulp.task 'jade', ['yml'], ->
  process = gulp.src(config.src)
    .pipe(plumber())
    .pipe(data(locals['dev']))
    .pipe(jade({pretty: true}))
    .pipe(gulp.dest(config.dest))
  process.pipe(browserSync.reload({stream:true}))
