# -*- encoding: UTF-8 -*-
desc "导出元宵节参加活动人数据"
task :export_lantern => :environment  do
  CSV.open("#{Rails.root}/lib/data/#{Time.now.to_date}_元宵节活动.csv", "wb") do |csv|
      csv << ['用户名','真实姓名','电话', '邮箱', '地址', '中奖内容','是否转发']
      Lantern.find_each do |lan|
        user = User.find(lan.user_id)
        csv << [user.username, user.name, user.phone, user.email, user.recipient_address, lan.content, lan.forwar]
      end
  end
end

task :export_lantern_user => :environment  do
  CSV.open("#{Rails.root}/lib/data/#{Time.now.to_date}_元宵节活动分享.csv", "wb") do |csv|
      csv << ['用户名','分享社交']
      ForwarUser.find_each do |fu|
        csv << [fu.username, fu.genre]
      end
  end
end