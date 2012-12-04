// index gallery

var GalleryN = {
  wrap: $('div.galleryN'),
  current: -1,
  show: function(index){
    if( index == this.current ) return;
    if( index > this.size - 1 ) {
      index = 0;
    } else if( index < 0 ) {
      index = GalleryN.size - 1;
    }
    $(this.item).eq(index).css('z-index', 12).fadeIn('fast');
    $(this.item).eq(this.current<0 ? index+1 : this.current).css('z-index', 11).fadeOut('fast');
    this.current = index;
  },  
  init: function(){
    this.item = $(this.wrap).find('li');
    this.moveLeft = $(this.wrap).find('span.moveleft');
    this.moveRight = $(this.wrap).find('span.moveright');
    this.size = $(this.item).size();
    if( this.size < 2 ){
      this.moveLeft.hide();
      this.moveRight.hide();
    }

    this.item.filter(function(index){
      return index;
    }).hide();

    this.moveLeft.click(function(){
      GalleryN.show(GalleryN.current-1);
    });
    this.moveRight.click(function(){
      GalleryN.show(GalleryN.current+1);
    });
    GalleryO.show(0);
  }
}

var GalleryM = {
  wrap: $('div.galleryM'),
  current: -1,
  show: function(index){
    if( index == this.current ) return;
    if( index > this.size - 1 ) {
      index = 0;
    } else if( index < 0 ) {
      index = this.size - 1;
    }
    $(this.item).eq(index).css('zIndex', 10).show();
    if( this.current > -1 ) {
      $(this.item).eq(this.current).css('zIndex', 9).hide();
    }
    this.current = index;
  },
  init: function(){
    this.item = $(this.wrap).find('li');
    this.moveLeft = $(this.wrap).find('.moveleft');
    this.moveRight = $(this.wrap).find('.moveright');
    this.size = this.item.size();
    if( this.item.size() < 2 ) {
      return;
    }

    this.moveLeft.click(function(){
      GalleryM.show(GalleryM.current-1);
    });
    this.moveRight.click(function(){
      GalleryM.show(GalleryM.current+1);
    });
    GalleryM.show(0);
  }
}

var GalleryO = {
  wrap: $('div.galleryO'),
  current: -1,
  show: function(index){
    if( index == this.current ) return;
    if( index > this.size - 1 ) {
      index = 0;
    } else if( index < 0 ) {
      index = this.size - 1;
    }
    $(this.item).eq(index).css('z-index', 12).fadeIn('fast');
    $(this.item).eq(this.current<0 ? index+1 : this.current).css('z-index', 11).fadeOut('fast');
    $(this.spanCurrent).html(index+1);
    this.current = index;
  },
  init: function(){
    this.item = $(this.wrap).find('li');
    this.moveLeft = $(this.wrap).find('.moveleft');
    this.moveRight = $(this.wrap).find('.moveright');
    this.size = this.item.size();
    this.spanCurrent = $(this.wrap).find('span.current');
    $(this.wrap).find('span.total').html(this.size);

    if( this.size < 2 ){
      this.moveLeft.hide();
      this.moveRight.hide();
    }
    this.item.filter(function(index){
      return index;
    }).hide();

    this.moveLeft.click(function(){
      GalleryO.show(GalleryO.current-1);
    });
    this.moveRight.click(function(){
      GalleryO.show(GalleryO.current+1);
    });
    setInterval(function(){
      GalleryO.show(GalleryO.current+1);
    },3000);
  }
}

$(function(){
  GalleryN.init();
  GalleryM.init();
  GalleryO.init();
});
