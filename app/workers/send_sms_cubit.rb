# encoding: utf-8
class SendSmsCubit
  include Sidekiq::Worker
  sidekiq_options :queue => :sms_cubit, :retry => false, :backtrace => true

  def perform(cubit_area_id, cubit_fixture_area, cubit_fixture_type, cubit_house_name, cubit_phone, cubit_fixture_id)
    puts 'startSendSmsCubit>>>>>>>>>>>>>>>>>>>>>>>>'
    # 同城IDS
    user_city = Area.find_by_id(cubit_area_id).root
    area_ids = user_city.self_and_descendants.map(&:id)
    # 同城TOP500
    users_top500 = User.where(top500: 1, area_id: area_ids)
    designer_names = []
    designer_phones = []
    designer_ids = []
    #标记是否有同城设计师
    users_top500_present = 0
    if users_top500.present?
      users_top500_present = 1
      sample_users = users_top500.joins(:designs).order("designs.id desc").group("designs.user_id").limit(6)
      sample_users.each{|user| designer_names << user.display_name + " " + user.phone }
      sample_users.each{|user| designer_ids << user.id }
      users_top500.each{|user| designer_phones << user.phone }
    else
      #最新上传和最新每周之星6名
      sum_latest_users = []
      latest_design_user_ids = Design.order("id DESC").limit(10).map(&:user_id).uniq[0..2]
      latest_design_users = User.where(id: latest_design_user_ids)
      latest_weekly_star = WeeklyStar.where(star_type_id: 1).order("published_at desc").limit(3)
      design_ids = latest_weekly_star.map {|star| star.design_link.split('/').last }
      latest_weekly_star_user_ids = Design.where(id: design_ids).map(&:user_id)
      latest_weekly_star_users = User.where(id: latest_weekly_star_user_ids)

      sum_latest_users << latest_design_users.to_a << latest_weekly_star_users.to_a
      sum_latest_users = sum_latest_users.flatten.uniq

      sum_latest_users.each{|user| designer_names << user.display_name + " " + user.phone }
      sum_latest_users.each{|user| designer_ids << user.id }
      # sum_latest_users.each{|user| designer_phones << user.phone }
    end
    #筛选出设计师名称
    designer_names.compact!
    designer_phones.compact!
    designer_ids.compact!
    designer_names = designer_names.enum_for(:each_with_index).collect {|a,i| "#{i+1}" +"）（" + a + "）；" }.join("")
    #短信内容
    content_to_user = "亲爱的iColor用户，根据您提交的装修需求，我们为您推荐如下几位优秀设计师：" + designer_names + "祝您顺利找到中意的一位，为您度身定制您的爱家！ ----【iColor家的设计师www.icolor.com.cn]"
    content_to_designer = "亲爱的设计师，iColor推荐来自（#{user_city.name}）的用户，上传了TA的装修需求，楼盘名：#{cubit_house_name}，电话：#{cubit_phone}，马上抓紧机会争取订单哦！记得联络时要表明您是iColor设计师哦！---- 【iColor家的设计师www.icolor.com.cn]"
    #只发送给同城设计师
    if designer_phones.present?
      designer_phones.each do |phone|
        SmsCubit.new(content_to_designer, phone).transmit
        puts phone
      end
    end
    puts content_to_user
    puts content_to_designer
    #发送给提交表单业主
    SmsCubit.new(content_to_user, cubit_phone).transmit if cubit_phone
    puts 'startCubitEmail>>>>>>>>>>>>>>>>>>>>>>>>'
    #发送邮件
    Notifier.cubit_fixture(cubit_fixture_id, designer_ids, users_top500_present).deliver
    #保存提交表单业主短信设计师列表
    cubit_user = CubitFixture.find_by_id(cubit_fixture_id)
    cubit_user.update_attribute(:designer_id_list,designer_ids) if cubit_user
  end
end