#encoding: utf-8
class Manage::HomeImageLibController < Manage::BaseController

  def index
  	@home_image_lib_photos = HomeImageLibPhoto.limit(7)
  	@left_home_image_lib_photos = HomeImageLibPhoto.limit(3)
  	@right_home_image_lib_photos = HomeImageLibPhoto.limit(7).offset(3)
  end

  def photos
  	photo_id = params[:photo_id]
  	@home_image_lib_photo = HomeImageLibPhoto.find_by_id(photo_id)

  	render :partial => "edit_photo"
  end

  def upload_image
  	p params
  	photo_id =  params[:photo_id]
  	@home_image_lib_photo = HomeImageLibPhoto.find_by_id(photo_id)
		@home_image_lib_photo.file = params[:file].tempfile if params[:file].present?
		@home_image_lib_photo.title = params[:title] if params[:title].present?
		@home_image_lib_photo.url = params[:url] if params[:url].present?
		@home_image_lib_photo.vote = params[:vote] if params[:vote].present?
  	if @home_image_lib_photo.save
  		if params[:file].present?
				render :partial => "show_image"
			else
				render :json => {:result => "success"}, :layout => false
			end
		else
			render :text => '错误，请返回'
		end
  end

  def tags
  	@tags = HomeImageLibTag.limit(4)
  	@categories = ImageLibraryCategory.parent_categories
  end

  def edit_tag_list
  	category = params[:category]
  	@image_library_category = ImageLibraryCategory.find_by_id(category)

  	render :partial => "edit_category"
  end

  def create_tag_list
  	home_image_lib_tag_id = params[:home_image_lib_tag_id]
  	category_ids = params[:category_ids]
    if params[:category_ids].present?
    	@tag = HomeImageLibTag.find_by_id(home_image_lib_tag_id)
    	@tag.category_id = params[:category]
    	@tag.category_list = params[:category_ids].join(',')
    	if @tag.save
    	  render :json => {:result => "success"}, :layout => false
    	else
    		render :text => '错误，请返回'
    	end
    else
      render :text => "不能选择为空"
    end
  end

  def search_vote
    result = 0
    url = params[:url]
    # url = "/users/111428/designs/69440?image_id=123768"
    if url =~ /\/designs\/\d+/
      design_id = url.scan(/\/designs\/\d+/).first.scan(/\d+/).map{|x| x.to_i}.inject(:+)
      @design = Design.find_by_id(design_id)
      result = @design.votes_count if @design.present?
    end

    # url = "/images/123768_0-0-0-0-0-0-0-0-0-0-all-0-0-0-_-0-1"
    if url =~ /\/images\/\d+_/
      design_image_id = url.scan(/\/images\/\d+_/).first.scan(/\d+/).map{|x| x.to_i}.inject(:+)
      @design_image = DesignImage.find_by_id(design_image_id)
      result = @design_image.votes_count if @design_image.present?
    end

    #/weekly_stars/116
    if url =~ /\/weekly_stars\/\d+/
      weekly_star = url.scan(/\/weekly_stars\/\d+/).first.scan(/\d+/).map{|x| x.to_i}.inject(:+)
      @weekly_star = WeeklyStar.find_by_id(weekly_star)
      result = @weekly_star.votes_count if @weekly_star.present?
    end

    #/color_designs/1094
    if url =~ /\/color_designs\/\d+/
      color_design = url.scan(/\/color_designs\/\d+/).first.scan(/\d+/).map{|x| x.to_i}.inject(:+)
      @color_design = ColorDesign.find_by_id(color_design)
      result = @color_design.votes_count if @color_design.present?
    end

    render :text => result
  end

end
