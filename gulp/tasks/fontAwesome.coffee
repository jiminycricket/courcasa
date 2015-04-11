gulp   = require('gulp')
config = require('../config')

gulp.task 'fontAwesome', ->
  gulp.src("#{config.bower.dir}/fontawesome/fonts/**.*")
    .pipe(gulp.dest(config.fontawesome.dest)); 
