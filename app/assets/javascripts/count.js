/*
 *	jQuery layer plugin v1.1
 *	author : luck chang
 *	email : chunhang@networking.io
 *	date : 2012.06.11 15:11:26
 */

;(function($){
	$.fn.extend({
		'layer' : function(configs){

			configs = $.extend({

				animation : false,
				speed : 400,
				styles : 'shake',	//or slide
				onscroll : false	//scroll pannel is active

			},configs);

			var my = {};
			my.center = $('.abs_center');
			my.that = this;
			my.shut = $('#lay_close');
			my.div = $('.layer_content');
			my.lay = $('#layer');
			my.ie6 = $.browser.msie && $.browser.version == 6;

			my.w = my.div.css('width');
			my.h = my.div.css('height');

			if(configs.onscroll){
				my.div.css('position','absolute');
			}

			my.that.click(function(event){
				var $this = $(this);
				my.dat = $this.attr('data-order');
				my.reason = $this.attr('data-reason');
				my.remain = $this.attr('data-remain');
				$('#data_order').val($this.parents('tr').attr('id'));

				event.preventDefault();
				if(my.lay.is(':visible')) return;
				if(configs.animation){
					if(configs.styles == 'shake'){
						my.div.show()
						.animate({'top':'60%'},configs.speed)
						.animate({'top':'40%'},configs.speed)
						.animate({'top':'55%'},configs.speed)
						.animate({'top':'45%'},configs.speed)
						.animate({'top':'50%'},configs.speed);
					}						
					else if(configs.styles == 'slide'){
						my.div.show()
						.animate({'top':'50%'},configs.speed);
					}
				}
				else{
					my.div.css('top','50%').fadeIn();
				}

				my.div.find('#top_order').val(my.dat);
				my.div.find('#top_reason').val(my.reason);
				my.div.find('#top_remain').text(my.remain);
				layin();
			});
	
			$(document).keydown(function(event){
				if(my.lay.is(':visible')){
					if(event.which == 27){
						close_all();
					}
				}
			});

			my.shut.click(close_all);
			my.lay.click(close_all);

			function close_all(){
				if(configs.animation){
					my.center.stop(true).animate({'top':'-50%'},'normal',function(){
						$(this).hide();
					})
				}
				else{
					my.center.fadeOut();
				}
				layout();
			}
			function layin(){
				if(my.ie6){
					var h = document.documentElement.scrollHeight;
					my.lay.css('height', h + 'px');
				}
				my.lay.show().animate({'opacity':'0.5'},'normal');
			}
			function layout(){
				my.lay.animate({'opacity':'0'},'normal').hide();
			}
		}
	});
})(jQuery);

$(function(){
	$('.data_pop').layer({
		animation : true,
		styles : 'slide',
		speed : 300,
		onscroll : false
	});

  var $td = $('.product_name'),            //products
  $form = $('#input_pop'),                //3 inputs
  $input = $form.find('[type=text]'),        //3 inputs
  $td2 = $('.sale_amount'),                //sale amount
  $form2 = $('#sale_amount'),                //1 input
  $input2 = $form2.find('[type=text]'),    //1 input

  $td3 = $('.art_paint_num'),
  $td4 = $('.comments'),
  $flag = $('#flag'),
  $form2_input = $('#form2_input');

	$td.click(function(){
		var $this = $(this),
		arr = [];
		var $p = $this.children('p');
		$p.each(function(){
			arr.push($(this).text().split(':'));
		});

		showDiv($this,$form,arr);
		$("#user_id").val($this.parents("tr").attr('id'));
		$form2.hide();
	});
  $td2.click(td2_td4);
  $td3.click(td2_td4);
  $td4.click(td2_td4);
   
  function td2_td4(){
		var $this = $(this),
		p = $this.children('p').text();

		showDiv($this,$form2,p);
		$("#sale_amount_hidden").val($this.parents("tr").attr('id'));
		$form.hide();
	}

	function showDiv(obj,form,arr){
    var left = obj.position().left;/* - 20;*/
    var top = obj.position().top;/* + obj.outerHeight();*/
		form.css({'left':left,'top':top}).show();

		if($.isArray(arr)){
			var $inputs = form.find(':input[type=text]');
			$inputs[0].focus();
			arr = [].concat.apply([], arr);
			$inputs.each(function(index){
				$inputs.eq(index).val(arr[index]);
			});
		}
		else{
			form.find(':input[type=text]').focus().val(arr);
		}
		var clsName = obj[0].className;
		var tmp = "";
		$flag.val(clsName);

		switch (clsName) {
			case "art_paint_num":
				tmp = "art_paint_quantity";
				break;
			case "sale_amount":
				tmp = "sales";
				break;
			case "comments":
				tmp = "remarks";		
		}
		$form2_input.attr('name','seller_data[' + tmp + ']' );
	}
});