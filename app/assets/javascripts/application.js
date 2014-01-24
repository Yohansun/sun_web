// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
// WARNING: THE FIRST BLANK LINE MARKS THE END OF WHAT'S TO BE PROCESSED, ANY BLANK LINE SHOULD
// GO AFTER THE REQUIRES BELOW.
//
//= require jquery
//= require jquery_ujs
//= require main
//= require icolor
//= require special_events
//= require bootstrap-datetimepicker

//datepicker & timepicker
$(function(){
  if ($('.datepickers').length > 0) {
    $('.datepickers').datetimepicker({format: 'yyyy-mm-dd',autoclose: true,minView: 2});
    $(".datetimepicker_full").datetimepicker({weekStart:1,todayBtn:1,autoclose:1,todayHighlight:1,startView:2,forceParse:0,showMeridian:1});
  };
});
// jquery get params
function getParameters() {
  var searchString = window.location.search.substring(1)
    , params = searchString.split("&")
    , hash = {}
    ;

  if (searchString == "") return {};
  for (var i = 0; i < params.length; i++) {
    var val = params[i].split("=");
    hash[decodeURI(val[0])] = decodeURI(val[1]);
  }
  return hash;
}