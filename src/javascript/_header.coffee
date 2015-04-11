console.log 'shadow_header.coffee loaded!!!'
$ = require 'jquery'
say = require './say'
window.$ = $

$window  = $(window)
$body    = $('body')

$header  = $('#header')
$menu    = $('#menu')
$categoryItem = $('.category-item')

$submenu = $('#submenu')
$categoryViewbox = $('.category-viewbox')
$categoryBox = $('.category-box')

$shadow  = $('#shadow-header')
$main    = $('.main')

$shadow.height($header.height())

$window.on 'scroll', ->
  $submenu.toggleClass('smooth-hide', $main[0].getBoundingClientRect().top < $menu[0].getBoundingClientRect().bottom)

$categoryItem.on 'mouseenter', ->
  $el = $(@)
  index = $el.index()
  return if index >= $categoryBox.length
  $categoryBox.removeClass 'active'
  $targetBox = $categoryBox.eq(index).addClass('active')
  $categoryViewbox.height $targetBox.outerHeight()
  $submenu.removeClass 'smooth-hide'

$header.on 'mouseleave', ->
  $categoryBox.removeClass 'active'
  $submenu.addClass 'smooth-hide'
