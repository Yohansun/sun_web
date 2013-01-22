# -*- encoding: utf-8 -*-
desc "更新用户招募121"
task :source_user_121 => :environment  do
  tmp = []
  open("#{Rails.root}/lib/data/user_121.csv").readlines.each do |line|
    row = line.split(",")
    puts "starting................"
    username = row[0] ? row[0].strip.force_encoding("UTF-8") : nil
    phone = row[1] ? row[1].strip.force_encoding("UTF-8") : nil
    email = row[2] ? row[2].strip.force_encoding("UTF-8") : nil
    user = User.where("name like '%#{username}%' OR username like '%#{username}%' OR name_of_company like '%#{username}%'").first
    if user.present?
      user.is_imported = true
      user.save!(:validate => false)
      puts "user======>>> %s" % user.id
    else
      u = User.new(:username => username,:phone => phone,:email => email,:password => "123456",:password_confirmation => "123456",:is_imported => true)
      if u.save!(:validate => false)
        puts "user===创建成功==>>> %s" % row[0]
      else
        puts "user====创建失败==>>> %s" % row[0]
        tmp << [row[0],row[1],row[2]]
      end
    end
  end
  CSV.open("#{Rails.root}/lib/data/failedtasks_121.csv", 'wb') do |csv|
    tmp.each {|f| csv << f}
  end
end