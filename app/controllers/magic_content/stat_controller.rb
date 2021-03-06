# -*- encoding : utf-8 -*-
module MagicContent
  class StatController < BaseController
    layout 'magic_admin/application'

    skip_load_and_authorize_resource

    AREA_IDS = {
      'HUADONG'  => [1,44,184,432,1142,2881,3198],
      'HUANAN'   => [2985,3032,3452],
      'HUAZHONG' => [297,801,2730],
      'HUABEI'   => [24,580,602,999],
      'XIBEI'    => [1658,1740,2334,2482,2515,3324],
      'XINAN'    => [1615,1855,1994,2102,2394],
      'DONGBEI'  => [1322,1457,2647]
    }

    def index
      #初始化查询时间
      if params[:start_date].blank?
        params[:start_date] = Time.now.beginning_of_week.to_date.to_s
      end

      if params[:end_date].blank?
        params[:end_date] = Time.now.end_of_week.to_date.to_s
      end

      params[:start_date] += " 00:00:00"
      params[:end_date]   += " 23:59:59"

      begin_t = params[:start_date].to_time(:local)
      end_t   = params[:end_date].to_time(:local)

      #查询时间段内创建的用户
      users = User.select("role_id,created_at,area_id,des_status,sign_in_count").where(:created_at => begin_t..end_t).where("source is null")

      role = {}
      role['zz'] = users.where(role_id: 1,des_status: false)
      role['zd'] = users.where(role_id: 1,des_status: true)
      role['gs'] = users.where(role_id: 2)
      role['pt'] = users.where(role_id: 3)

      #自然和招募数据 查询时间段内创建的作品
      all_designs = Design.includes(:user).includes(:design_images).where('design_images.file_file_size > 0').where("designs.created_at" => begin_t..end_t).where("users.source is null")

      designs = {}
      designs['zz'] = all_designs.where('users.role_id = ? AND users.des_status = ?', 1, false)
      designs['zd'] = all_designs.where('users.role_id = ? AND users.des_status = ?', 1, true)
      designs['gs'] = all_designs.where('users.role_id = ?', 2)
      designs['pt'] = all_designs.where('users.role_id = ?', 3)

      ##第三方连接进入icolor
      land_sql_conditions = "SELECT source, count(source) as count
                             FROM `lands`
                             WHERE (`lands`.`created_at` BETWEEN '#{begin_t}' AND '#{end_t}')
                             GROUP BY source"
      @lands = Land.find_by_sql land_sql_conditions

      #统计注册用户
      @reg_count1 = role['zz'].where(is_imported: false).count
      @reg_count1_imported = role['zz'].where(is_imported: true).count
      @reg_count2 = role['zd'].where(is_imported: false).count
      @reg_count2_imported = role['zd'].where(is_imported: true).count
      @reg_count3 = role['gs'].where(is_imported: false).count
      @reg_count3_imported = role['gs'].where(is_imported: true).count
      @reg_count4 = role['pt'].count

      #统计上传作品用户
      @design_count1 = designs['zz'].where('users.is_imported = ?', false).count
      @design_count1_imported = designs['zz'].where('users.is_imported = ?', true).count
      @design_count2 = designs['zd'].where('users.is_imported = ?', false).count
      @design_count2_imported = designs['zd'].where('users.is_imported = ?', true).count
      @design_count3 = designs['gs'].where('users.is_imported = ?', false).count
      @design_count3_imported = designs['gs'].where('users.is_imported = ?', true).count
      @design_count4 = designs['pt'].count

      #统计登录过的用户
      @reg_and_login_count1 = role['zz'].where(is_imported: false).where('sign_in_count > 0').count
      @reg_and_login_count1_imported = role['zz'].where(is_imported: true).where('sign_in_count > 0').count
      @reg_and_login_count2 = role['zd'].where(is_imported: false).where('sign_in_count > 0').count
      @reg_and_login_count2_imported = role['zd'].where(is_imported: true).where('sign_in_count > 0').count
      @reg_and_login_count3 = role['gs'].where(is_imported: false).where('sign_in_count > 0').count
      @reg_and_login_count3_imported = role['gs'].where(is_imported: true).where('sign_in_count > 0').count
      @reg_and_login_count4 = role['pt'].where('sign_in_count > 0').count

      #注册没有登录的用户
      @reg_not_login_count1 = @reg_count1 - @reg_and_login_count1
      @reg_not_login_count1_imported = @reg_count1_imported - @reg_and_login_count1_imported
      @reg_not_login_count2 = @reg_count2 - @reg_and_login_count2
      @reg_not_login_count2_imported = @reg_count2_imported - @reg_and_login_count2_imported
      @reg_not_login_count3 = @reg_count3 - @reg_and_login_count3
      @reg_not_login_count3_imported = @reg_count3_imported - @reg_and_login_count3_imported
      @reg_not_login_count4 = @reg_count4 - @reg_and_login_count4

      #新浪和科普兰德 导入数据作品数
      import_designs = Design.includes(:user).includes(:design_images).where('design_images.file_file_size > 0').where("designs.created_at" => begin_t..end_t)

      imp_designs = {}
      imp_designs['zz'] = import_designs.where('users.role_id = ? AND users.des_status = ?', 1, false)
      imp_designs['zd'] = import_designs.where('users.role_id = ? AND users.des_status = ?', 1, true)
      imp_designs['gs'] = import_designs.where('users.role_id = ?', 2)
      imp_designs['pt'] = import_designs.where('users.role_id = ?', 3)

      #sina发表作品数
      @sina_design_count1 = imp_designs['zz'].where("design_images.source = 'sina'").count
      @sina_design_count2 = imp_designs['zd'].where("design_images.source = 'sina'").count
      @sina_design_count3 = imp_designs['gs'].where("design_images.source = 'sina'").count

      #科普兰德发表作品数
      @kepulande_design_count1 = imp_designs['zz'].where("design_images.source = 'kepulande'").count
      @kepulande_design_count2 = imp_designs['zd'].where("design_images.source = 'kepulande'").count
      @kepulande_design_count3 = imp_designs['gs'].where("design_images.source = 'kepulande'").count

      ##片区活跃度
      ##华东地区（山东，江苏，安徽，江西，浙江，福建，上海）
      ##华南地区（广东，广西，海南）
      ##华中地区（湖北，湖南，河南）
      ##华北地区（北京，天津，河北，山西）
      ##西北地区（宁夏，新疆，青海，陕西，甘肃，内蒙古）
      ##西南地区（四川，云南，贵州，西藏，重庆）
      ##东北地区（辽宁，吉林，黑龙江）

      @data = {}
      AREA_IDS.each_pair do |key,value|
        @data[key]  = [].tap do |tmp_a|
                        value.each do |key|
                        area = Area.select("id,name,lft,rgt").find key
                        area_ids = area.self_and_descendants.map(&:id)

                        tmp_a << {}.tap do |hash|
                          hash['id'] = key
                          hash['name'] = area.name

                          ['zz','zd','gs','pt'].each do |r|
                            hash[r] = {}
                            hash[r]['reg']    = role[r].where("area_id in (?)", area_ids).count
                            hash[r]['login']  = role[r].where('sign_in_count > ? and area_id in (?)', 0, area_ids).count
                            hash[r]['design'] = designs[r].select{|design| area_ids.include?(design.user.area_id)}.count
                          end
                        end
                      end
        end
      end
    end
  end
end