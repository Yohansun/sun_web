# -*- encoding : utf-8 -*-
module MagicContent
  class ColorCodesController < BaseController
    def autocomplete_recommend_color
      colors = ColorCode.select(:code).where("code LIKE ?", "%#{params[:q]}%").all.map {
          |e| e.code }
      render :text => colors.join("\n")
    end
  end
end