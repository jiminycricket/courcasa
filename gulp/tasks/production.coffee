gulp = require('gulp')

# Run this to compress all the things!
gulp.task 'production', ['karma'], ->
  # This runs only if the karma tests pass
  gulp.start(['jade', 'images', 'minifyGlyphs', 'iconFont', 'minifyHtml', 'minifyCss', 'uglifyJs'])
