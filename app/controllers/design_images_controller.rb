# encoding: utf-8
class DesignImagesController < ApplicationController
  layout "home_manage"
  before_filter :get_categories, only: [:index, :lists, :image_show]

  caches_action :image_show, :cache_path => Proc.new { |c| c.params[:id] }, :expires_in => 7.days
  caches_action :lists, :cache_path => Proc.new { |c| c.params }, :expires_in => 7.days
  caches_action :index, :cache_path => Proc.new { |c| c.params }, :expires_in => 7.days

  def create
    newparams = coerce(params)
    @upload = DesignImage.new(newparams[:upload])
    @upload.user_id = params[:user_id]
    @upload.imageable_id = params[:design_id] if params[:design_id]
    @upload.imageable_type = params[:design_type] if params[:design_type]
    if @upload.save
      flash[:notice] = "Successfully created upload."
      session[:image_id] = @upload.id
      respond_to do |format|
        format.json {
          render :json => {
            :result => 'success',
            :upload => design_image_path(@upload.id),
            :path =>  @upload.file.url(:spring_img)
          }
        }
      end
    else
      respond_to do |format|
        format.json {
          render :json => {
            :result => 'failed',
            :action => 'new'
          }
        }
      end
    end
  end

  def download
    target_file = DesignImage.find(params[:id])
    if target_file
      send_file target_file.file.path(:slide)
    else
      render nothing: true, status: 404
    end
  end

  def show
    @upload = DesignImage.find(params[:id])
  end

  def lists
    @design_images = DesignImage.from.available.audited_with_colors

    #banners
    i_banners = IBanner.page_name('图库首页')
    @banner1 = i_banners.find_by_position(1)
    @banner2 = i_banners.find_by_position(2)
    @banner3 = i_banners.find_by_position(3)
    @banner4 = i_banners.find_by_position(4)
    @banner5 = i_banners.find_by_position(5)
    @banner6 = i_banners.find_by_position(6)
    @banner7 = i_banners.find_by_position(7)
    @banner8 = i_banners.find_by_position(8)

    #home_heads picture
    @home_heads = HomeHead.order("order_id")
    #红标题
    @liters_red = HomeLiterHead.order("order_id asc").where("genre = 0")
    #黑标题
    @liters_black = HomeLiterHead.order("order_id asc").where("genre = 1")
    #装修户型
    @type = HomeLiterHead.order("order_id asc").where("genre = ?", 6)
    #装修风格
    @style = HomeLiterHead.order("order_id asc").where("genre = ?", 4)
    #装修费用
    @cost = HomeLiterHead.order("order_id asc").where("genre = ?", 3)
    #装修空间
    @space = HomeLiterHead.order("order_id asc").where("genre = ?", 5)
    #装修色彩
    @color = HomeLiterHead.order("order_id asc").where("genre = ?", 2)

    #装修户型图片
    @home_types = HomeType.order("order_id")
    home_type_tags = HomeTypeCategory.where("tagable_type = ?", "home_type").map &:tag
    @home_type_tags = ImageLibraryCategory.find(home_type_tags)
    #装修风格图片
    @home_styles = HomeStyle.order("order_id")
    home_style_tags = HomeTypeCategory.where("tagable_type = ?", "home_style").map &:tag
    @home_style_tags = ImageLibraryCategory.find(home_style_tags)
    #装修费用图片
    @home_costs = HomeCost.order("order_id")
    home_cost_tags = HomeTypeCategory.where("tagable_type = ?", "home_cost").map &:tag
    @home_cost_tags = ImageLibraryCategory.find(home_cost_tags)
    #装修空间图片
    @home_spaces = HomeSpace.order("order_id")
    home_space_tags = HomeTypeCategory.where("tagable_type = ?", "home_space").map &:tag
    @home_space_tags = ImageLibraryCategory.find(home_space_tags)
    #装修色彩图片
    @home_colors = HomeColor.order("order_id")
    home_color_tags = HomeTypeCategory.where("tagable_type = ?", "home_color").map &:tag
    @home_color_tags = ImageLibraryCategory.find(home_color_tags)

    expires_in 7.days, 'max-stale' => 8.days, :public => true
  end

  def index
    # skip images home page
    return redirect_to '/images', :status => 301 if request.query_string.present?

    @search_word = params[:search]

    @path = params[:path]
    @ids = []
    @ids = @path.split('-') if @path.present?

    @other_ids = []
    @other_ids = @ids.last.split('_') if @ids.present?
    if @other_ids.present?
      @area = @other_ids[0]
      @pinyin = @other_ids[1]
      @color = @other_ids[2]
      @subject = @other_ids[3]
      @user_word = @search_word
      @rank = @other_ids[5]
    end

    # only select ids
    @ids.delete_at(-1)
    @tag_ids = @ids.uniq

    @content = []
    if @tag_ids.present?
      tag_arrs = []
      @tag_ids.each do |tag_arr|
        if tag_arr.to_i != 0

          tag = ImageLibraryCategory.find tag_arr

          tag_id = 0
          if tag.parent_id.present? && tag.parent_id != 210
            tag_id = tag.parent_id
          else
            tag_id = tag.id
          end

          case tag_id
          when 127
            @content[1] = (tag.title == "按人群" ? "人群" : tag.title)
          when 122
            @content[2] = (tag.title == "按用途" ? "用途" : tag.title)
          when 19
            @content[3] = (tag.title == "按费用" ? "费用" : tag.title)
          when 366
            @content[4] = (tag.title == "局部空间" ? "局部空间" : tag.title)
          when 62
            @content[5] = (tag.title == "按调性" ? "调性" : tag.title)
          when 107
            @content[6] = (tag.title == "按色彩" ? "色彩" : tag.title)
          when 1
            @content[7] = (tag.title == "按户型" ? "户型" : tag.title)
          when 34
            @content[8] = (tag.title == "按风格" ? "风格" : tag.title)
          when 28
            @content[9] = (tag.title == "按面积" ? "面积" : tag.title)
          when 82
            @content[10] = (tag.title == "按空间" ? "空间" : tag.title)
          when 132
            @content[11] = (tag.title == "按图片" ? "图片" : tag.title)
          else
            @content[12] = tag.title
          end

          tag_arrs << tag_arr
        end
      end
    end

    @design_images = DesignImage.from.available.audited_with_colors

    @tag_names = []
    @tag_ids = @tag_ids.delete_if {|x| x == "" }
    if @tag_ids.present?
      @tags = ImageLibraryCategory.where("id in (?)", @tag_ids)
      #取所有标签的parent
      parent_tags = @tags.select{|item| item.parent_id.blank?}.flatten.map(&:id)
      #取不含parent的标签
      final_tags = @tags.select{|item| item.parent_id.present?}.map { |tag| tag.self_and_descendants }.flatten
      #优先筛选parent的标签
      @design_images = @design_images.joins(:parent_tags).where("parent_tags.image_library_category_id in (?)", parent_tags) if parent_tags.present?
      tags = final_tags.map(&:id).uniq
      @design_images = @design_images.search_tags(tags)
      @tag_names << final_tags.map(&:title)
    end

    if @area.present? && @area.to_s != "0"
      area = Area.find(@area)
      areas = area.self_and_descendants
      area_tree = area.self_and_ancestors.map(&:id)
      @area_names = area.self_and_ancestors.map(&:name).join(" ")
      @area_level_1, @area_level_2, @area_level_3 = area_tree[0], area_tree[1], area_tree[2]
      @design_images = @design_images.where(area_id: areas.map(&:id))

      # @content[0] = area.parent.blank? ? nil : area.parent.name
    end

    word = @color if @color.present?
    word = @user_word if @user_word.present?
    if word.present? && word.to_s != "0"
      @tags = ImageLibraryCategory.where("title like ?", "%#{word}%")
      @design_images = @design_images.search_tags(@tags.map(&:id), true)
      @tag_names << @tags.map(&:title)
      @content[6] = "#{word}" + "#{@content[6]}" if word == "橙色系"
      @content[7] = "#{word}" + "#{@content[7]}" if word == "小户型"
      @content[10] = "#{word}" + "#{@content[10]}" if word == "客厅"
      @content[8] = "#{word}" + "#{@content[8]}" if word == "简约"
    end

    if @subject.present? && @subject.to_s != "0" && @subject.to_s != "All"
      @imageable_type = "大师作品" if @subject == "MasterDesign"
      @imageable_type = "设计之星" if @subject == "WeekStart"
      @imageable_type = "色彩配搭" if @subject == "ColorDesign"
      if @subject == 'WeekStart'
        @design_images = @design_images.where("sorts = 2")
      else
        @design_images = @design_images.where("imageable_type = ?", @subject)
      end
    end

    if @pinyin.present? && @pinyin.to_s != "0"
      @tags = ImageLibraryCategory.where("pinyin LIKE ?", "%#{@pinyin}%")
      @design_images.search_tags(@tags.map(&:id), true)
      @tag_names << @tags.map(&:title)
      @content[10] = @pinyin
    end

    if @rank == 'like' || @rank == 'view'
      if @rank == 'like'
        ranks = "design_images.votes_count desc"
      elsif @rank == 'view'
        ranks = "design_images.view_count desc"
      end
    else
      ranks = "design_images.id desc"
    end
    @design_images = @design_images.order(ranks)
    @img_count = @design_images.count
    @images = @design_images.page(params[:page]).per(18)
    @query_tags = []
    @ilcs = ImageLibraryCategory.find_all_by_id(@tag_ids)
    @query_tags = @ilcs if @ilcs.present?
    #use in metas_helper
    bujian = ImageLibraryCategory.find_by_title('按部件')
    @bujian_ids = bujian.children.map(&:id)
    @tag_bujian,@tag_other = [],[]
    if @query_tags.present?
      @query_tags.each do |tag|
        if @bujian_ids.include?(tag.try(:parent).try(:id)) || @bujian_ids.include?(tag.id)
          @tag_bujian << tag.title
        else
          @tag_other << tag.title
        end
      end
    end
    @tag_bujian_helper = @tag_bujian.present? ? (@tag_bujian.join(',') + ",") : ""
    @tag_other_helper = @tag_other.present? ? (@tag_other.join(',')) : ""
    #use in metas_helper end

    @special_kv = HomeKv.where(position: nil, visible: true).first

    #装修图库精选
    @images_jingxuan = IColumnData.show_data(2).limit(5)
    @images_jingxuan_more = IColumnData.where(i_column_type_id: 2,position: 0).first
    #设计之星作品精选
    @star_jingxuan = IColumnData.show_data(3).limit(5)
    @star_jingxuan_more = IColumnData.where(i_column_type_id: 3,position: 0).first

    #banners
    i_banners = IBanner.page_name('图库列表页')
    @banner1 = i_banners.find_by_position(1)
    @banner2 = i_banners.find_by_position(2)

    @fitting_parts = TagSort.order("id asc").where("genre = 0")
    @home_design = TagSort.order("id asc").where("genre = 1")

    expires_in 7.days, 'max-stale' => 8.days, :public => true

    render :index
  end

  def image_tag
    image_tags_arr = []

    image_tags = ImageTag.where(design_image_id: params[:image_id], genre: 'image_tag2')
    if image_tags.present?
      image_tags.each do |image_tag|
        image_tag.destroy
      end
    end

    if params[:furniture].present?
      image_tags_arr += params[:furniture]
    end
    if params[:lamps].present?
      image_tags_arr += params[:lamps]
    end
    if params[:fabric].present?
      image_tags_arr += params[:fabric]
    end
    if params[:metope].present?
      image_tags_arr += params[:metope]
    end
    if params[:accessories].present?
      image_tags_arr += params[:accessories]
    end
    if params[:appliances].present?
      image_tags_arr += params[:appliances]
    end
    if params[:cupboard].present?
      image_tags_arr += params[:cupboard]
    end
    if params[:baths].present?
      image_tags_arr += params[:baths]
    end
    if params[:ceramic_tile].present?
      image_tags_arr += params[:ceramic_tile]
    end
    if params[:floor].present?
      image_tags_arr += params[:floor]
    end
    if params[:articles].present?
      image_tags_arr += params[:articles]
    end
    if params[:doors_windows].present?
      image_tags_arr += params[:doors_windows]
    end
    if params[:digital].present?
      image_tags_arr += params[:digital]
    end
    if params[:other].present?
      image_tags_arr += params[:other]
    end
    if image_tags_arr.present?
      image_tags_arr.each do |image_tag|
        ImageTag.create(design_image_id: params[:image_id],image_library_category_id: image_tag, genre: 'image_tag2')
      end
    end
    render :js => "window.close();"
  end

  def decoration_parts
    @image_length = DesignImage.count
    if params[:imageable_type] == "MasterDesign"
      @images = DesignImage.available.where(imageable_type: 'MasterDesign').page(params[:page]).per(11)
    elsif params[:imageable_type] == "Design"
      @images = DesignImage.available.where(imageable_type: 'Design').page(params[:page]).per(11)
    elsif params[:imageable_type] == "ColorDesign"
      @images = DesignImage.available.where(imageable_type: 'ColorDesign').page(params[:page]).per(11)
    elsif params[:ranking_list] == "like"
      @images = DesignImage.includes(:design).available.order("designs.votes_count DESC").page(params[:page]).per(11)
    elsif params[:ranking_list] == "view_count"
      @images = DesignImage.includes(:design).available.order("designs.view_count DESC").page(params[:page]).per(11)
    else
      @images = DesignImage.available.page(params[:page]).per(11)
    end
  end

  def image_show
    @banners = IBanner.page_name('图库内页').where(position: [1,2,3,4]).order("position").all
    @master_interviews = IColumnData.show_data(6).limit(5)
    @master_more = IColumnData.where(i_column_type_id: 6,position: 0).first
    @about_info = IColumnData.show_data(7).limit(5)
    @more_info = IColumnData.where(i_column_type_id: 7,position: 0).first

    @image = DesignImage.from.includes(:design).includes(:tags).find(params[:id])
    @master_design = MasterDesign.find(@image.imageable_id) if @image.imageable_type == "MasterDesign"

    @image_tags = ImageLibraryCategory.find_all_by_id(@image.tags.map(&:image_library_category_id)).map{|a| a.title}
    @image_city = @image.area.try(:city_name)

    @color1, @color2, @color3 = search_color_code(@image.color1), search_color_code(@image.color2), search_color_code(@image.color3)

    expires_in 7.days, 'max-stale' => 8.days, :public => true
  end

  def thumbs
    parse_path_params

    @offset = params[:offset].to_i - 1

    if @offset < 0
      @offset = @images.where("design_images.id > ?", params[:image_id]).count
    end

    @offset = 0 if @offset > @img_count

    cache_key = [params[:image_id], params[:path]].join
    if params[:offset] == params[:fix_offset]
      if @offset >= 4
        @images = @images.select("distinct design_images.id, design_images.*").offset(@offset - 4).limit(9).all
        index = @images.map(&:id).index(params[:image_id].to_i) || 0
        @prev_images = Rails.cache.fetch("data-model-prev_image-#{cache_key}", expires_in: 7.days) do
          [@images[index - 1], @images[index - 4]]
        end
        @next_images = Rails.cache.fetch("data-model-next_image-#{cache_key}", expires_in: 7.days) do
          [@images[index + 1], @images[index + 4]]
        end
        @images = @images[4, 4]
      else
        @images = @images.select("distinct design_images.id, design_images.*").offset(0).limit(@offset + 9).all
        if @offset > 0
          @prev_images = Rails.cache.fetch("data-model-prev_image-#{cache_key}", expires_in: 7.days) do
            [@images[@offset - 1], @images[0]]
          end
        end
        index = @images.map(&:id).index(params[:image_id].to_i) || 0
        @next_images = Rails.cache.fetch("data-model-next_image-#{cache_key}", expires_in: 7.days) do
          [@images[index + 1], @images[index + 4]]
        end

        @images = @images[index, 4]
      end
    else
      @prev_images = Rails.cache.fetch("data-model-prev_image-#{cache_key}")
      @next_images = Rails.cache.fetch("data-model-next_image-#{cache_key}")
      @images = @images.select("distinct design_images.id, design_images.*").offset(@offset).limit(4).all
    end


    if @offset + 4 > @img_count
      @next_offset = 1
    else
      @next_offset = @offset + 5
    end

    @offset += 1

    expires_in 7.days, 'max-stale' => 8.days, :public => true
  end

  def get_latest_and_likes
    @image = DesignImage.find(params[:id])

    #猜你喜欢
    tags = @image.tags.map(&:image_library_category_id)
    if tags == []
      @like_images = DesignImage.from.available.audited_with_colors.order("id desc").group("design_images.imageable_id").limit(4)
    else
      tags = tags.sample(4)
      @like_images = DesignImage.from.available.audited_with_colors.search_tags(tags, true).group("design_images.imageable_id").limit(4)
    end

    #最新更新
    latest_images = Rails.cache.fetch("data-model-latest_1000_images", expires_in: 7.days) do
      DesignImage.order("id desc").available.audited_with_colors.limit(1000)
    end
    @latest_month_images = latest_images.sample(4)

    expires_in 7.days, 'max-stale' => 8.days, :public => true
  end

  def view_count
    # 增加图片浏览计数
    @image = DesignImage.find(params[:id])
    @image.view_count += 1
    @image.save

    render text: @image.view_count
  end

  def fullscreen
    @design_image = DesignImage.find(params[:id])

    @design_name = @design_image.try(:design).try(:title)
    @author = @design_image.try(:user).try(:username)

    render :layout => nil
  end

  def more_comment
    @image = DesignImage.find(params[:id])
    @page = params[:page].try(:to_i) +1
    @comments = @image.comments.page(@page).per(3)
  end

  def get_categories
    @images_count = Rails.cache.fetch("data-model-images_count", expires_in: 7.days) do
      DesignImage.from.available.audited_with_colors.count
    end

    @category_ids = Rails.cache.fetch("data-model-category_ids", expires_in: 10.days) do
      ImageLibraryCategory.parent_categories.collect do |categorie|
        {
          id: categorie.id,
          childs: categorie.children.collect{|c| {child_ids: c.id, child_child_ids: c.children.collect{|cc| cc.id} } }
        }
      end
    end

    #热门搜索
    @hot_search = SeoSite.order("rank asc").where("genre = 1")
    #面包屑导航
    @seo_sites = SeoSite.order("rank desc").where("genre = 0")

    #footer标签
    @footer_categories = []
    @footer_categories << ImageLibraryCategory.where(parent_id: 1)    #装修户型
    @footer_categories << ImageLibraryCategory.where(parent_id: 34)   #装修风格
    @footer_categories << ImageLibraryCategory.where(parent_id: 82)   #装修空间
    @footer_categories << ImageLibraryCategory.where(parent_id: 107)  #装修色彩
    @footer_categories << ImageLibraryCategory.where(parent_id: 19)   #装修费用
  end

  def get_thumb
    images = DesignImage.from.available.audited_with_colors.order("design_images.id desc")
    site = params[:site].to_i - 1
    @image_arr = images.offset(site).limit(4)
    respond_to do |format|
      format.json {render :json => { :result => @image_arr, :site => site } }
    end

  end

  private
  def parse_path_params
    params[:path] ||= "0-0-0-0-0-0-0-0-0-0-0-0-0_0_0_0_0_0"

    path_items = CGI.unescape(params[:path]).split("-")
    tag_ids = path_items[0...-1].map { |e| e.to_i }.uniq.sort - [0, -1]
    @tags = ImageLibraryCategory.where(id: tag_ids).all

    if @tags.size > 0
      other_path = path_items.last.split("_")
      @area, @pinyin, @search, @type, @rank = other_path[0], other_path[1], other_path[2], other_path[3], other_path[5]
    end

    images = DesignImage.from.available.audited_with_colors
    final_tags = @tags.select{|item| !item.parent_id.blank?}.map { |tag| tag.self_and_descendants }.flatten
    images = images.search_tags(final_tags.map(&:id).uniq)

    if @area && @area != '0'
      area = Area.find(@area)
      @areas = area.self_and_descendants
      @area_names = @areas.map(&:name).join(" ")
      images = images.where("area_id in (?)", @areas.map(&:id))
    end

    if @search.present? && @search != '_' && @search != "0"
      tags = ImageLibraryCategory.where("title LIKE ?", "%#{@search}%")
      images = images.search_tags(tags.map(&:id), true)
      final_tags << tags
    end

    if @type.present? && @type.to_s != "0"
      if @type == 'WeekStart'
        images = images.where("sorts = 2")
      else
        images = images.where("imageable_type = ?", @type)
      end
    end

    @images = images.order("design_images.id desc")

    counter_cache_key = [@area, @pinyin, @search, @type, @tags.map(&:id)].join("_")
    @img_count = Rails.cache.fetch("data-model-images_count-image_show-#{counter_cache_key}", expires_in: 7.days) do
      @images.count
    end

    # Fall-back for delete_link helper...
    @ids = tag_ids
    @other_ids = other_path
  end

  def coerce(params)
    if params[:upload].nil?
      h = Hash.new
      h[:upload] = Hash.new
      h[:upload][:file] = params[:Filedata]
      h[:upload][:file].content_type = MIME::Types.type_for(h[:upload][:file].original_filename).to_s
      h
    else
      params
    end
  end
end