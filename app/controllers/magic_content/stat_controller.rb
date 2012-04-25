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

      @lands = Land.select("source, count(*) as count").where(:created_at => start_date..end_date).group(:source)
    end
  end
end