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
	var $art_li = $('.art_nav li');
	$art_li.click(function(){
		$(this).addClass('selected').siblings().removeClass('selected');
		var num = $art_li.index(this);
		$('#art_container').children(':eq(' + num + ')').show().siblings().hide();
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
    'images/art/arts1_0.jpg',
    'images/art/arts1_1.jpg',
    'images/art/arts1_2.jpg',
    'images/art/arts2_0.jpg',
    'images/art/arts2_1.jpg',
    'images/art/arts2_2.jpg',
    'images/art/arts3_0.jpg',
    'images/art/arts3_1.jpg',
    'images/art/arts3_2.jpg',
    'images/art/arts4_0.jpg',
    'images/art/arts4_1.jpg',
    'images/art/arts4_2.jpg',
    'images/art/arts5_0.jpg',
    'images/art/arts5_1.jpg',
    'images/art/arts5_2.jpg',
    'images/art/arts6_0.jpg',
    'images/art/arts6_1.jpg',
    'images/art/arts6_2.jpg',
    'images/art/arts7_0.jpg',
    'images/art/arts7_1.jpg',
    'images/art/arts7_2.jpg',
    'images/art/arts8_0.jpg',
    'images/art/arts8_1.jpg',
    'images/art/arts8_2.jpg',
    'images/art/arts9_0.jpg',
    'images/art/arts9_1.jpg',
    'images/art/arts9_2.jpg',
    'images/art/arts10_0.jpg',
    'images/art/arts10_1.jpg',
    'images/art/arts10_2.jpg',
    'images/art/arts11_0.jpg',
    'images/art/arts11_1.jpg',
    'images/art/arts11_2.jpg',
    'images/art/arts12_0.jpg',
    'images/art/arts12_1.jpg',
    'images/art/arts12_2.jpg',

    'images/art/ipad1.png',
    'images/art/ipad1_img1.jpg',
    'images/art/ipad1_img1_big.jpg',
    'images/art/ipad1_img2.jpg',
    'images/art/ipad1_img2_big.jpg',
    'images/art/ipad1_img3.jpg',
    'images/art/ipad1_img3_big.jpg',
    'images/art/ipad1_img4.jpg',
    'images/art/ipad1_img4_big.jpg',
    'images/art/ipad1_img5.jpg',
    'images/art/ipad1_img5_big.jpg',
    'images/art/ipad1_img6.jpg',
    'images/art/ipad1_img6_big.jpg',
    'images/art/ipad2.png',
    'images/art/ipad3.jpg',
    'images/art/pdf1.jpg',
    'images/art/pdf2.jpg',
    'images/art/pdf3.jpg',
    'images/art/pdf4.jpg',
    'images/art/pdf5.jpg',
    'images/art/pdf6.jpg',
    'images/art/pdf7.jpg',
    'images/art/pdf8.jpg'
]);