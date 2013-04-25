jQuery(document).ready(function($) {
  $(".pinyin_list a").click(function(event) {
    event.preventDefault();
    event.stopPropagation();
    var pinyin = getParameterByName("pinyin");
    if (pinyin == $(event.target).text()) {
      refresh_search({pinyin: ''});
    } else {
      refresh_search({pinyin: $(event.target).text()});
    }
  });

  $('.search_bin a.fr').click(function(event){
    event.preventDefault();
    event.stopPropagation();
    var rank = getParameterByName("ranking_list");
    var target_rank = $(event.target).data('rank');
    refresh_search({ranking_list: target_rank == undefined ? '' : target_rank });
  });

  $(".pinyin_list a").each(function (){
    // var pinyin = getParameterByName("pinyin");
    worth = _.last(window.location.href.split("/images/")).split("-");
    worth = worth.reverse();
    if(worth.length > 2){
      var pinyin = worth[4]
    }else{
      var pinyin = worth[5]
    }
    if($(this).text() == pinyin) {
      $(this).addClass("highlight");
    }
  });
});

function getParameterByName(name)
{
  name = name.replace(/[\[]/, "\\\[").replace(/[\]]/, "\\\]");
  var regexS = "[\\?-]" + name + "=([^-#]*)";
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
  refresh_search({tags: _.uniq(_.compact(tags)).join("-")});
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

function delete_submit_area() {
  refresh_search({area_id: ""});
}

function delete_pinyin() {
  refresh_search({pinyin: ""});
}

// function search_query(query) {
//   refresh_search({search: query});
//   return false;
// }

// function search_pinyin(pinyin) {
//   refresh_search({pinyin: pinyin});
// }

// function search_ranking_list(ranking_list) {
//   refresh_search({ranking_list: ranking_list});
// }

// function search_imageable_type(imageable_type) {
//   refresh_search({imageable_type: imageable_type});
// }

function refresh_search(params) {
  worth = _.last(window.location.href.split("/images/")).split("-");
  worth = worth.reverse();
  if(worth.length > 2){
  var imageable_type = worth[7]
  var ranking_list = worth[6]
  var area_id = worth[5]
  var pinyin = worth[4]
  var search = worth[3]
  var all_tags = worth[2]
  var page = worth[1]
  }else{
    var imageable_type = worth[8]
    var ranking_list = worth[7]
    var area_id = worth[6]
    var pinyin = worth[5]
    var search = worth[4]
    var all_tags = worth[3]
    var page = worth[2]
  }
  // var url = "";
  if (params.imageable_type != null) imageable_type = params.imageable_type;  
  if (params.search != null) search = params.search;
  if (params.tags != null) tags = params.tags;
  if (params.all_tags != null) all_tags = params.all_tags;
  if (params.area_id != null) area_id = params.area_id;
  if (params.pinyin != null) pinyin = params.pinyin;
  if (params.ranking_list != null) ranking_list = params.ranking_list;

  if (params.imageable_type != undefined) search = "";
  if (params.search != undefined) imageable_type = "";
  
  if(params.tags != null){
    var tags = params.tags.split('-');
   for(var i = 10 - tags.length; i --;){
      tags.push(0);
   }
   tags = tags.join('-') + '-';
  } else {
    var tags = '';
    if(worth.length > 2){
      var arr = worth.splice(worth.length - 10)
      for (var i = 1; i <= 10; i++) {
        if(arr[i] != undefined){
          tags += arr[i] + "-"
        }
      }

    }else{
      for (var i = 0; i < 10; i++) {
       tags += "0" + "-"
      }
    }
  }


  if(imageable_type == null || imageable_type == 0 || imageable_type == 'undefined'){
    imageable_type = 'all'
  }
  if(ranking_list == null || ranking_list == 0 || ranking_list == 'undefined'){
    ranking_list = '0'
  }
  if(area_id == null || area_id == 0 || area_id == 'undefined'){
    area_id = '0'
  }
  if(pinyin == null || pinyin == 0 || pinyin == 'undefined'){
    pinyin = '0'
  }
  if(search == null || search == "_" || search == 'undefined'){
    search = '_'
  }
  if(all_tags == null || all_tags == 0 || all_tags == 'undefined'){
    all_tags = '0'
  }
  if(page == null || page == 0 || page == 'undefined'){
    page = '0'
  }

  window.location = "/images/" + tags + imageable_type + "-" + ranking_list + "-" + area_id + "-" + pinyin + "-" + search + "-" + all_tags + "-" + 0 + "-" + "0";
}
