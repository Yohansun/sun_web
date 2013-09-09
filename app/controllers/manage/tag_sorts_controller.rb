#encoding: utf-8
class Manage::TagSortsController < Manage::BaseController
  def index 
    if params[:genre].present? && params[:genre].to_i == 0
      @tags = TagSort.order("id asc").where("genre = 0")  
    else
      @tags = TagSort.order("id asc").where("genre = 1")
    end
  end

  def update_tag_sort
    genre = 1
    params[:tag_sorts].each do |tag_id|
      tag_sort = TagSort.find tag_id[0]
      if params[:tag_sorts]["#{tag_id[0]}"] == "area"
        tag_sort.category_id = params[:tag_sorts]["#{tag_id[0]}"]
        tag_sort.title = "按地区"
      else
        cat = ImageLibraryCategory.find params[:tag_sorts]["#{tag_id[0]}"]
        tag_sort.category_id = cat.id
        tag_sort.title = cat.title
      end
      genre = tag_sort.genre
      tag_sort.save
  	end
    respond_to do |format|
        format.html {redirect_to tag_sorts_path(save: 1, genre: genre)}
    end
    
  end
end
