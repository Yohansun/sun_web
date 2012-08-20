class FunctionController < ApplicationController
  def emagazine
    render :layout => nil
  end
  def edm_week
    render :layout => nil
  end

  def color_signup
  	@approve = Approve.new
  end

  def down_art_pdf
		send_file "#{Rails.root}/public/flash/e-art.pdf"
	end

  def emall
    if current_user
      key = Digest::MD5.hexdigest("username=#{current_user.try(:username)}date=#{Time.now.strftime("%Y/%m/%d")}")
      url = URI::escape("http://shop.nipponpaint.com.cn/users/autologin?username=#{current_user.try(:username)}&key=#{key}&user_source=icolor")
    else
      url = "http://shop.nipponpaint.com.cn/users/autologin?username="
    end
    redirect_to url
  end
end