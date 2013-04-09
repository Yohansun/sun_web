# -*- encoding : utf-8 -*-

desc "导出icolor注册数据中家装公司的历史记录"
task :export_user_message => :environment  do
  user_arr = []
  user_arr << ['省份','城市','用户名','邮件地址','联系电话', '收件地址', '作品数', '注册时间', '是否为招募', '所属公司']
  users = User.where(role_id: 2)
  users.each do |user|
    province = user.city.try(:parent).try(:name)
    city = user.city.try(:name)
    username = user.username
    email = user.email
    phone = user.phone
    recipient_address = user.recipient_address
    design_count = user.designs.count
    created_at = user.created_at
    if user.is_imported == false
      is_imported = '否'
    else
      is_imported = '是'
    end
    company = user.name_of_company
    user_arr << [province,city,username,email,phone,recipient_address,
                  design_count,created_at,is_imported,company]
  end

  CSV.open("#{Rails.root}/lib/data/export_user_message.csv", 'wb') do |csv|
    user_arr.each {|f| csv << f}
  end
end