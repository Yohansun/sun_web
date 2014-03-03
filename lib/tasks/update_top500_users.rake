# -*- encoding: utf-8 -*-
desc "更新top500设计师"
task :update_top500_users => :environment do
  user_ids = [105679, 109274, 109811, 110309, 110322, 110023, 110520, 112623, 104298, 104883, 112589, 113000, 113369, 113796, 104159, 104295, 112500, 104213, 113611, 112890, 122757, 122763, 122781, 113595, 123173, 123174, 123333, 123346, 123391, 123389, 123513, 123164, 123166, 123167, 123169, 123641, 123644, 105081, 123645, 123646, 123669, 123696, 123702, 123715, 123737, 122985, 122919, 124014, 122903, 122882, 122989, 124034, 124049, 124064, 122953, 124068, 122879, 124075, 124076, 124082, 124083, 122979, 122956, 122891, 122994, 124092, 124093, 124095, 122973, 122881, 124102, 124103, 122981, 124104, 124106, 123996, 122877, 122914, 3727, 124678, 124617, 124850, 109419, 125031, 125327, 125339, 125340, 125341, 125350, 111970, 66337, 116579, 104941, 108280, 107335, 117865, 114088, 121152, 120797, 121267, 121154, 119273, 121292, 121141, 121296, 121303, 121463, 120670]
  users = User.where(id: user_ids).update_all(top500: 1)
  p "update_sussecc!"
end

desc "更新top500设计师"
task :update_top500_users_2 => :environment do
  open("#{Rails.root}/lib/data/top500_users.csv").readlines.each do |line|
    username = line.strip
    user = User.find_by_username(username)
    user.update_attribute(:top500, 1) if user
    p "update_sussecc!"
  end
end

desc "重新裁图top500users"
task :reprocess_top500_users => :environment  do
  user_ids = User.where(top500: true).map(&:id)
  images = DesignImage.where(user_id: user_ids)
  num = 0
  images.each do |image|
    image.file.reprocess! if image.file.present?
    num += 1
    p "reprocess_image! #{num}"
  end

end

desc "更新top50用户"
task :update_top50_users => :environment do
  username = ['wangfengbo','daikun','chenzhibin','wangxiaogen','heyongming','liyizhong','jianghuiting',
    'liuweiting','xiaoaibin','zhenghong','zhengshufen','xieyingkai','youweizhuang','zhaomuhuan','geyaxi',
    'liuweijun','wuxiaowei','chensong','zhangjizhong','fangjun','hongyuese','shidiwei','yizhengqihua',
    'liangjinghua','huangzhida','linweier','tanjingzhong'
  ]
  users = User.where(username: username).update_all(top50: 1)
  p "update_sussecc!"
end