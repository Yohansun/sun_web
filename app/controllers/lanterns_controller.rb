# -*- encoding : utf-8 -*-
class LanternsController < ApplicationController

  def index
    if Time.now.strftime("%Y%m%d").to_i > Time.local(2014,2,17).strftime("%Y%m%d").to_i
      redirect_to root_path
    end
  end

  def lottery
    @date_today = Time.now.strftime('%Y-%m-%d').split('-').join().to_i
    @is_check_today = Lantern.where(user_id: current_user.id)
    if @is_check_today.blank?
      rand = rand(10)
      if rand < 3
        Lantern.create(user_id: current_user.id, content: '玫瑰',date_at: @date_today)
        render js: "$('#unwinning').modal(); $('.modal-backdrop').unbind('click');" and return
      end
      if rand > 2 && rand < 6
        Lantern.create(user_id: current_user.id, content: '手机壳',date_at: @date_today)
        render js: "$('#phone').modal(); $('.modal-backdrop').unbind('click');" and return
      end
      if rand > 5 && rand < 9
        Lantern.create(user_id: current_user.id, content: 'U盘',date_at: @date_today)
        render js: "$('#upan').modal(); $('.modal-backdrop').unbind('click');" and return
      end
      if rand > 8
        Lantern.create(user_id: current_user.id, content: '礼包',date_at: @date_today)
        render js: "$('#libao').modal(); $('.modal-backdrop').unbind('click');" and return
      end

    else
      render js: "alert('每位用户每日只能中奖一次，感谢您的参与！');"
    end
  end

  def update_forwar
    if current_user
      lantern = Lantern.find_by_user_id(current_user.id)
      lantern.forwar = 1
      lantern.save
      if params[:bdshare].present?
        username = current_user.name.present? ? current_user.name : current_user.username
        if params[:bdshare] == 'bds_tsina'
          ForwarUser.create(username: username,genre: "新浪")
        end
        if params[:bdshare] == 'bds_kaixin001'
          ForwarUser.create(username: username,genre: "开心")
        end
        if params[:bdshare] == 'bds_renren'
          ForwarUser.create(username: username,genre: "人人")
        end
        if params[:bdshare] == 'bds_qzone'
          ForwarUser.create(username: username,genre: "QQ空间")
        end
      end
    end
    render json: "OK"
  end
end
