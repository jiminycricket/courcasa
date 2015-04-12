console.log 'shadow_header.coffee loaded!!!'
$ = require 'jquery'
say = require './say'
window.$ = $

$window  = $(window)
$body    = $('body')

$header       = $('#header')
$menu         = $header.find('#menu')
$categoryItem = $header.find('.category-item')

$submenu         = $('#submenu')
$categoryViewbox = $submenu.find('.category-viewbox')
$categoryBox     = $submenu.find('.category-box')

$shadow  = $('#shadow-header')
$main    = $('.main')

$shadow.css('padding-top', $header.height())

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
