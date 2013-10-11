# -*- encoding: utf-8 -*-

desc "查询用户投票"
task :check_user_design_vote => :environment  do
  tmp = []
  votes = Vote.where("updated_at > '2013-09-30' and voteable_type = 'Design' and user_id is not null").order("updated_at desc")
  votes.each do |vote|
    design = Design.find vote.voteable_id
    user = User.find vote.user_id
    if user.sex == "1"
      sex = '男'
    else
      sex = '女'
    end
    if user.name
      name = user.name.gsub(/ /,'')
    else
      name = ''
    end
    tmp << "作品展示 #{user.username} #{sex} #{user.role_chn_name} #{name} #{user.phone} #{user.qq} #{user.email} http://www.icolor.com.cn/users/#{design.user.id}/designs/#{vote.voteable_id}"
  end
  CSV.open("#{Rails.root}/lib/data/check_user_design_vote.csv", 'wb') do |csv|
    tmp.each {|f| csv << [f]}
  end
end

task :check_user_inspirations_vote => :environment  do
  tmp = []
  votes = Vote.where("updated_at > '2013-09-30' and voteable_type = 'Inspiration' and user_id is not null").order("updated_at desc")
  votes.each do |vote|
    user = User.find vote.user_id
    if user.sex == "1"
      sex = '男'
    else
      sex = '女'
    end
    if user.name
      name = user.name.gsub(/ /,'')
    else
      name = ''
    end
    tmp << "灵感秀 #{user.username} #{sex} #{user.role_chn_name} #{name} #{user.phone} #{user.qq} #{user.email} http://www.icolor.com.cn/inspirations/#{vote.voteable_id}"
  end
  CSV.open("#{Rails.root}/lib/data/check_user_inspirations_vote.csv", 'wb') do |csv|
    tmp.each {|f| csv << [f]}
  end
end

task :check_user_image_vote => :environment  do
  tmp = []
  votes = Vote.where("updated_at > '2013-09-30' and voteable_type = 'Inspiration' and user_id is not null").order("updated_at desc")
  votes.each do |vote|
    user = User.find vote.user_id
    if user.sex == "1"
      sex = '男'
    else
      sex = '女'
    end
    if user.name
      name = user.name.gsub(/ /,'')
    else
      name = ''
    end
    tmp << "灵感秀 #{user.username} #{sex} #{user.role_chn_name} #{name} #{user.phone} #{user.qq} #{user.email} http://www.icolor.com.cn/inspirations/#{vote.voteable_id}"
  end
  CSV.open("#{Rails.root}/lib/data/check_user_image_vote.csv", 'wb') do |csv|
    tmp.each {|f| csv << [f]}
  end
end

task :check_user_stores => :environment  do
  tmp = []
  stores = Story.all
  stores.each do |story|
  name = story.try(:area).try(:parent).try(:name)
    tmp << name
  end
  tmp = tmp.uniq
  CSV.open("#{Rails.root}/lib/data/check_user_stores.csv", 'wb') do |csv|
    tmp.each {|f| csv << [f]}
  end
end




