// jQuery easing plugin
jQuery.easing['jswing'] = jQuery.easing['swing']

jQuery.extend( jQuery.easing,
{
  def: 'easeOutExpo',
  swing: function (x, t, b, c, d) {
    return jQuery.easing[jQuery.easing.def](x, t, b, c, d)
  },
  easeOutExpo: function (x, t, b, c, d) {
    return (t==d) ? b+c : c * (-Math.pow(2, -10 * t/d) + 1) + b
  }
})

$.fn.ydaSlider = function(){

  var that = this
  this.slider = $('ul.slider-bin')
  this.li = this.find('li')
  this.sliding = false

  this.on('click', 'li', function(){
    that.slide( $(this).index() )
  })

  this.slide = function(num){
    if(this.sliding) return
    this.li.eq(num).addClass('nav-active').siblings().removeClass()
    this.sliding = true
    this.slider.animate({
      'left': - num * 1000
    }, 'normal', function(){
      that.sliding = false
    })
  }

  return this
}

$.fn.subnav = function(){

  function Subnav(ul){
    this.ul = $(ul)
    this.article = this.ul.next()
    this.items = this.article.find('div.item')
    this.archor = this.items.find('a.archor')
    this.li = this.ul.find('li')
    this.init()
  }

  Subnav.prototype = {
    init : function(){
      var that = this
      this.ul.on('click', 'li', function(){
        var li = $(this), index = li.index()
        li.addClass('sub-active').siblings().removeClass()
        that.alter(index)
      })

      if(this.archor.length){
        this.archor.on('click', function(){
          that.li.eq(1).click()
        })
      }
    },
    alter: function(index){
      this.items.hide().eq(index).stop(true).fadeIn(1000)
    }
  }

  return this.each(function(){
    return new Subnav(this)
  })
}

jQuery(function($){

  $('ul.subnav').subnav()

  var indexSlider = $('ul.nav').ydaSlider()

  var hashArr = indexSlider.find('li').map(function(i, li){
    return li.getElementsByTagName('a')[0].href.split('#')[1]
  })

  $(window).on('hashchange', function(){
    var hash = window.location.hash
    if(hash){
      var index = $.inArray(hash.slice(1), hashArr)
      if(index > -1){
        indexSlider.slide(index)
      }
    } else {
      indexSlider.slide(0)
    }
  }).trigger('hashchange')

})