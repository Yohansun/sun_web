#encoding: utf-8
class Manage::SeoSitesController < Manage::BaseController
  def index
    if params[:genre].present? && params[:genre].to_i == 0
      @seo_sites = SeoSite.order("rank asc").where("genre = 0")  
    else
      @seo_sites = SeoSite.order("rank asc").where("genre = 1")
    end
  end

  def update_tag
    @seo_site = SeoSite.find(params[:id])
    @seo_site.title = params[:title]
    @seo_site.link = params[:link]
    if @seo_site.save
      render js: "alert('保存成功!');location.reload();"
    else
      render js: "alert('保存失败!');"      
    end
  end
end
