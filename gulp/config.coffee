PROJECT_NAME = 'courcasa'
SRC          = './src'
DEST         = './build'
BOWER        = './bower_components'

module.exports =
  browserSync:
    open: false
    server:
      baseDir: DEST # Serve up our build folder
  bower:
    dir: BOWER
  fontawesome:
    dest: "#{DEST}/fonts"
  sass:
    src: "#{SRC}/sass/**/*.{sass,scss}"
    dest: "#{DEST}/css"
    settings:
      indentedSyntax: true, # Enable .sass syntax!
      imagePath: 'images' # Used by the image-url helper
      includePaths: [
        "#{BOWER}/bootstrap-sass-official/assets/stylesheets"
        "#{BOWER}/fontawesome/scss"
        "#{SRC}/sass"
      ]
  images:
    src: "#{SRC}/images/**"
    dest: "#{DEST}/images"
  glyphs:
    src: "#{DEST}/glyphs/*.svg"
    dest: "#{DEST}/glyphs"
  jade:
    src: [
      "#{SRC}/jade/**/*.jade"
      "!#{SRC}/jade/**/_*.jade"
    ],
    yml: "#{SRC}/i18n/*.yml"
    watch: "#{SRC}/jade/**/*.jade"
    dest: DEST
  iconFonts:
    name: "#{PROJECT_NAME} Iconset"
    src: "#{SRC}/glyphs/*.svg"
    dest: "#{DEST}/fonts"
    sassDest: "#{SRC}/sass"
    template: './gulp/tasks/iconFont/template.sass.swig'
    sassOutputName: '_icons.sass'
    fontPath: '../fonts'
    className: 'fc'
    options:
      fontName: "#{PROJECT_NAME}-iconset"
      appendCodepoints: true
      normalize: false
  browserify:
    bundleConfigs: [
        entries: "#{SRC}/javascript/global.coffee"
        dest: "#{DEST}/javascript"
        outputName: 'global.js'
        extensions: ['.coffee']
        require: ['jquery']
    ]
  production:
    cssSrc: "#{DEST}/css/*.css"
    jsSrc: "#{DEST}/javascript/*.js"
    htmlSrc: "#{DEST}/**/*.html"
    cssDest: "#{DEST}/css"
    jsDest: "#{DEST}/javascript"
    htmlDest: "#{DEST}/"
