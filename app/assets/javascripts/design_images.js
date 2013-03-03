jQuery(document).ready(function($) {
  $(".pinyin_list a").click(function(event) {
    var pinyin = getParameterByName("pinyin");
    if (pinyin == $(event.target).text()) {
      refresh_search({pinyin: ''});
    } else {
      refresh_search({pinyin: $(event.target).text()});
    }
  });

  $(".pinyin_list a").each(function (){
    var pinyin = getParameterByName("pinyin");
    if($(this).text() == pinyin) {
      $(this).addClass("highlight");
    }
  });
});

function getParameterByName(name)
{
  name = name.replace(/[\[]/, "\\\[").replace(/[\]]/, "\\\]");
  var regexS = "[\\?&]" + name + "=([^&#]*)";
  var regex = new RegExp(regexS);
  var results = regex.exec(window.location.search);
  if(results == null)
    return "";
  else
    return decodeURIComponent(results[1].replace(/\+/g, " "));
}

function add_tag (parent_id, id) {
  if (tags[parent_id] == id) {
    tags[parent_id] = -1;
  } else {
    tags[parent_id] = id;
  }
  refresh_search({tags: _.uniq(_.compact(tags)).join(",")});
}

function add_all_tag (id) {
  var all_tags = getParameterByName("all_tags").split(",");
  if (_.indexOf(all_tags, id.toString()) > 0) {
    all_tags = _.without(all_tags, id.toString())
  } else {
    all_tags = _.union(all_tags, id.toString())
  }

  refresh_search({all_tags: _.uniq(_.compact(all_tags)).join(",")});
}

function submit_area() {
  var area_id = "";
  if ($(".level_1").val() > 0) {
    area_id = $(".level_1").val();
  };
  if ($(".level_2").val() > 0) {
    area_id = $(".level_2").val();
  };
  if ($(".level_3").val() > 0) {
    area_id = $(".level_3").val();
  };

  refresh_search({area_id: area_id});
}

function search_query(query) {
  refresh_search({search: query});
  return false;
}

function search_pinyin(pinyin) {
  refresh_search({pinyin: pinyin});
}

function search_ranking_list(ranking_list) {
  refresh_search({ranking_list: ranking_list});
}

function search_imageable_type(imageable_type) {
  refresh_search({imageable_type: imageable_type});
}

function refresh_search(params) {
  var imageable_type = getParameterByName("imageable_type");
  var search = getParameterByName("search");
  var tags = getParameterByName("tags");
  var all_tags = getParameterByName("all_tags");
  var area_id = getParameterByName("area_id");
  var pinyin = getParameterByName("pinyin");
  var ranking_list = getParameterByName("ranking_list");


  if (params.imageable_type != null) imageable_type = params.imageable_type;
  if (params.search != null) search = params.search;
  if (params.tags != null) tags = params.tags;
  if (params.all_tags != null) all_tags = params.all_tags;
  if (params.area_id != null) area_id = params.area_id;
  if (params.pinyin != null) pinyin = params.pinyin;
  if (params.ranking_list != null) ranking_list = params.ranking_list;

  window.location = "/design_images?imageable_type="+imageable_type+"&pinyin="+pinyin+"&search="+search+"&tags="+tags+"&all_tags="+all_tags+"&area_id="+area_id+"&ranking_list="+ranking_list;
}