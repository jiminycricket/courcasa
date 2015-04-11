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
  for lang, content of locals
    dest = lang == 'dev' && config.dest || "#{config.dest}/#{lang}"
    process = gulp.src(config.src)
      .pipe(plumber())
      .pipe(data(content))
      .pipe(jade({pretty: true}))
      .pipe(gulp.dest(dest))
    process.pipe(browserSync.reload({stream:true})) if lang == 'zh_tw'
