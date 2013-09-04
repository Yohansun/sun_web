$(function(){
	/*flash zone*/

	var $art_li = $('.art_top li');

	$art_li.hover(function(){
		$(this).find('span').show();
	},function(){
		$(this).find('span').hide();
	}).mouseover(function(e){
		var num = $('.art_top li').index(this);
		$('.art_box').hide().eq(num).show();
	});

	$('.ipad1_zoom').click(o_in2);
	$('#lay_close').click(o_out2);

    function o_in2(){
    $('#overlay2').fadeIn('fast');
    }
    function o_out2(){
    $('#overlay2').fadeOut('fast');
    }

	/*art nav starts*/
     $('.art_nav').on('click', 'li', function(e){
        var index = $(this).index();
        var that = $(e.delegateTarget);
        that.removeClass().addClass('art_nav clearfix art_nav_' + index);
        $('#art_container').children().eq(index).show().siblings().hide();
    });

	$('#carousel,#pdf_container,#arts').draggableCarousel({
		'keyControls' : true,
		'transitionDuration' : 1000
	});

	var $pa = $('.art_box div.pa');
	$pa.each(function(){
		var $this = $(this);
		var html = '<div class="info2 pa">' + $this.data('title') + '</div>';
		$this.html(html);
		var bottom = parseInt($this.css('bottom'));
		$this.hover(function(){
			$this.stop(true).animate({'bottom':bottom + 10},'normal').children().fadeIn();
		},function(){
			$this.children().hide();
			$this.stop().animate({'bottom':bottom},'normal');
		});
	});

	$('.art_box').each(function(){
        var $this = $(this);
        var $a = $this.children('a');
        $a.click(function(){
            var $this = $(this);
            $this.addClass('light_on').siblings('a').removeClass('light_on');
            var $bin = $this.siblings('.art_bin');
            $bin.children().eq($a.index(this)).show().siblings().hide();
        });
    });

});
function preload(arr) {
    $(arr).each(function(){
        $('<img/>')[0].src = this;
    });
}

preload([
    '/assets/art/arts1_0.jpg',
    '/assets/art/arts1_1.jpg',
    '/assets/art/arts1_2.jpg',
    '/assets/art/arts2_0.jpg',
    '/assets/art/arts2_1.jpg',
    '/assets/art/arts2_2.jpg',
    '/assets/art/arts3_0.jpg',
    '/assets/art/arts3_1.jpg',
    '/assets/art/arts3_2.jpg',
    '/assets/art/arts4_0.jpg',
    '/assets/art/arts4_1.jpg',
    '/assets/art/arts4_2.jpg',
    '/assets/art/arts5_0.jpg',
    '/assets/art/arts5_1.jpg',
    '/assets/art/arts5_2.jpg',
    '/assets/art/arts6_0.jpg',
    '/assets/art/arts6_1.jpg',
    '/assets/art/arts6_2.jpg',
    '/assets/art/arts7_0.jpg',
    '/assets/art/arts7_1.jpg',
    '/assets/art/arts7_2.jpg',
    '/assets/art/arts8_0.jpg',
    '/assets/art/arts8_1.jpg',
    '/assets/art/arts8_2.jpg',
    '/assets/art/arts9_0.jpg',
    '/assets/art/arts9_1.jpg',
    '/assets/art/arts9_2.jpg',
    '/assets/art/arts10_0.jpg',
    '/assets/art/arts10_1.jpg',
    '/assets/art/arts10_2.jpg',
    '/assets/art/arts11_0.jpg',
    '/assets/art/arts11_1.jpg',
    '/assets/art/arts11_2.jpg',
    '/assets/art/arts12_0.jpg',
    '/assets/art/arts12_1.jpg',
    '/assets/art/arts12_2.jpg',

    '/assets/art/ipad1.png',
    '/assets/art/ipad1_img1.jpg',
    '/assets/art/ipad1_img1_big.jpg',
    '/assets/art/ipad1_img2.jpg',
    '/assets/art/ipad1_img2_big.jpg',
    '/assets/art/ipad1_img3.jpg',
    '/assets/art/ipad1_img3_big.jpg',
    '/assets/art/ipad1_img4.jpg',
    '/assets/art/ipad1_img4_big.jpg',
    '/assets/art/ipad1_img5.jpg',
    '/assets/art/ipad1_img5_big.jpg',
    '/assets/art/ipad1_img6.jpg',
    '/assets/art/ipad1_img6_big.jpg',
    '/assets/art/ipad2.png',
    '/assets/art/ipad3.jpg',
    '/assets/art/pdf1.jpg',
    '/assets/art/pdf2.jpg',
    '/assets/art/pdf3.jpg',
    '/assets/art/pdf4.jpg',
    '/assets/art/pdf5.jpg',
    '/assets/art/pdf6.jpg',
    '/assets/art/pdf7.jpg',
    '/assets/art/pdf8.jpg'
]);