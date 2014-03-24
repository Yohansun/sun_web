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
    if users_top500.present?
      sample_users = users_top500.to_a.sample(6)
      sample_users.each{|user| designer_names << user.display_name }
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

      sum_latest_users.each{|user| designer_names << user.display_name }
      sum_latest_users.each{|user| designer_phones << user.phone }
    end
    #筛选出设计师名称
    designer_names.compact!
    designer_phones.compact!
    designer_names = designer_names.enum_for(:each_with_index).collect {|a,i| "#{i+1}" +"）（" + a + "）；" }.join("")
    #短信内容
    content_to_user = "亲爱的iColor用户，根据您提交的装修需求，我们为您推荐数位优秀设计师：" + designer_names + "希望您能顺利找到您满意的家装设计师！----【iColor家的设计师】"

    content_to_designer = "亲爱的设计师，iColor推荐来自（#{user_city.name}）的用户，上传了TA的装修需求，户型：#{cubit_fixture_area}㎡；房型：#{cubit_fixture_type}；楼盘名：#{cubit_house_name}，电话：#{cubit_phone}，马上抓紧机会争取订单哦！---- 【iColor家的设计师】"

    designer_phones.each do |phone|
      #发送给同城设计师
      SmsCubit.new(content_to_designer, phone).transmit
      puts phone
    end
    puts content_to_user
    puts content_to_designer
    #发送给提交表单业主
    SmsCubit.new(content_to_user, cubit_phone).transmit if cubit_phone
    puts 'startCubitEmail>>>>>>>>>>>>>>>>>>>>>>>>'
    #发送邮件
    Notifier.cubit_fixture(cubit_fixture_id).deliver
  end
end