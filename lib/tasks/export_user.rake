# -*- encoding : utf-8 -*-

desc "导出icolor注册数据中设计师在职的历史记录"
task :export_user_message => :environment  do
  user_arr = []
  user_arr << ['省份','城市','用户名','真实姓名','邮件地址','联系电话', '收件地址', '作品数', '注册时间', '是否为招募', '所属公司']
  users = User.where(role_id: 1, des_status: false)
  users.each do |user|
    province = "#{user.city.try(:parent).try(:name)}"
    city = "#{user.city.try(:name)}"
    username = "#{user.username}"
    name = "#{user.name}"
    email = "#{user.email}"
    phone = "#{user.phone}"
    recipient_address = "#{user.recipient_address}"
    design_count = "#{user.designs.count}"
    created_at = "#{user.created_at.to_date}"
    if user.is_imported == false
      is_imported = '否'
    else
      is_imported = '是'
    end
    company = "#{user.name_of_company}"
    user_arr << [province,city,username,name,email,phone,recipient_address,
                  design_count,created_at,is_imported,company]
  end

  CSV.open("#{Rails.root}/lib/data/export_user_message.csv", 'wb') do |csv|
    user_arr.each {|f| csv << f}
  end
end

desc "导出icolor注册数据中设计师在读的历史记录"
task :export_user_message2 => :environment  do
  user_arr = []
  user_arr << ['省份','城市','用户名','真实姓名','邮件地址','联系电话', '收件地址', '作品数', '注册时间', '是否为招募']
  users = User.where(role_id: 1, des_status: true)
  users.each do |user|
    province = "#{user.city.try(:parent).try(:name)}"
    city = "#{user.city.try(:name)}"
    username = "#{user.username}"
    name = "#{user.name}"
    email = "#{user.email}"
    phone = "#{user.phone}"
    recipient_address = "#{user.recipient_address}"
    design_count = "#{user.designs.count}"
    created_at = "#{user.created_at.to_date}"
    if user.is_imported == false
      is_imported = '否'
    else
      is_imported = '是'
    end
    user_arr << [province,city,username,name,email,phone,recipient_address,
                  design_count,created_at,is_imported,]
  end

  CSV.open("#{Rails.root}/lib/data/export_user_message2.csv", 'wb') do |csv|
    user_arr.each {|f| csv << f}
  end
end

desc "导出icolor注册数据"
task :export_user_message3 => :environment  do
  user_arr = []
  user_arr << ['id','登录名','真实姓名','email','手机','省','市', '区', '注册时间']
  users = User.where("phone in (18717144322,13247110481,18671402771,18627745490,13296653318,15927122044,13554246626,15337118767,15327196068,18702744447,15307141257,15926478811,18672366614,13971562579,13307147298,18062774319,18108676820,13871420122,13971457723,13667111828,13871077794,13607154586,13545149831,13437264354,18971357370,13667150303,18086098428,13797044556,15337105002,13707175891,18602736295,13429875838,15994250299,18971202455,13329720050,15071279937,13026176341,15827392865,13487087796,18672354572,13554344903,15972215779,15907163263,13707130661,15337175950,4006508408,15607157768,18963997663,15623029416,15068750800,15527501839,15972087791,18971511637,13908626749,13871292241,15927185157,15872434109,15335891152,13036154604,18807354858,15927533866)")
  users.each do |user|

    province = "#{user.city.try(:parent).try(:name)}"
    city = "#{user.city.try(:name)}"
    area = "#{user.area.name}"
    username = "#{user.username}"
    name = "#{user.name}"
    email = "#{user.email}"
    phone = "#{user.phone}"
    created_at = "#{user.created_at.to_date}"
    user_arr << [user.id, username, name, email, phone, province, city, area, created_at]
  end

  CSV.open("#{Rails.root}/lib/data/export_user_#{Time.now}.csv", 'wb') do |csv|
    user_arr.each {|f| csv << f}
  end
end