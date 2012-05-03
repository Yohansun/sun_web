# -*- encoding : utf-8 -*-
module MagicContent
  class StatController < BaseController
    layout 'magic_admin/application'

    skip_load_and_authorize_resource

    def index
      if params[:start_date].blank?
        params[:start_date] = Time.now.beginning_of_week.to_s
      end

      if params[:end_date].blank?
        params[:end_date] = Time.now.end_of_week.to_s
      end

      start_date = params[:start_date].to_time.utc.to_formatted_s(:db)
      end_date = params[:end_date].to_time.utc.to_formatted_s(:db)

      @reg_count1 = User.where(:created_at => start_date..end_date).where("role_id = 1 AND des_status = 0").count
      @reg_count2 = User.where(:created_at => start_date..end_date).where("role_id = 1 AND des_status = 1").count
      @reg_count3 = User.where(:created_at => start_date..end_date).where("role_id = 2").count
      @reg_count4 = User.where(:created_at => start_date..end_date).where("role_id = 3").count

      @design_count1 = Design.includes(:user).where("designs.created_at" => start_date..end_date).where("users.role_id = 1 AND users.des_status = 0").count
      @design_count2 = Design.includes(:user).where("designs.created_at" => start_date..end_date).where("users.role_id = 1 AND users.des_status = 1").count
      @design_count3 = Design.includes(:user).where("designs.created_at" => start_date..end_date).where("users.role_id = 2").count
      @design_count4 = Design.includes(:user).where("designs.created_at" => start_date..end_date).where("users.role_id = 3").count

      @reg_and_login_count1 = User.where(:created_at => start_date..end_date).where("role_id = 1 AND des_status = 0").where("sign_in_count > 0").count
      @reg_and_login_count2 = User.where(:created_at => start_date..end_date).where("role_id = 1 AND des_status = 1").where("sign_in_count > 0").count
      @reg_and_login_count3 = User.where(:created_at => start_date..end_date).where("role_id = 2").where("sign_in_count > 0").count
      @reg_and_login_count4 = User.where(:created_at => start_date..end_date).where("role_id = 3").where("sign_in_count > 0").count

      @reg_not_login_count1 = User.where(:created_at => start_date..end_date).where("role_id = 1 AND des_status = 0").where("sign_in_count = 0").count
      @reg_not_login_count2 = User.where(:created_at => start_date..end_date).where("role_id = 1 AND des_status = 1").where("sign_in_count = 0").count
      @reg_not_login_count3 = User.where(:created_at => start_date..end_date).where("role_id = 2").where("sign_in_count = 0").count
      @reg_not_login_count4 = User.where(:created_at => start_date..end_date).where("role_id = 3").where("sign_in_count = 0").count

      #第三方连接进入icolor
      @lands = Land.select("source, count(*) as count").where(:created_at => start_date..end_date).group(:source)


      arr_huadong = []
      arr_huanan = []
      arr_huazhong = []
      arr_huabei = []
      arr_xibei = []
      arr_xinan = []
      arr_dongbei = []

      Area.where(:id => [2, 44, 184, 432, 1142, 2881, 3198]).each do |area|
        area.leaves.each do |les|
          arr_huadong << les.id
        end
      end
      Area.where(:id => [2985, 3932, 3452]).each do |area|
        area.leaves.each do |les|
          arr_huanan << les.id
        end
      end
      Area.where(:id => [297,801,2730]).each do |area|
        area.leaves.each do |les|
          arr_huazhong << les.id
        end
      end
      Area.where(:id => [581, 602, 999, 25]).each do |area|
        area.leaves.each do |les|
          arr_huabei << les.id
        end
      end
      Area.where(:id => [1658,1740,2334,2482,2515,3324]).each do |area|
        area.leaves.each do |les|
          arr_xibei << les.id
        end
      end
      Area.where(:id => [1616, 1855, 1994, 2102, 2394]).each do |area|
        area.leaves.each do |les|
          arr_xinan << les.id
        end
      end
      Area.where(:id => [1322, 1457, 2647, 3324]).each do |area|
        area.leaves.each do |les|
          arr_dongbei << les.id
        end
      end
      #片区活跃度 华东地区（山东，江苏，安徽，江西，浙江，福建，上海）
      @reg_huadong1 = count_reg_user_data(arr_huadong, start_date, end_date, 1, 0)
      @reg_huadong2 = count_reg_user_data(arr_huadong, start_date, end_date, 1, 1)
      @reg_huadong3 = count_reg_user_data(arr_huadong, start_date, end_date, 2)
      @reg_huadong4 = count_reg_user_data(arr_huadong, start_date, end_date, 3)
      @login_huadong1 = count_login_user_data(arr_huadong, start_date, end_date, 1, 0)
      @login_huadong2 = count_login_user_data(arr_huadong, start_date, end_date, 1, 1)
      @login_huadong3 = count_login_user_data(arr_huadong, start_date, end_date, 2)
      @login_huadong4 = count_login_user_data(arr_huadong, start_date, end_date, 3)
      @design_huadong1 = count_desgin_data(arr_huadong, start_date, end_date, 1, 0)
      @design_huadong2 = count_desgin_data(arr_huadong, start_date, end_date, 1, 1)
      @design_huadong3 = count_desgin_data(arr_huadong, start_date, end_date, 2)
      @design_huadong4 = count_desgin_data(arr_huadong, start_date, end_date, 3)

      #华南地区（广东，广西，海南）
      @reg_huanan1 = count_reg_user_data(arr_huanan, start_date, end_date, 1, 0)
      @reg_huanan2 = count_reg_user_data(arr_huanan, start_date, end_date, 1, 1)
      @reg_huanan3 = count_reg_user_data(arr_huanan, start_date, end_date, 2)
      @reg_huanan4 = count_reg_user_data(arr_huanan, start_date, end_date, 3)
      @login_huanan1 = count_login_user_data(arr_huanan, start_date, end_date, 1, 0)
      @login_huanan2 = count_login_user_data(arr_huanan, start_date, end_date, 1, 1)
      @login_huanan3 = count_login_user_data(arr_huanan, start_date, end_date, 2)
      @login_huanan4 = count_login_user_data(arr_huanan, start_date, end_date, 3)
      @design_huanan1 = count_desgin_data(arr_huanan, start_date, end_date, 1, 0)
      @design_huanan2 = count_desgin_data(arr_huanan, start_date, end_date, 1, 1)
      @design_huanan3 = count_desgin_data(arr_huanan, start_date, end_date, 2)
      @design_huanan4 = count_desgin_data(arr_huanan, start_date, end_date, 3)

      #华中地区（湖北，湖南，河南）
      @reg_huazhong1 = count_reg_user_data(arr_huazhong, start_date, end_date, 1, 0)
      @reg_huazhong2 = count_reg_user_data(arr_huazhong, start_date, end_date, 1, 1)
      @reg_huazhong3 = count_reg_user_data(arr_huazhong, start_date, end_date, 2)
      @reg_huazhong4 = count_reg_user_data(arr_huazhong, start_date, end_date, 3)
      @login_huazhong1 = count_login_user_data(arr_huazhong, start_date, end_date, 1, 0)
      @login_huazhong2 = count_login_user_data(arr_huazhong, start_date, end_date, 1, 1)
      @login_huazhong3 = count_login_user_data(arr_huazhong, start_date, end_date, 2)
      @login_huazhong4 = count_login_user_data(arr_huazhong, start_date, end_date, 3)
      @design_huazhong1 = count_desgin_data(arr_huazhong, start_date, end_date, 1, 0)
      @design_huazhong2 = count_desgin_data(arr_huazhong, start_date, end_date, 1, 1)
      @design_huazhong3 = count_desgin_data(arr_huazhong, start_date, end_date, 2)
      @design_huazhong4 = count_desgin_data(arr_huazhong, start_date, end_date, 3)

      #华北地区（北京，天津，河北，山西，内蒙古）581, 602, 999, 25
      @reg_huabei1 = count_reg_user_data(arr_huabei, start_date, end_date, 1, 0)
      @reg_huabei2 = count_reg_user_data(arr_huabei, start_date, end_date, 1, 1)
      @reg_huabei3 = count_reg_user_data(arr_huabei, start_date, end_date, 2)
      @reg_huabei4 = count_reg_user_data(arr_huabei, start_date, end_date, 3)
      @login_huabei1 = count_login_user_data(arr_huabei, start_date, end_date, 1, 0)
      @login_huabei2 = count_login_user_data(arr_huabei, start_date, end_date, 1, 1)
      @login_huabei3 = count_login_user_data(arr_huabei, start_date, end_date, 2)
      @login_huabei4 = count_login_user_data(arr_huabei, start_date, end_date, 3)
      @design_huabei1 = count_desgin_data(arr_huabei, start_date, end_date, 1, 0)
      @design_huabei2 = count_desgin_data(arr_huabei, start_date, end_date, 1, 1)
      @design_huabei3 = count_desgin_data(arr_huabei, start_date, end_date, 2)
      @design_huabei4 = count_desgin_data(arr_huabei, start_date, end_date, 3)

      #西北地区（宁夏，新疆，青海，陕西，甘肃，内蒙古）
      @reg_xibei1 = count_reg_user_data(arr_xibei, start_date, end_date, 1, 0)
      @reg_xibei2 = count_reg_user_data(arr_xibei, start_date, end_date, 1, 1)
      @reg_xibei3 = count_reg_user_data(arr_xibei, start_date, end_date, 2)
      @reg_xibei4 = count_reg_user_data(arr_xibei, start_date, end_date, 3)
      @login_xibei1 = count_login_user_data(arr_xibei, start_date, end_date, 1, 0)
      @login_xibei2 = count_login_user_data(arr_xibei, start_date, end_date, 1, 1)
      @login_xibei3 = count_login_user_data(arr_xibei, start_date, end_date, 2)
      @login_xibei4 = count_login_user_data(arr_xibei, start_date, end_date, 3)
      @design_xibei1 = count_desgin_data(arr_xibei, start_date, end_date, 1, 0)
      @design_xibei2 = count_desgin_data(arr_xibei, start_date, end_date, 1, 1)
      @design_xibei3 = count_desgin_data(arr_xibei, start_date, end_date, 2)
      @design_xibei4 = count_desgin_data(arr_xibei, start_date, end_date, 3)

      #西南地区（四川，云南，贵州，西藏，重庆）
      @reg_xinan1 = count_reg_user_data(arr_xinan, start_date, end_date, 1, 0)
      @reg_xinan2 = count_reg_user_data(arr_xinan, start_date, end_date, 1, 1)
      @reg_xinan3 = count_reg_user_data(arr_xinan, start_date, end_date, 2)
      @reg_xinan4 = count_reg_user_data(arr_xinan, start_date, end_date, 3)
      @login_xinan1 = count_login_user_data(arr_xinan, start_date, end_date, 1, 0)
      @login_xinan2 = count_login_user_data(arr_xinan, start_date, end_date, 1, 1)
      @login_xinan3 = count_login_user_data(arr_xinan, start_date, end_date, 2)
      @login_xinan4 = count_login_user_data(arr_xinan, start_date, end_date, 3)
      @design_xinan1 = count_desgin_data(arr_xinan, start_date, end_date, 1, 0)
      @design_xinan2 = count_desgin_data(arr_xinan, start_date, end_date, 1, 1)
      @design_xinan3 = count_desgin_data(arr_xinan, start_date, end_date, 2)
      @design_xinan4 = count_desgin_data(arr_xinan, start_date, end_date, 3)

      #东北地区（辽宁，吉林，黑龙江，内蒙古）
      @reg_dongbei1 = count_reg_user_data(arr_dongbei, start_date, end_date, 1, 0)
      @reg_dongbei2 = count_reg_user_data(arr_dongbei, start_date, end_date, 1, 1)
      @reg_dongbei3 = count_reg_user_data(arr_dongbei, start_date, end_date, 2)
      @reg_dongbei4 = count_reg_user_data(arr_dongbei, start_date, end_date, 3)
      @login_dongbei1 = count_login_user_data(arr_dongbei, start_date, end_date, 1, 0)
      @login_dongbei2 = count_login_user_data(arr_dongbei, start_date, end_date, 1, 1)
      @login_dongbei3 = count_login_user_data(arr_dongbei, start_date, end_date, 2)
      @login_dongbei4 = count_login_user_data(arr_dongbei, start_date, end_date, 3)
      @design_dongbei1 = count_desgin_data(arr_dongbei, start_date, end_date, 1, 0)
      @design_dongbei2 = count_desgin_data(arr_dongbei, start_date, end_date, 1, 1)
      @design_dongbei3 = count_desgin_data(arr_dongbei, start_date, end_date, 2)
      @design_dongbei4 = count_desgin_data(arr_dongbei, start_date, end_date, 3)

      @areas = Area.roots
      @city_reg1 = {}
      @city_reg2 = {}
      @city_reg3 = {}
      @city_reg4 = {}
      @city_login1 = {}
      @city_login2 = {}
      @city_login3 = {}
      @city_login4 = {}
      @city_design1 = {}
      @city_design2 = {}
      @city_design3 = {}
      @city_design4 = {}

      @areas.each do |area|
        @city_reg1.merge!(area.id => count_reg_user_data(area.leaves.map{|l| l.id}, start_date, end_date, 1, 0))
        @city_reg2.merge!(area.id => count_reg_user_data(area.leaves.map{|l| l.id}, start_date, end_date, 1, 1))
        @city_reg3.merge!(area.id => count_reg_user_data(area.leaves.map{|l| l.id}, start_date, end_date, 2))
        @city_reg4.merge!(area.id => count_reg_user_data(area.leaves.map{|l| l.id}, start_date, end_date, 3))

        @city_login1.merge!(area.id => count_login_user_data(area.leaves.map{|l| l.id}, start_date, end_date, 1, 0))
        @city_login2.merge!(area.id => count_login_user_data(area.leaves.map{|l| l.id}, start_date, end_date, 1, 1))
        @city_login3.merge!(area.id => count_login_user_data(area.leaves.map{|l| l.id}, start_date, end_date, 2))
        @city_login4.merge!(area.id => count_login_user_data(area.leaves.map{|l| l.id}, start_date, end_date, 3))

        @city_design1.merge!(area.id => count_desgin_data(area.leaves.map{|l| l.id}, start_date, end_date, 1, 0))
        @city_design2.merge!(area.id => count_desgin_data(area.leaves.map{|l| l.id}, start_date, end_date, 1, 1))
        @city_design3.merge!(area.id => count_desgin_data(area.leaves.map{|l| l.id}, start_date, end_date, 2))
        @city_design4.merge!(area.id => count_desgin_data(area.leaves.map{|l| l.id}, start_date, end_date, 3))
      end
    end

    #统计注册数
    def count_reg_user_data(area, start_date, end_date, role_id, des_status="")
      if des_status == ""
        User.where(:created_at => start_date..end_date).where("role_id = ?", role_id).where("users.area_id in (?)", area).count
      else
        User.where(:created_at => start_date..end_date).where("role_id = ? AND des_status = ?", role_id, des_status).where("users.area_id in (?)", area).count
      end
    end

    #统计登录数
    def count_login_user_data(area, start_date, end_date, role_id, des_status="")
      if des_status == ""
        User.where(:created_at => start_date..end_date).where("role_id = ? ",role_id).where("users.area_id in (?)", area).where("sign_in_count > 0").count
      else
        User.where(:created_at => start_date..end_date).where("role_id = ? AND des_status = ?",role_id, des_status).where("users.area_id in (?)", area).where("sign_in_count > 0").count
      end
    end

    #统计上传数
    def count_desgin_data(area, start_date, end_date, role_id, des_status="")
      if des_status == ""
        Design.includes(:user).where("designs.created_at" => start_date..end_date).where("users.area_id in (?)", area).where("users.role_id = ?", role_id).count
      else
        Design.includes(:user).where("designs.created_at" => start_date..end_date).where("users.area_id in (?)", area).where("users.role_id = ? AND users.des_status = ?", role_id, des_status).count
      end
    end
  end
end