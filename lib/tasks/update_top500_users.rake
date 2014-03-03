# -*- encoding: utf-8 -*-
desc "更新top500设计师"
task :update_top500_users => :environment do
  #reset top500
  User.where(top500: true).update_all(top500: 0)
  user_ids = [125491, 125492, 125493, 125494, 125495, 125496, 125497, 125498, 125499, 125527, 125528, 125529, 125530, 125531, 125532, 125533, 125534, 125535, 125536, 125537, 125538, 125539, 125540, 125541, 125542, 125543, 125544, 125545, 125546, 125547, 125548, 125549, 125550, 125551, 125552, 125553, 125554, 125555, 125556, 125557, 125558, 125559, 125560, 125561, 125562, 125563, 125564, 125565, 125566, 125567, 125568, 125569, 125570, 125621, 125571, 125572, 125573, 125574, 125575, 125576, 125577, 125578, 125579, 125580, 125594, 125595, 125596, 125597, 125598, 125599, 125600, 125601, 125602, 125603, 125604, 125605, 125606, 125607, 125608, 125593, 125592, 125591, 125590, 125589, 125588, 125587, 125586, 125585, 125584, 125583, 125582, 125581, 119558, 120919, 110574, 68393, 111506, 108671, 117420, 103507, 107340, 110779, 108276, 111494, 111511, 111482, 119562, 117318, 119554, 117899, 108469, 109717, 107736, 107683, 107686, 108132, 108131, 111466, 120858, 110711, 110703, 110656, 121426, 120229, 121411, 119873, 120646, 121370, 108560, 108463, 108460, 108468, 120624, 116579, 103820, 111190, 121152, 107581, 107551, 109563, 109562, 109586, 109606, 110598, 110979, 110986, 110673, 110833, 110551, 111205, 121154, 103675, 103701, 103684, 121296, 103563, 103589, 103677, 103697, 103560, 108284, 108054, 107879, 115402, 68359, 115459, 118931, 115476, 121292, 109525, 114097, 114027, 110003, 107335, 108690, 108736, 104005, 104034, 109982]
  users = User.where(id: user_ids).update_all(top500: 1)
  p "update_sussecc!"
end

desc "aa删除作品500top为null的"
task :remove_null_designs => :environment  do
  n = 0
  designs = Design.joins(:user).where(:users => {:top500 => true})
  designs.each do |design|
    if design.design_images.count < 1
      n += 1
      design.destroy
      p "delete #{n}"
    end
  end
  p 'delete all finished!'
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